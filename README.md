# SF-Bench Part 1: Rocq to Lean Translation Verification

This repository contains verified translations of statements from the **Logical Foundations** volume of [Software Foundations](https://softwarefoundations.cis.upenn.edu/) from Rocq to Lean 4.

The repository includes 136 translation results, each with a formally verified proof that the Lean translation is semantically equivalent to the original Rocq definition.

## Repository Structure

```
sf-bench-part1/
├── theories/                    # Core Rocq verification infrastructure
│   ├── Original.v               # Original Software Foundations definitions
│   ├── Imported.v               # Imports Lean definitions into Rocq
│   ├── IsomorphismDefinitions.v # Core isomorphism type definitions
│   ├── EqualityLemmas.v         # Helper lemmas for isomorphism proofs
│   ├── Checker.v                # Main checker module
│   ├── Ltac2Utils.v             # Ltac2 automation utilities
│   ├── Interface.v              # Interface definitions for all isomorphisms
│   ├── Interface/               # Individual interface files
│   ├── Isomorphisms.v           # Base isomorphism proof file
│   └── Isomorphisms/            # Individual isomorphism proof files
├── results/                     # 136 individual translation results
│   └── result-N/
│       ├── solution.lean        # Lean translation of a theorem/definition
│       ├── lean.out             # lean4export output for Rocq import
│       ├── scores.json          # Evaluation scores for the translation
│       ├── export_definitions.txt  # List of exported Lean definitions
│       ├── names.json           # Mapping of definition names
│       └── theories/
│           ├── Checker/         # Verification checker (compile to verify)
│           └── Isomorphisms/    # Result-specific isomorphism proofs
├── Dockerfile                   # Docker environment for verification
├── scripts/
│   ├── verify.sh                # Verification script (single/sequential)
│   ├── verify-parallel.sh       # Parallel verification script (faster)
│   └── test-build.sh            # Build test script
├── problem-deps.json            # Dependencies between isomorphism problems
├── problem-results.json         # Mapping of isomorphisms to result folders
├── dependencies.dot             # Dependency graph (DOT format)
├── dependencies.svg             # Dependency graph (SVG)
└── dependencies.png             # Dependency graph (PNG)
```

## How Verification Works

Each translation is verified through a type isomorphism proof that demonstrates the Lean translation is semantically equivalent to the original Rocq definition:

1. **Lean Translation**: `solution.lean` contains the Lean 4 translation of a Rocq theorem or definition

2. **Export**: `lean4export` exports the Lean definitions to `lean.out`, a text format that can be imported into Rocq

3. **Import into Rocq**: The `LeanImport` library imports the Lean definitions into Rocq via `theories/Imported.v`

4. **Isomorphism Proof**: Files in `theories/Isomorphisms/` prove that the original Rocq definition is type-isomorphic to the imported Lean definition

5. **Verification**: If the Checker compiles successfully, the translation is verified as correct

## Verifying Results

### Prerequisites

- Docker installed on your machine
- Sufficient disk space (~5GB for the image)

### Step 1: Build the Docker Image

```bash
docker build -t sf-bench-part1 .
```

This builds an image with:
- Rocq/Coq 9.1.0 (custom fork with recursive-assumptions support)
- rocq-lean-import (for importing Lean definitions into Rocq)
- Lean 4 (version from lean4export's lean-toolchain, via elan)
- lean4export tool
- Pre-compiled base theories

Build time: approximately 15-20 minutes.

### Step 2: Verify a Result

Use the `verify` command to verify a single result:

```bash
docker run --rm -v $(pwd):/host sf-bench-part1 verify result-1
```

**Important**: Mount the current directory at `/host`, not `/workdir`. The container's `/workdir` contains pre-compiled theories that should not be shadowed.

The verify script will:
1. Check that `solution.lean` compiles with Lean
2. Copy the result's `lean.out` as `Imported.out`
3. Copy and compile result-specific Isomorphisms files
4. Compile the Checker files
5. Report success or failure

Example output for a successful verification:
```
=== Verifying result-1 ===

Step 1: Checking Lean compilation...
  ✓ Lean compiles successfully

Step 2: Checking Rocq Checker compilation...
  Copied lean.out as Imported.out
  Copied 26 Isomorphisms files
  Copied 26 Checker files
  Regenerating Makefile.coq...
  Compiling Imported.v...
  Compiling Isomorphisms...
  Compiling Checker...
  ✓ Rocq Checker compiles successfully

=== result-1 verified successfully ===
```

### Step 3: Verify All Results

To verify all results at once:

```bash
docker run --rm -v $(pwd):/host sf-bench-part1 verify --all
```

This will verify each result and print a summary at the end:

```
==========================================
SUMMARY: 136 passed, 0 failed (out of 136)
==========================================
```

### Parallel Verification (Faster)

For faster verification, use the parallel script which runs multiple Docker containers concurrently:

```bash
./scripts/verify-parallel.sh
```

This runs 8 parallel workers by default. Adjust with `--jobs`:

```bash
./scripts/verify-parallel.sh --jobs 16
```

Example output:
```
Verifying 136 results with 8 parallel workers...

result-1 success
result-5 success
result-3 success
result-2 success
...

==========================================
SUMMARY: 136 passed, 0 failed (out of 136)
==========================================
```

This is approximately 8x faster than sequential verification (~17 minutes vs 2+ hours).

### Interactive Mode

To explore the container interactively:

```bash
docker run -it --rm -v $(pwd):/host sf-bench-part1 bash
```

Then you can manually run commands:

```bash
# Verify Lean compilation
lean /host/results/result-1/solution.lean

# Check lean4export output matches
lean4export /host/results/result-1/solution.lean > /tmp/new.out
diff /host/results/result-1/lean.out /tmp/new.out
```

## Understanding the Results

### solution.lean

Each `solution.lean` file contains a Lean 4 translation. For example (from `result-15`):

```lean
-- Lean 4 translation of Rocq nat and ev

-- Define nat as an inductive type to match Rocq's nat
inductive nat : Type where
  | O : nat
  | S : nat -> nat

-- Define ev: the evenness predicate on nat
-- Corresponds to:
-- Inductive ev : nat -> Prop :=
--   | ev_0                       : ev 0
--   | ev_SS (n : nat) (H : ev n) : ev (S (S n)).
inductive Original_LF__DOT__IndProp_LF_IndProp_ev : nat -> Prop where
  | ev_0 : Original_LF__DOT__IndProp_LF_IndProp_ev nat.O
  | ev_SS : (n : nat) -> Original_LF__DOT__IndProp_LF_IndProp_ev n
            -> Original_LF__DOT__IndProp_LF_IndProp_ev (nat.S (nat.S n))
```

### scores.json

Contains evaluation scores for the isomorphism proofs. For example (from `result-15`):

```json
{
  "nat__iso": 1.0,
  "U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__ev__iso": 1.0
}
```

A score of 1.0 indicates a complete, verified isomorphism. A score of 0.0 indicates the isomorphism could not be automatically verified (the translation may still be correct but requires manual proof).

### Isomorphism Files

The `.v` files in `theories/Isomorphisms/` contain Rocq proofs that establish a bijection between the original and translated definitions, proving semantic equivalence.

## Tool Versions

The Docker image uses these specific versions:

| Tool | Version | Notes |
|------|---------|-------|
| Rocq/Coq | 9.1.0 | From [JasonGross/coq#v9.1+recursive-assumptions](https://github.com/JasonGross/coq.git) |
| Lean | (from lean4export) | Version determined by lean4export's lean-toolchain |
| lean4export | c9f8373 | [leanprover/lean4export](https://github.com/leanprover/lean4export) |
| rocq-lean-import | latest | [rocq-community/rocq-lean-import](https://github.com/rocq-community/rocq-lean-import) |

## License

See [LICENSE](LICENSE) for details.
