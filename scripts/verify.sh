#!/bin/bash
# Verification script for sf-bench-part1 translations
# Usage: ./scripts/verify.sh result-N    - Verify a single result
#        ./scripts/verify.sh --all       - Verify all results
#
# Verifies translations by:
# 1. Checking Lean compilation
# 2. Compiling the Rocq Checker (proves isomorphism)
#
# Automatically runs inside Docker when invoked from the host.

# Detect if we're running inside Docker
if [ ! -f "/.dockerenv" ] && [ ! -d "/workdir/theories" ]; then
    # Running on host - re-invoke via Docker
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

    # Check for --rebuild flag (must be parsed before Docker invocation)
    REBUILD=false
    ARGS=()
    for arg in "$@"; do
        if [ "$arg" == "--rebuild" ]; then
            REBUILD=true
        else
            ARGS+=("$arg")
        fi
    done

    # Build the Docker image if it doesn't exist or --rebuild is set
    if [ "$REBUILD" = true ]; then
        echo "Rebuilding Docker image 'sf-bench-part1'..."
        docker build -t sf-bench-part1 "$PROJECT_DIR"
    elif ! docker image inspect sf-bench-part1 >/dev/null 2>&1; then
        echo "Docker image 'sf-bench-part1' not found. Building..."
        docker build -t sf-bench-part1 "$PROJECT_DIR"
    fi

    exec docker run --rm -v "$PROJECT_DIR:/host" sf-bench-part1 verify "${ARGS[@]}"
fi

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

# Flag defaults (can be overridden by command-line arguments)
ERROR_ON_EXPORT_DIFF=false
USE_REFERENCE_OUT=false

usage() {
    echo "Usage: $0 [options] <result-N | --all>"
    echo ""
    echo "Verifies translation results."
    echo ""
    echo "Options:"
    echo "  --rebuild                Rebuild the Docker image before running"
    echo "  --error-on-export-diff   Treat export differences as errors (default: warning)"
    echo "  --use-reference-out      Use reference lean.out instead of generated export"
    echo ""
    echo "Examples:"
    echo "  ./scripts/verify.sh result-1"
    echo "  ./scripts/verify.sh --all"
    echo "  ./scripts/verify.sh --error-on-export-diff result-1"
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
    ADDED_ISO_FILES=""
}

