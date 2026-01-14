#!/bin/bash
# Verification script for sf-bench-part1 translations
# Usage: verify result-N
#
# Verifies a single result by:
# 1. Checking Lean compilation
# 2. Compiling the Rocq Checker (proves isomorphism)
#
# IMPORTANT: Mount host directory at /host, NOT /workdir:
#   docker run --rm -v $(pwd):/host sf-bench-part1 verify result-1

set -e

# Container's pre-compiled theories (never shadow this with a mount!)
THEORIES_DIR="/workdir/theories"

# Results: prefer /host/results (mounted), fall back to /workdir/results (baked in)
if [ -d "/host/results" ]; then
    RESULTS_DIR="/host/results"
else
    RESULTS_DIR="/workdir/results"
fi

# Ensure opam environment is loaded
eval $(opam env) 2>/dev/null || true

usage() {
    echo "Usage: $0 <result-N>"
    echo ""
    echo "Verifies a single translation result."
    echo ""
    echo "Example:"
    echo "  docker run --rm -v \$(pwd):/host sf-bench-part1 verify result-1"
    exit 1
}

ADDED_ISO_FILES=""
cleanup() {
    # Clean up Checker folder
    rm -rf "$THEORIES_DIR/Checker"
    # Clean up Imported files
    rm -f "/workdir/Imported.out" "$THEORIES_DIR/Imported.vo" "$THEORIES_DIR/Imported.vok" "$THEORIES_DIR/Imported.vos" "$THEORIES_DIR/Imported.glob"
    # Remove result-specific Isomorphisms files (both .v and compiled files)
    for f in $ADDED_ISO_FILES; do
        rm -f "$f" "${f%.v}.vo" "${f%.v}.vok" "${f%.v}.vos" "${f%.v}.glob"
    done
}

# Set up cleanup on exit
trap cleanup EXIT

if [ -z "$1" ] || [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    usage
fi

RESULT_NAME="$1"
RESULT_DIR="$RESULTS_DIR/$RESULT_NAME"

if [ ! -d "$RESULT_DIR" ]; then
    echo "Error: $RESULT_DIR does not exist"
    exit 1
fi

echo "=== Verifying $RESULT_NAME ==="
echo ""

# Step 1: Verify Lean compilation
echo "Step 1: Checking Lean compilation..."
if [ -f "$RESULT_DIR/solution.lean" ]; then
    if lean "$RESULT_DIR/solution.lean" 2>&1; then
        echo "  ✓ Lean compiles successfully"
    else
        echo "  ✗ Lean compilation failed"
        exit 1
    fi
else
    echo "  ✗ solution.lean not found"
    exit 1
fi
echo ""

# Step 2: Verify Rocq Checker compiles
echo "Step 2: Checking Rocq Checker compilation..."

# Copy lean.out as Imported.out (in /workdir, where Imported.v expects it)
cp "$RESULT_DIR/lean.out" "/workdir/Imported.out"
echo "  Copied lean.out as Imported.out"

# Copy result-specific Isomorphisms files into existing folder (merge, not replace)
# Also strip "Typeclasses Opaque rel_iso" which fails because rel_iso is a Record, not a Definition
if [ -d "$RESULT_DIR/theories/Isomorphisms" ]; then
    for f in "$RESULT_DIR/theories/Isomorphisms"/*.v; do
        if [ -f "$f" ]; then
            fname=$(basename "$f")
            # Copy file, stripping the problematic Typeclasses Opaque line
            sed '/^Typeclasses Opaque rel_iso/d' "$f" > "$THEORIES_DIR/Isomorphisms/$fname"
            ADDED_ISO_FILES="$ADDED_ISO_FILES $THEORIES_DIR/Isomorphisms/$fname"
        fi
    done
    echo "  Copied result-specific Isomorphisms files (stripped Typeclasses Opaque rel_iso)"
fi

# Copy Checker folder from the result
if [ -d "$RESULT_DIR/theories/Checker" ]; then
    cp -r "$RESULT_DIR/theories/Checker" "$THEORIES_DIR/"
    echo "  Copied Checker folder"
fi

# Work from /workdir to match Docker image's Makefile.coq paths
cd /workdir

# Regenerate Makefile.coq to include new Isomorphisms/Checker files
echo "  Regenerating Makefile.coq..."
echo "-Q theories IsomorphismChecker" > _CoqProject
find theories -name "*.v" | sort >> _CoqProject
coq_makefile -f _CoqProject -o Makefile.coq 2>/dev/null

# Compile Imported.v using make
echo "  Compiling Imported.v..."
make -f Makefile.coq theories/Imported.vo 2>&1 | grep -v "Warning:" || true

# Compile only result-specific Isomorphisms files (base files reference types not in this result's lean.out)
echo "  Compiling result-specific Isomorphisms..."
if [ -n "$ADDED_ISO_FILES" ]; then
    for f in $ADDED_ISO_FILES; do
        # Use relative path for make (Makefile.coq uses relative paths)
        rel_path=$(echo "$f" | sed 's|^/workdir/||')
        vo_file="${rel_path%.v}.vo"
        make -f Makefile.coq "$vo_file" 2>&1 || {
            echo "  ✗ Failed to compile: $f"
            exit 1
        }
    done
fi

# Compile Checker files using make
echo "  Compiling Checker..."
if ls theories/Checker/*.v 1>/dev/null 2>&1; then
    find theories/Checker -type f -name "*.v" -exec echo "{}o" \; | xargs make -f Makefile.coq 2>&1 || {
        echo "  ✗ Failed to compile Checker"
        exit 1
    }
fi

# Verify .vo files were created
if ls theories/Checker/*.vo 1>/dev/null 2>&1; then
    echo "  ✓ Rocq Checker compiles successfully"
else
    echo "  ✗ Checker .vo files not created"
    exit 1
fi

echo ""
echo "=== $RESULT_NAME verified successfully ==="
