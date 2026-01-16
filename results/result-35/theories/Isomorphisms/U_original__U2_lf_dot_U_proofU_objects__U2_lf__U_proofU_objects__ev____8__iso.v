From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__ev__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__8 : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev (imported_S (imported_S (imported_S (iterate1 imported_S 5 imported_0)))) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__8.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__8_iso : rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 5 0 imported_0 _0_iso))))) Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_8
    imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__8.
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_8 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__8 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_8 Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__8_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_8 Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__8 Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__8_iso := {}.