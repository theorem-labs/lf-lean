#!/bin/bash

# Script to analyze Isomorphisms/*.v files by difficulty
# Calculates min/max/mean/median lines of code for each difficulty level

set -e

# Change to the script's parent directory
cd "$(dirname "$0")/.."

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "Error: jq is required but not installed. Please install jq."
    exit 1
fi

# Temporary files for storing data
temp_dir=$(mktemp -d)
trap "rm -rf $temp_dir" EXIT

echo "Analyzing Isomorphisms/*.v files by difficulty..."
echo

# Pre-extract all difficulty mappings from JSON (key -> difficulty)
echo "Loading difficulty mappings from problem-deps.json..."
jq -r 'to_entries | .[] | "\(.key)\t\(.value.difficulty // "unknown")"' problem-deps.json > "$temp_dir/difficulties.tsv"

# Create an associative array for quick lookups (bash 4+)
declare -A difficulty_map
while IFS=$'\t' read -r key diff; do
    difficulty_map["$key"]="$diff"
done < "$temp_dir/difficulties.tsv"

echo "Counting lines in ${#difficulty_map[@]} problem files..."

# Use find with wc to count lines efficiently
find results -path "*/theories/Isomorphisms/*.v" -type f -exec wc -l {} + | while read -r loc file; do
    if [ "$file" != "total" ]; then
        # Extract the basename without .v extension
        basename=$(basename "$file" .v)

        # Look up difficulty from our pre-loaded map
        difficulty="${difficulty_map[$basename]:-unknown}"

        # Store the data
        echo "$loc" >> "$temp_dir/$difficulty.txt"
    fi
done

# Function to calculate statistics
calculate_stats() {
    local difficulty=$1
    local file="$temp_dir/$difficulty.txt"

    if [ ! -f "$file" ]; then
        return
    fi

    local count=$(wc -l < "$file")
    if [ "$count" -eq 0 ]; then
        return
    fi

    # Sort the values
    sort -n "$file" -o "$file"

    # Calculate min
    local min=$(head -n 1 "$file")

    # Calculate max
    local max=$(tail -n 1 "$file")

    # Calculate mean
    local sum=$(awk '{sum+=$1} END {print sum}' "$file")
    local mean=$(awk -v sum="$sum" -v count="$count" 'BEGIN {printf "%.2f", sum/count}')

    # Calculate median
    local median
    if [ $((count % 2)) -eq 0 ]; then
        # Even number of values
        local mid1=$((count / 2))
        local mid2=$((mid1 + 1))
        local val1=$(sed -n "${mid1}p" "$file")
        local val2=$(sed -n "${mid2}p" "$file")
        median=$(awk -v v1="$val1" -v v2="$val2" 'BEGIN {printf "%.2f", (v1+v2)/2}')
    else
        # Odd number of values
        local mid=$(((count + 1) / 2))
        median=$(sed -n "${mid}p" "$file")
    fi

    # Print results
    echo "Difficulty: $difficulty"
    echo "  Count:  $count files"
    echo "  Min:    $min lines"
    echo "  Max:    $max lines"
    echo "  Mean:   $mean lines"
    echo "  Median: $median lines"
    echo
}

# Process each difficulty level
for difficulty_file in "$temp_dir"/*.txt; do
    if [ -f "$difficulty_file" ]; then
        difficulty=$(basename "$difficulty_file" .txt)
        calculate_stats "$difficulty"
    fi
done

echo "Analysis complete!"
