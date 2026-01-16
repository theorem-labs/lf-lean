From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_four' : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq (imported_Nat_add (imported_S (imported_S imported_0)) (imported_S (imported_S imported_0)))
    (imported_Nat_add (imported_S imported_0) (imported_S (imported_S (imported_S imported_0)))) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_four'.
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_four'_iso : rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso (Nat_add_iso (S_iso (S_iso _0_iso)) (S_iso (S_iso _0_iso))) (Nat_add_iso (S_iso _0_iso) (S_iso (S_iso (S_iso _0_iso)))))
    Original.LF_DOT_ProofObjects.LF.ProofObjects.four' imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_four'.
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.four' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_four' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.four' Original_LF__DOT__ProofObjects_LF_ProofObjects_four'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.four' Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_four' Original_LF__DOT__ProofObjects_LF_ProofObjects_four'_iso := {}.