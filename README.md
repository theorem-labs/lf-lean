# SF-Bench Part 1: Rocq to Lean Translation Verification

This repository contains verified translations of statements from the **Logical Foundations** volume of [Software Foundations](https://softwarefoundations.cis.upenn.edu/) from Rocq to Lean 4.

The repository includes 871 translation results, each with a formally verified proof that the Lean translation is semantically equivalent to the original Rocq definition.

## Repository Structure

```
sf-bench-part1/
├── theories/                    # Core Rocq verification infrastructure
│   ├── Original.v               # Original Software Foundations definitions
│   ├── Imported.v               # Imports Lean definitions into Rocq
│   ├── IsomorphismDefinitions.v # Core isomorphism type definitions
│   ├── EqualityLemmas.v         # Helper lemmas for isomorphism proofs
│   └── Isomorphisms/            # 1276 base isomorphism proof files
├── results/                     # 871 individual translation results
│   └── result-N/
│       ├── solution.lean        # Lean translation of a theorem/definition
│       ├── lean.out             # lean4export output
│       ├── scores.json          # Evaluation scores for the translation
│       └── theories/
│           ├── Checker/         # Verification checker (compile to verify)
│           └── Isomorphisms/    # Result-specific isomorphism proofs
├── Dockerfile                   # Docker environment for verification
├── scripts/
│   └── verify.sh                # Verification script
└── problem-deps.json            # Dependencies between problems
```

## How Verification Works

Each translation is verified through a type isomorphism proof that demonstrates the Lean translation is semantically equivalent to the original Rocq definition:

1. **Lean Translation**: `solution.lean` contains the Lean 4 translation of a Rocq theorem or definition

2. **Export**: `lean4export` exports the Lean definitions to `lean.out`, a text format that can be imported into Rocq

3. **Import into Rocq**: The `LeanImport` library imports the Lean definitions into Rocq via `theories/Imported.v`

4. **Isomorphism Proof**: Files in `theories/Isomorphisms/` prove that the original Rocq definition is type-isomorphic to the imported Lean definition

5. **Verification**: If the Checker compiles successfully, the translation is verified correct

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
- Lean 4.20.0-rc5 (via elan)
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
  Copied result-specific Isomorphisms files (stripped Typeclasses Opaque rel_iso)
  Copied Checker folder
  Regenerating Makefile.coq...
  Compiling Imported.v...
  Compiling result-specific Isomorphisms...
  Compiling Checker...
  ✓ Rocq Checker compiles successfully

=== result-1 verified successfully ===
```

### Step 3: Verify Multiple Results

To verify multiple results:

```bash
# Verify results 1 through 10
for i in $(seq 1 10); do
  docker run --rm -v $(pwd):/host sf-bench-part1 verify result-$i
done
```

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

Each `solution.lean` file contains a Lean 4 translation. For example:

```lean
/-
  Lean translation of consequentia_mirabilis from LF.Logic

  Original Rocq definition:
    Definition consequentia_mirabilis := forall P:Prop, (~P -> P) -> P.
-/
def Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis : Prop :=
  forall (P : Prop), (not P -> P) -> P
```

### scores.json

Contains evaluation scores for the isomorphism proofs:

```json
{
  "U_original__U2_lf_dot_U_logic__U2_lf__U_logic__consequentia____mirabilis__iso": 1.0
}
```

A score of 1.0 indicates a complete, verified isomorphism.

### Isomorphism Files

The `.v` files in `theories/Isomorphisms/` contain Rocq proofs that establish a bijection between the original and translated definitions, proving semantic equivalence.

## Known Issues

### Typeclasses Opaque rel_iso

Some result-specific Isomorphisms files contain `Typeclasses Opaque rel_iso`, which fails because `rel_iso` is defined as a Record in `IsomorphismDefinitions.v`, not a Definition. The verify script automatically strips this line when copying files.

## Tool Versions

The Docker image uses these specific versions:

| Tool | Version | Notes |
|------|---------|-------|
| Rocq/Coq | 9.1.0 | From [JasonGross/coq#v9.1+recursive-assumptions](https://github.com/JasonGross/coq.git) |
| Lean | 4.20.0-rc5 | Installed via elan |
| lean4export | c9f8373 | [leanprover/lean4export](https://github.com/leanprover/lean4export) |
| rocq-lean-import | latest | [rocq-community/rocq-lean-import](https://github.com/rocq-community/rocq-lean-import) |

## License

See [LICENSE](LICENSE) for details.
