#!/bin/bash
# Parallel verification script for sf-bench-part1 translations
# Usage: ./scripts/verify-all.sh [--jobs N]
#
# Runs all verifications in parallel using multiple Docker containers.
# Default: 16 parallel jobs (adjust with --jobs)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
RESULTS_DIR="$PROJECT_DIR/results"
JOBS=16

# Use gfind if available (macOS with GNU findutils), otherwise use find
if command -v gfind &> /dev/null; then
    FIND=gfind
else
    FIND=find
fi


# Parse arguments
# Default: rebuild the image every time
REBUILD=true
while [[ $# -gt 0 ]]; do
    case $1 in
        --jobs|-j)
            JOBS="$2"
            shift 2
            ;;
        --no-rebuild)
            REBUILD=false
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 [--jobs N] [--no-rebuild]"
            exit 1
            ;;
    esac
done

# Build the Docker image (default) or skip with --no-rebuild
if [ "$REBUILD" = true ]; then
    echo "Building Docker image 'sf-bench-part1'..."
    docker build -t sf-bench-part1 "$PROJECT_DIR"
elif ! docker image inspect sf-bench-part1 >/dev/null 2>&1; then
    echo "Docker image 'sf-bench-part1' not found. Building..."
    docker build -t sf-bench-part1 "$PROJECT_DIR"
fi

# Find all result directories
RESULTS=$($FIND "$RESULTS_DIR" -maxdepth 1 -type d -name 'result-*' -printf '%f\n' | sort -V)
TOTAL=$(echo "$RESULTS" | wc -l)

echo "Verifying $TOTAL results with $JOBS parallel workers..."
echo ""

# Create temp file for collecting results
OUTPUT_FILE=$(mktemp)
trap "rm -f $OUTPUT_FILE" EXIT

# Run verifications in parallel
# Always pass --no-rebuild since we already built the image above
echo "$RESULTS" | xargs -P "$JOBS" -I {} bash -c '
    result_name="$1"
    script_dir="$2"
    output_file="$3"
    if "$script_dir/verify.sh" --no-rebuild "$result_name" >/dev/null 2>&1; then
        echo "$result_name success" | tee -a "$output_file"
    else
        echo "$result_name FAILED" | tee -a "$output_file"
    fi
' _ {} "$SCRIPT_DIR" "$OUTPUT_FILE"

# Count results
PASSED=$(grep -c "success$" "$OUTPUT_FILE" 2>/dev/null) || PASSED=0
FAILED=$(grep -c "FAILED$" "$OUTPUT_FILE" 2>/dev/null) || FAILED=0

echo ""
echo "=========================================="
echo "SUMMARY: $PASSED passed, $FAILED failed (out of $TOTAL)"
echo "=========================================="

if [ "$FAILED" -gt 0 ]; then
    echo ""
    echo "Failed:"
    grep "FAILED$" "$OUTPUT_FILE" | sed 's/ FAILED$//'
    exit 1
fi