# Verify a single result
# Arguments: $1 = result name (e.g., "result-1")
# Returns: 0 on success, 1 on failure
verify_single() {
    local RESULT_NAME="$1"
    local RESULT_DIR="$RESULTS_DIR/$RESULT_NAME"

    if [ ! -d "$RESULT_DIR" ]; then
        echo "Error: $RESULT_DIR does not exist"
        return 1
    fi

    # Check for scores.json
    if [ ! -f "$RESULT_DIR/scores.json" ]; then
        echo "Error: $RESULT_DIR/scores.json not found"
        return 1
    fi

    # Extract isomorphism names from scores.json (keys of the JSON object)
    local iso_names=$(grep -o '"[^"]*":' "$RESULT_DIR/scores.json" | sed 's/"//g; s/://g')

    echo "=== Verifying $RESULT_NAME ==="
    echo ""

    # Step 1: Verify Lean compilation
    echo "Step 1: Checking Lean compilation..."
    if [ -f "$RESULT_DIR/solution.lean" ]; then
        if lean "$RESULT_DIR/solution.lean" 2>&1; then
            echo "  ✓ Lean compiles successfully"
        else
            echo "  ✗ Lean compilation failed"
            return 1
        fi
    else
        echo "  ✗ solution.lean not found"
        return 1
    fi
    echo ""

    # Step 2: Generate and verify lean4export output
    echo "Step 2: Generating lean4export output..."

    # Check for export_definitions.txt
    if [ ! -f "$RESULT_DIR/export_definitions.txt" ]; then
        echo "  ✗ export_definitions.txt not found"
        return 1
    fi

    # Generate export output
    local generated_out="/tmp/generated_export_$$.out"
    pushd "$RESULT_DIR" > /dev/null
    if lake env lean4export solution -- $(cat export_definitions.txt | tr ' ' '\0' | xargs -0 printf '%q ') > "$generated_out" 2>&1; then
        echo "  ✓ lean4export completed"
    else
        echo "  ✗ lean4export failed:"
        cat "$generated_out"
        popd > /dev/null
        rm -f "$generated_out"
        return 1
    fi
    popd > /dev/null

    # Compare with reference
    echo "  Comparing with reference lean.out..."
    if ! diff -q "$generated_out" "$RESULT_DIR/lean.out" > /dev/null 2>&1; then
        echo "  Differences found between generated export and reference:"
        diff "$RESULT_DIR/lean.out" "$generated_out" | head -20
        if [ "$ERROR_ON_EXPORT_DIFF" = true ]; then
            echo "  ✗ Export differs from reference (--error-on-export-diff)"
            rm -f "$generated_out"
            return 1
        else
            echo "  ⚠ Warning: Export differs from reference"
        fi
    else
        echo "  ✓ Export matches reference"
    fi

    # Copy appropriate output
    if [ "$USE_REFERENCE_OUT" = true ]; then
        echo "  Using reference lean.out"
        cp "$RESULT_DIR/lean.out" "/workdir/Imported.out"
    else
        echo "  Using generated export"
        cp "$generated_out" "/workdir/Imported.out"
    fi
    rm -f "$generated_out"
    echo ""

    # Step 3: Copy and compile Isomorphisms files
    echo "Step 3: Copying and compiling Isomorphisms files..."

    # Copy ALL Isomorphisms files (some are dependencies not in scores.json)
    local iso_count=0
    if [ -d "$RESULT_DIR/theories/Isomorphisms" ]; then
        for f in "$RESULT_DIR/theories/Isomorphisms"/*.v; do
            if [ -f "$f" ]; then
                fname=$(basename "$f")
                cp "$f" "$THEORIES_DIR/Isomorphisms/$fname"
                ADDED_ISO_FILES="$ADDED_ISO_FILES $THEORIES_DIR/Isomorphisms/$fname"
                iso_count=$((iso_count + 1))
            fi
        done
    fi
    echo "  Copied $iso_count Isomorphisms files"

    # Copy ALL Checker files
    mkdir -p "$THEORIES_DIR/Checker"
    local checker_count=0
    if [ -d "$RESULT_DIR/theories/Checker" ]; then
        for f in "$RESULT_DIR/theories/Checker"/*.v; do
            if [ -f "$f" ]; then
                cp "$f" "$THEORIES_DIR/Checker/"
                checker_count=$((checker_count + 1))
            fi
        done
    fi
    echo "  Copied $checker_count Checker files"

    # Work from /workdir to match Docker image's Makefile.coq paths
    cd /workdir

    # Regenerate Makefile.coq to include new Isomorphisms/Checker files
    echo "  Regenerating Makefile.coq..."
    echo "-Q theories IsomorphismChecker" > _CoqProject
    find theories -name "*.v" | sort >> _CoqProject
    coq_makefile -f _CoqProject -o Makefile.coq 2>/dev/null

    # Filter function to suppress noisy warnings (reads from stdin, writes to stdout)
    filter_warnings() {
        grep -v -E "(Warning:|output-directory|default-output-directory|module-not-found|filesystem,default|ROCQ DEP|from root IsomorphismChecker|is required|^File \".*.v\", line [0-9]+, characters [0-9]+-[0-9]+:$|is up to date|^\[)" || true
    }

    # Compile Imported.v using make
    echo "  Compiling Imported.v..."
    make -f Makefile.coq theories/Imported.vo 2>&1 | filter_warnings

    # Compile only the Isomorphisms files listed in scores.json
    echo "  Compiling Isomorphisms..."
    for iso_name in $iso_names; do
        local vo_file="theories/Isomorphisms/${iso_name}.vo"
        local v_file="theories/Isomorphisms/${iso_name}.v"
        if [ -f "$v_file" ]; then
            output=$(make -f Makefile.coq "$vo_file" 2>&1)
            status=$?
            echo "$output" | filter_warnings
            if [ $status -ne 0 ]; then
                echo "  ✗ Failed to compile: $v_file"
                return 1
            fi
        fi
    done
    echo "  ✓ Isomorphisms compiled successfully"
    echo ""

    # Step 4: Compile Checker files
    echo "Step 4: Compiling Checker files..."
    for iso_name in $iso_names; do
        local vo_file="theories/Checker/${iso_name}.vo"
        local v_file="theories/Checker/${iso_name}.v"
        if [ -f "$v_file" ]; then
            output=$(make -f Makefile.coq "$vo_file" 2>&1)
            status=$?
            echo "$output" | filter_warnings
            if [ $status -ne 0 ]; then
                echo "  ✗ Failed to compile: $v_file"
                return 1
            fi
        fi
    done

    # Verify at least one .vo file was created
    if ls theories/Checker/*.vo 1>/dev/null 2>&1; then
        echo "  ✓ Checker compiled successfully"
    else
        echo "  ✗ Checker .vo files not created"
        return 1
    fi

    echo ""
    echo "=== $RESULT_NAME verified successfully ==="
    return 0
}

# Verify all results
verify_all() {
    local passed=0
    local failed=0
    local failed_results=""

    # Find all result directories, sorted numerically
    local results=$(find "$RESULTS_DIR" -maxdepth 1 -type d -name 'result-*' | sort -V)

    if [ -z "$results" ]; then
        echo "No results found in $RESULTS_DIR"
        return 0
    fi

    local total=$(echo "$results" | wc -l)

    echo "=== Verifying all $total results ==="
    echo ""

    for result_dir in $results; do
        local result_name=$(basename "$result_dir")

        # Clean up from previous run
        cleanup

        if verify_single "$result_name"; then
            passed=$((passed + 1))
            echo ""
        else
            failed=$((failed + 1))
            failed_results="$failed_results $result_name"
            echo ""
        fi
    done

    # Print summary
    echo ""
    echo "=========================================="
    echo "SUMMARY: $passed passed, $failed failed (out of $total)"
    echo "=========================================="

    if [ $failed -gt 0 ]; then
        echo ""
        echo "Failed results:$failed_results"
        return 1
    fi

    return 0
}

# Main
# Parse arguments
POSITIONAL_ARG=""
while [[ $# -gt 0 ]]; do
    case $1 in
        --error-on-export-diff)
            ERROR_ON_EXPORT_DIFF=true
            shift
            ;;
        --use-reference-out)
            USE_REFERENCE_OUT=true
            shift
            ;;
        --help|-h)
            usage
            ;;
        --all)
            POSITIONAL_ARG="--all"
            shift
            ;;
        -*)
            echo "Unknown option: $1"
            usage
            ;;
        *)
            POSITIONAL_ARG="$1"
            shift
            ;;
    esac
done

if [ -z "$POSITIONAL_ARG" ]; then
    usage
fi

if [ "$POSITIONAL_ARG" == "--all" ]; then
    verify_all
else
    # Set up cleanup on exit for single verification
    trap cleanup EXIT
    verify_single "$POSITIONAL_ARG"
fi
