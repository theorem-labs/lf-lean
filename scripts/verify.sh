#!/bin/bash
# Verification script for sf-bench-part1 translations
# Usage: ./scripts/verify.sh result-N    - Verify a single result
#        ./scripts/verify.sh --all       - Verify all results
#
# Verifies translations by:
# 1. Checking Lean compilation
# 2. Compiling the Rocq Checker (proves isomorphism)
#
# Runs from host, calls Docker for execution.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
RESULTS_DIR="$PROJECT_DIR/results"

# Flag defaults
REBUILD=true
ERROR_ON_EXPORT_DIFF=false
USE_REFERENCE_OUT=true

usage() {
    echo "Usage: $0 [options] <result-N | --all>"
    echo ""
    echo "Verifies translation results."
    echo ""
    echo "Options:"
    echo "  --no-rebuild             Skip rebuilding the Docker image (default: rebuild)"
    echo "  --error-on-export-diff   Treat export differences as errors (default: warning)"
    echo "  --no-use-reference-out   Use generated export instead of reference lean.out"
    echo ""
    echo "Examples:"
    echo "  ./scripts/verify.sh result-1"
    echo "  ./scripts/verify.sh --all"
    echo "  ./scripts/verify.sh --error-on-export-diff result-1"
    exit 1
}

# Parse arguments
POSITIONAL_ARG=""
while [[ $# -gt 0 ]]; do
    case $1 in
        --no-rebuild)
            REBUILD=false
            shift
            ;;
        --error-on-export-diff)
            ERROR_ON_EXPORT_DIFF=true
            shift
            ;;
        --no-use-reference-out)
            USE_REFERENCE_OUT=false
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

# Build Docker image if needed
if [ "$REBUILD" = true ]; then
    echo "Building Docker image 'sf-bench-part1'..."
    docker build -t sf-bench-part1 "$PROJECT_DIR"
elif ! docker image inspect sf-bench-part1 >/dev/null 2>&1; then
    echo "Docker image 'sf-bench-part1' not found. Building..."
    docker build -t sf-bench-part1 "$PROJECT_DIR"
fi

