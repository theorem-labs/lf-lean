#!/bin/bash
# Test script to verify the Docker image has correctly built the theories
# Run this inside the Docker container: docker run --rm lf-lean /usr/local/bin/test-build

set -e

WORKDIR="${WORKDIR:-/workdir}"
THEORIES_DIR="$WORKDIR/theories"

eval $(opam env) 2>/dev/null || true

echo "=== Testing Docker Build ==="
echo ""

# Verify theories can be loaded by Rocq
echo "Testing that theories can be loaded..."
cd "$THEORIES_DIR"

cat > /tmp/test_load.v << 'EOF'
From IsomorphismChecker Require Import Original.
From IsomorphismChecker Require Import IsomorphismDefinitions.
From IsomorphismChecker Require Import AutomationDefinitions.
From LeanImport Require Import Lean.
Check Original.LF_DOT_Basics.LF.Basics.day.
Check Iso.
Check rel_iso.
EOF

if rocq c -Q . IsomorphismChecker /tmp/test_load.v 2>&1 | grep -q "Error"; then
    echo "  ✗ Failed to load theories"
    rocq c -Q . IsomorphismChecker /tmp/test_load.v 2>&1 | grep "Error"
    exit 1
fi

rm -f /tmp/test_load.v /tmp/test_load.vo /tmp/test_load.glob
echo "  ✓ Theories load correctly"
echo ""
echo "=== Test passed ==="
