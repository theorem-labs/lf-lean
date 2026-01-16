From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__eq__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq__add' : forall x x0 : imported_nat, imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x x0 -> imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq (imported_S x) (imported_S x0) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq__add'.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_eq__add'_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : Original.LF_DOT_ProofObjects.LF.ProofObjects.eq x1 x3)
    (x6 : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x2 x4),
  rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso hx hx0) x5 x6 ->
  rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso (S_iso hx) (S_iso hx0)) (Original.LF_DOT_ProofObjects.LF.ProofObjects.eq_add' x1 x3 x5)
    (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq__add' x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.eq_add' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq__add' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.eq_add' Original_LF__DOT__ProofObjects_LF_ProofObjects_eq__add'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.eq_add' Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq__add' Original_LF__DOT__ProofObjects_LF_ProofObjects_eq__add'_iso := {}.