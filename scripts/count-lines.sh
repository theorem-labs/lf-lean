#!/bin/bash

# Count lines of code in solution.lean files and theories/Isomorphisms files

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== Line Count Summary ==="
echo

# Count solution.lean files
echo "solution.lean files:"
solution_count=$(find "$ROOT_DIR/results" -name "solution.lean" | wc -l)
solution_lines=$(find "$ROOT_DIR/results" -name "solution.lean" -exec cat {} + 2>/dev/null | wc -l)
echo "  Files: $solution_count"
echo "  Lines: $solution_lines"
echo

# Count theories/Isomorphisms files (inside each result directory)
echo "theories/Isomorphisms files:"
iso_count=$(find "$ROOT_DIR/results"/result-*/theories/Isomorphisms -type f -name "*.v" 2>/dev/null | wc -l)
iso_lines=$(find "$ROOT_DIR/results"/result-*/theories/Isomorphisms -type f -name "*.v" -exec cat {} + 2>/dev/null | wc -l)
echo "  Files: $iso_count"
echo "  Lines: $iso_lines"
echo

# Total
echo "Total (including whitespace):"
echo "  Files: $((solution_count + iso_count))"
echo "  Lines: $((solution_lines + iso_lines))"
