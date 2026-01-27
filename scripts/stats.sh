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

echo
echo "Calculating average proof lines for each isomorphism..."
echo

# Create a temporary file to store the updated problem-deps.json
temp_json=$(mktemp)
cp problem-deps.json "$temp_json"

# Process each iso in problem-results.json
jq -r 'keys[]' problem-results.json | while read -r iso_name; do
    # Get the result directories for this iso
    result_dirs=$(jq -r --arg iso "$iso_name" '.[$iso][]' problem-results.json)

    # Temporary file to store proof line counts for this iso
    proof_lines_file=$(mktemp)

    # For each result directory, run coqwc and extract proof lines
    for result_dir in $result_dirs; do
        iso_file="results/$result_dir/theories/Isomorphisms/${iso_name}.v"

        if [ -f "$iso_file" ]; then
            # Run coqwc and extract the proof column (2nd column)
            proof_lines=$(coqwc "$iso_file" 2>/dev/null | tail -n 1 | awk '{print $2}')

            # Only add if we got a valid number
            if [[ "$proof_lines" =~ ^[0-9]+$ ]]; then
                echo "$proof_lines" >> "$proof_lines_file"
            fi
        fi
    done

    # Calculate average if we have data
    if [ -s "$proof_lines_file" ]; then
        count=$(wc -l < "$proof_lines_file")
        sum=$(awk '{sum+=$1} END {print sum}' "$proof_lines_file")
        avg=$(awk -v sum="$sum" -v count="$count" 'BEGIN {printf "%.2f", sum/count}')

        # Update the JSON with the average proof lines (iso-loc) and remove old field if present
        # Reconstruct the object to ensure iso-loc comes after rocq-loc
        jq --arg iso "$iso_name" --arg avg "$avg" \
           'if has($iso) then
              .[$iso] = (.[$iso] |
                {
                  short_name,
                  logical_path,
                  anchor,
                  difficulty,
                  dep_count,
                  all_deps,
                  direct_deps,
                  reduced_deps,
                  "rocq-loc": (."rocq-loc" // null),
                  "iso-loc": ($avg | tonumber)
                } +
                (to_entries | map(select(.key | . != "short_name" and . != "logical_path" and . != "anchor" and . != "difficulty" and . != "dep_count" and . != "all_deps" and . != "direct_deps" and . != "reduced_deps" and . != "rocq-loc" and . != "iso-loc" and . != "avg_proof_lines")) | from_entries)
              )
            else . end' \
           "$temp_json" > "${temp_json}.new"
        mv "${temp_json}.new" "$temp_json"

        echo "  $iso_name: $avg lines (across $count results)"
    fi

    # Clean up temporary file
    rm -f "$proof_lines_file"
done

# Replace the original problem-deps.json with the updated version
mv "$temp_json" problem-deps.json

echo
echo "Updated problem-deps.json with iso-loc (average proof lines)!"
