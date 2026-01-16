From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_principles__U2_lf__U_indU_principles__evSQUOTE__iso Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__ev__iso.

Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev__ev' : forall x : imported_nat, imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev x -> imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' x := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev__ev'.
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev__ev'_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_ProofObjects.LF.ProofObjects.ev x1) (x4 : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev x2),
  rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso hx) x3 x4 ->
  rel_iso (Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev'_iso hx) (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev_ev' x1 x3)
    (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev__ev' x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev_ev' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev__ev' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev_ev' Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev__ev'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev_ev' Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev__ev' Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev__ev'_iso := {}.