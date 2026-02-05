# lf-lean: Rocq to Lean Translation Verification

This repository contains the verified translations of every single statement from the **Logical Foundations** volume of [Software Foundations](https://softwarefoundations.cis.upenn.edu/) from Rocq to Lean 4.

The repository includes 100 translation results, each with a formally verified proof that the Lean translation is semantically equivalent to the original Rocq definition, which will cover all 1276 distinct statements in **Logical Foundations**.

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

### Verify a Result

Run the verify script directly from the project directory:

```bash
./scripts/verify.sh result-1
```

The script automatically:
1. Builds the Docker image `sf-bench-part1` (first run takes ~10-15 minutes)
2. Runs verification inside a Docker container with the correct mount configuration

For faster subsequent runs, use `--no-rebuild` to skip rebuilding the image:

```bash
./scripts/verify.sh --no-rebuild result-1
```

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

Step 2: Copying lean.out as Imported.out...
  ✓ lean4export completed
  Comparing with reference lean.out...
  ✓ Export matches reference

Step 3: Copying and compiling Isomorphisms files...
  Copied 236 Isomorphisms files
  Copied 30 Checker files
  Regenerating Makefile.coq...
  Compiling Imported.v...
  Compiling Isomorphisms...
  ✓ Isomorphisms compiled successfully

Step 4: Compiling Checker files...
  ✓ Checker compiled successfully

=== result-1 verified successfully ===
```

### Verify All Results

To verify all results in parallel, use the verify-all script which runs multiple Docker containers concurrently. It will use 16 parallel workers by default.

```bash
./scripts/verify-all.sh --jobs 100
```

Use `--no-rebuild` to skip rebuilding the Docker image:

```bash
./scripts/verify-all.sh --no-rebuild --jobs 100
```

Example parallel output:
```
Verifying 100 results with 16 parallel workers...

result-1 success
result-5 success
result-3 success
result-2 success
...
==========================================
SUMMARY: 100 passed, 0 failed (out of 100)
==========================================
```

Alternatively, verify all results sequentially (slower, but shows full output):

```bash
./scripts/verify.sh --all
```

#### Docker Image Contents

The Docker image includes:
- Rocq/Coq 9.1.0 (custom fork with recursive-assumptions support)
- rocq-lean-import (for importing Lean definitions into Rocq)
- Lean 4 (version from lean4export's lean-toolchain, via elan)
- lean4export tool
- Pre-compiled base theories

#### Manual Docker Build (Optional)

If you prefer to build the image manually:

```bash
docker build -t sf-bench-part1 .
```

**Note**: When running Docker manually, mount the current directory at `/host`, not `/workdir`. The container's `/workdir` contains pre-compiled theories that should not be shadowed.

### Interactive Mode

To explore the container interactively:

```bash
docker run -it --rm -v $(pwd):/host sf-bench-part1 bash
```

Then you can manually run commands:

```bash
# Verify Lean compilation
cd /workdir && cp /host/results/result-1/solution.lean /workdir/Solution.lean
cat > lakefile.toml << 'EOF'
name = "Solution"
version = "0.1.0"
defaultTargets = ["Solution"]

[[lean_lib]]
name = "Solution"
EOF
lake build

# Verify lean export results
DEFS=$(cat /host/results/result-1/export_definitions.txt)
lake env lean4export Solution -- $DEFS 2>&1 | sed -n "/^1 #NS 0/,\$ p" > /workdir/Imported.out
diff -q /workdir/Imported.out /host/results/result-1/lean.out

# Copy lean.out for Rocq import
cp /host/results/result-1/lean.out /workdir/Imported.out

# Copy isomorphism files to theories directory
cd /workdir && cp /host/results/result-1/theories/Isomorphisms/*.v /workdir/theories/Isomorphisms/
mkdir -p /workdir/theories/Checker
cp /host/results/result-1/theories/Checker/*.v /workdir/theories/Checker/

# Regenerate Makefile and compile
echo "-Q theories IsomorphismChecker" > _CoqProject
find theories -name "*.v" | sort >> _CoqProject
coq_makefile -f _CoqProject -o Makefile.coq
make -f Makefile.coq theories/Imported.vo
make -f Makefile.coq theories/Checker/U_nat__add__iso.vo
```

## Problem Information

**Difficulty distribution across 1,276 problems:**

We separated problems into 4 levels of difficulty. Easy was problems that were solved by the LLM in <3 attempts, medium from 3-9 attempts, and hard was anything that required double digit or more attempts. Extreme was reserved for the problems that required manual human effort to write out the Isomorphism proof. The 1276 problems from **Logical Foundations** were broken down as follows:

| Difficulty | Count |
|------------|-------|
| Easy | 1,075 |
| Medium | 170 |
| Hard | 25 |
| Extreme | 6 |

The `problem-deps.json` file contains metadata for all 1276 isomorphism problems:

```json
{
  "U_nat__add__iso": {
    "short_name": "Nat.add",
    "logical_path": "Init.Nat",
    "anchor": "add",
    "difficulty": "easy",
    "dep_count": 1,
    "all_deps": ["nat__iso"],
    "direct_deps": ["nat__iso"],
    "reduced_deps": ["nat__iso"]
  }
}
```

**Fields:**
- `short_name`: Human-readable name of the definition
- `logical_path`: Module path in the Rocq/Lean standard library
- `difficulty`: Classification of proof complexity
- `all_deps`: All transitive dependencies
- `direct_deps`: Immediate dependencies only
- `reduced_deps`: Minimal dependency set after transitive reduction

The `problem-results.json` file maps each isomorphism to the result folders that verify it.

## Statistics

**Generated Code Statistics:**

Run `./scripts/count-lines.sh` to count lines in the generated files:

| File Type | Files | Lines | Lines (no ws) | Spec | Proof | Comments |
|-----------|-------|-------|-----------------|------|-------|----------|
| `solution.lean` | 100 | 59,868 | 48,614 | — | — | — |
| `theories/Isomorphisms/*.v` | 18,850 | 727,111 | 695,172 | 102,750 | 505,596 | 86,826 |
| **Total** | **18,950** | **786,979** | **743,786** | | | |

Spec/Proof/Comments breakdown is from `coqwc`.

**Theory File Sizes:**

| File | Lines | Description |
|------|-------|-------------|
| `Original.v` | 6,879 | Original Software Foundations definitions |
| `Interface.v` | 19,225 | Aggregated interface specifications |
| `Ltac2Utils.v` | 2,248 | Ltac2 automation utilities |
| `EqualityLemmas.v` | 1,859 | Helper lemmas for equality proofs |
| `Isomorphisms.v` | 1,292 | Aggregated isomorphism proofs |
| `IsomorphismDefinitions.v` | 143 | Core `Iso` record type |

**Software Foundations Chapters Covered:**
- Basics, Induction, Lists, Poly, Tactics, Logic, IndProp, Maps, Imp, ImpCevalFun, ImpParser

## Result Files

### solution.lean

Each `solution.lean` file contains a Lean 4 translation. For example (excerpt from `result-45`):

```lean
-- Natural numbers
inductive nat : Type where
  | O : nat
  | S : nat → nat

-- Double function
def Original_LF__DOT__Induction_LF_Induction_double : nat → nat
  | nat.O => nat.O
  | nat.S n' => nat.S (nat.S (Original_LF__DOT__Induction_LF_Induction_double n'))

-- EvPlayground.ev inductive (evenness predicate)
inductive Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev : nat → Prop where
  | ev_0 : Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev nat.O
  | ev_SS : (n : nat) → Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev n
            → Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (nat.S (nat.S n))

-- Logic.Even: exists n, x = double n
def Original_LF__DOT__Logic_LF_Logic_Even (x : nat) : Prop :=
  ex (fun n => Corelib_Init_Logic_eq x (Original_LF__DOT__Induction_LF_Induction_double n))
```

Definition names follow the pattern `Original_<Module>_<Definition>` to match the original Rocq module structure.

### scores.json

Contains evaluation scores for the isomorphism proofs. For example (excerpt from `result-45`):

```json
{
  "nat__iso": 1.0,
  "U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_evU_playground__ev__iso": 1.0,
  "U_original__U2_lf_dot_U_induction__U2_lf__U_induction__double__iso": 1.0,
  "U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_even__iso": 1.0
}
```

A score of 1.0 indicates a complete, verified isomorphism. A score of 0.0 indicates the isomorphism could not be automatically verified (the translation may still be correct but requires manual proof).

### Isomorphism Files

The `.v` files in `theories/Isomorphisms/` contain Rocq proofs that establish a bijection between the original and translated definitions, proving semantic equivalence.

## Naming Conventions

The isomorphism file names use an encoding scheme to represent Rocq identifiers to avoid file system issues:

| Pattern | Meaning |
|---------|---------|
| `U_` | Next 1 letter is capitalized |
| `Ux_` | Next x letters are capitalized |
| `__` | Underscore `_` |
| `_dot_` | Period `.` |
| `SQUOTE` | Single quote `'` |

**Example decoding:**

`U_original__U2_lf_dot_U_basics__U2_lf__U_basics__plus__iso.v`

Decodes to: `Original_LF.Basics_LF_Basics_plus` → the `plus` function from the Software Foundations Basics chapter.

## Tool Versions

The Docker image uses these specific versions:

| Tool | Version | Notes |
|------|---------|-------|
| Rocq/Coq | 9.1.0 | From [JasonGross/coq#v9.1+recursive-assumptions](https://github.com/JasonGross/coq.git) |
| Lean | 4.26.0 | Version determined by lean4export's lean-toolchain |
| lean4export | c9f8373 | [leanprover/lean4export](https://github.com/leanprover/lean4export) |
| rocq-lean-import | latest | [rocq-community/rocq-lean-import](https://github.com/rocq-community/rocq-lean-import) |

## Repository Structure

```
sf-bench-part1/
├── theories/                    # Core Rocq verification infrastructure
│   ├── Original.v               # Original Software Foundations definitions
│   ├── Imported.v               # Imports Lean definitions into Rocq
│   ├── ImportedNames.v          # Name mappings for imported definitions
│   ├── IsomorphismDefinitions.v # Core isomorphism type definitions
│   ├── EqualityLemmas.v         # Helper lemmas for isomorphism proofs
│   ├── Checker.v                # Main checker module
│   ├── Ltac2Utils.v             # Ltac2 automation utilities
│   ├── AutomationDefinitions.v  # Automation support definitions
│   ├── IsomorphismStatementAutomationDefinitions.v
│   ├── CaseSchemeDefinitions.v  # Case scheme definitions
│   ├── Hiding.v                 # Hiding utilities
│   ├── PermittedAxiomPrinting.v # Axiom printing utilities
│   ├── Interface.v              # Interface definitions for all isomorphisms
│   ├── Interface/               # Individual interface files
│   ├── Isomorphisms.v           # Base isomorphism proof file
│   └── Isomorphisms/            # Individual isomorphism proof files
├── results/                     # 100 individual translation results
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
│   ├── verify.sh                # Verification script (single or --all)
│   ├── verify-all.sh            # Parallel verification script (faster)
│   ├── test-build.sh            # Build test script
│   └── count-lines.sh           # Count lines in solution.lean and Isomorphisms files
├── problem-deps.json            # Dependencies between isomorphism problems
├── problem-results.json         # Mapping of isomorphisms to result folders
├── dependencies.dot             # Dependency graph (DOT format)
├── dependencies.svg             # Dependency graph (SVG)
└── dependencies.png             # Dependency graph (PNG)
```

## License

See [LICENSE](LICENSE) for details.