# Verify a single result by running Docker
verify_single() {
    local RESULT_NAME="$1"
    local RESULT_DIR="$RESULTS_DIR/$RESULT_NAME"

    if [ ! -d "$RESULT_DIR" ]; then
        echo "Error: $RESULT_DIR does not exist"
        return 1
    fi

    # Run verification inside Docker
    docker run --rm \
        -v "$RESULT_DIR:/result:ro" \
        -v "$PROJECT_DIR/theories:/host_theories:ro" \
        -e ERROR_ON_EXPORT_DIFF="$ERROR_ON_EXPORT_DIFF" \
        -e USE_REFERENCE_OUT="$USE_REFERENCE_OUT" \
        sf-bench-part1:latest \
        bash -c '
            set -e
            THEORIES_DIR="/workdir/theories"
            RESULT_DIR="/result"

            # Load opam environment
            eval $(opam env) 2>/dev/null || true

            # Extract isomorphism names from scores.json
            iso_names=$(grep -o "\"[^\"]*\":" "$RESULT_DIR/scores.json" | sed "s/\"//g; s/://g")

            echo "=== Verifying '"$RESULT_NAME"' ==="
            echo ""

            # Step 1: Verify Lean compilation
            echo "Step 1: Checking Lean compilation..."
            cp "$RESULT_DIR/solution.lean" /workdir/Solution.lean
            cd /workdir

            cat > lakefile.toml << EOF
name = "Solution"
version = "0.1.0"
defaultTargets = ["Solution"]

[[lean_lib]]
name = "Solution"
EOF
            lake update 2>&1 || true

            if lake build 2>&1; then
                echo "  ✓ Lean compiles successfully"
            else
                echo "  ✗ Lean compilation failed"
                exit 1
            fi
            echo ""

            # Step 2: Generate and verify lean4export output
            echo "Step 2: Generating lean4export output..."

            DEFS=$(cat "$RESULT_DIR/export_definitions.txt")
            lake env lean4export Solution -- $DEFS 2>&1 | sed -n "/^1 #NS 0/,\$ p" > /tmp/generated.out

            if [ -s /tmp/generated.out ]; then
                echo "  ✓ lean4export completed"
            else
                echo "  ✗ lean4export failed: no output generated"
                exit 1
            fi

            # Compare with reference
            echo "  Comparing with reference lean.out..."
            if ! diff -q /tmp/generated.out "$RESULT_DIR/lean.out" > /dev/null 2>&1; then
                diff_lines=$(diff "$RESULT_DIR/lean.out" /tmp/generated.out | wc -l)
                echo "  Differences found: ~$diff_lines lines differ"
                diff "$RESULT_DIR/lean.out" /tmp/generated.out | head -10
                if [ "$ERROR_ON_EXPORT_DIFF" = "true" ]; then
                    echo "  ✗ Export differs from reference (--error-on-export-diff)"
                    exit 1
                else
                    echo "  ⚠ Warning: export_definitions.txt likely differs from reference source"
                fi
            else
                echo "  ✓ Export matches reference"
            fi

            # Copy appropriate output
            if [ "$USE_REFERENCE_OUT" = "true" ]; then
                echo "  Using reference lean.out"
                cp "$RESULT_DIR/lean.out" /workdir/Imported.out
            else
                echo "  Using generated export"
                cp /tmp/generated.out /workdir/Imported.out
            fi
            echo ""

            # Step 3: Copy and compile Isomorphisms files
            echo "Step 3: Copying and compiling Isomorphisms files..."

            iso_count=0
            if [ -d "$RESULT_DIR/theories/Isomorphisms" ]; then
                for f in "$RESULT_DIR/theories/Isomorphisms"/*.v; do
                    if [ -f "$f" ]; then
                        fname=$(basename "$f")
                        cp "$f" "$THEORIES_DIR/Isomorphisms/$fname"
                        iso_count=$((iso_count + 1))
                    fi
                done
            fi
            echo "  Copied $iso_count Isomorphisms files"

            mkdir -p "$THEORIES_DIR/Checker"
            checker_count=0
            if [ -d "$RESULT_DIR/theories/Checker" ]; then
                for f in "$RESULT_DIR/theories/Checker"/*.v; do
                    if [ -f "$f" ]; then
                        cp "$f" "$THEORIES_DIR/Checker/"
                        checker_count=$((checker_count + 1))
                    fi
                done
            fi
            echo "  Copied $checker_count Checker files"

            # Regenerate Makefile.coq
            echo "  Regenerating Makefile.coq..."
            echo "-Q theories IsomorphismChecker" > _CoqProject
            find theories -name "*.v" | sort >> _CoqProject
            coq_makefile -f _CoqProject -o Makefile.coq 2>/dev/null

            # Filter function
            filter_warnings() {
                grep -v -E "(Warning:|output-directory|default-output-directory|module-not-found|filesystem,default|ROCQ DEP|from root IsomorphismChecker|is required|^File \".*.v\", line [0-9]+, characters [0-9]+-[0-9]+:\$|is up to date|^\[)" || true
            }

            # Compile Imported.v
            printf "  Compiling Imported.v..."
            output=$(make -s -f Makefile.coq theories/Imported.vo 2>&1)
            status=$?
            if [ $status -ne 0 ]; then
                echo " ✗"
                echo "$output" | filter_warnings | tail -50
                exit 1
            fi
            echo " ✓"

            # Compile Isomorphisms
            echo "  Compiling Isomorphisms..."
            for iso_name in $iso_names; do
                vo_file="theories/Isomorphisms/${iso_name}.vo"
                v_file="theories/Isomorphisms/${iso_name}.v"
                if [ -f "$v_file" ]; then
                    printf "    %s..." "$iso_name"
                    output=$(make -s -f Makefile.coq "$vo_file" 2>&1)
                    status=$?
                    if [ $status -ne 0 ]; then
                        echo " ✗"
                        echo "$output" | filter_warnings | tail -50
                        exit 1
                    fi
                    echo " ✓"
                fi
            done
            echo "  ✓ Isomorphisms compiled successfully"
            echo ""

            # Step 4: Compile Checker files
            echo "Step 4: Compiling Checker files..."
            for iso_name in $iso_names; do
                vo_file="theories/Checker/${iso_name}.vo"
                v_file="theories/Checker/${iso_name}.v"
                if [ -f "$v_file" ]; then
                    printf "    %s..." "$iso_name"
                    output=$(make -s -f Makefile.coq "$vo_file" 2>&1)
                    status=$?
                    if [ $status -ne 0 ]; then
                        echo " ✗"
                        echo "$output" | filter_warnings | tail -50
                        exit 1
                    fi
                    echo " ✓"
                fi
            done

            if ls theories/Checker/*.vo 1>/dev/null 2>&1; then
                echo "  ✓ Checker compiled successfully"
            else
                echo "  ✗ Checker .vo files not created"
                exit 1
            fi

            echo ""
            echo "=== '"$RESULT_NAME"' verified successfully ==="
        '
}

# Verify all results
verify_all() {
    local passed=0
    local failed=0
    local failed_results=""

    # Find all result directories
    local results=$(find "$RESULTS_DIR" -maxdepth 1 -type d -name 'result-*' -printf '%f\n' | sort -V)

    if [ -z "$results" ]; then
        echo "No results found in $RESULTS_DIR"
        return 0
    fi

    local total=$(echo "$results" | wc -l)

    echo "=== Verifying all $total results ==="
    echo ""

    for result_name in $results; do
        if verify_single "$result_name"; then
            passed=$((passed + 1))
            echo ""
        else
            failed=$((failed + 1))
            failed_results="$failed_results $result_name"
            echo ""
        fi
    done

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
if [ "$POSITIONAL_ARG" == "--all" ]; then
    verify_all
else
    verify_single "$POSITIONAL_ARG"
fi
