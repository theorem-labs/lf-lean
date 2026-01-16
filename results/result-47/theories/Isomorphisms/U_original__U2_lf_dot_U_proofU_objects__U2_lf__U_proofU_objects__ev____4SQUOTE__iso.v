From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__ev__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__4' : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__4'.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__4'_iso : rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1 O imported_0 _0_iso))))) Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_4'
    imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__4'.
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_4' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__4' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_4' Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__4'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_4' Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__4' Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__4'_iso := {}.