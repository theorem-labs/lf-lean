From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_add1 : imported_nat -> imported_nat := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_add1.
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_add1_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_ProofObjects.LF.ProofObjects.add1 x1) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_add1 x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.add1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_add1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.add1 Original_LF__DOT__ProofObjects_LF_ProofObjects_add1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.add1 Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_add1 Original_LF__DOT__ProofObjects_LF_ProofObjects_add1_iso := {}.