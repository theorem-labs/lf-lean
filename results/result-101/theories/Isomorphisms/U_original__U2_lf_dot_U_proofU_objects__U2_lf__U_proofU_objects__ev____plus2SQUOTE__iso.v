From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2' : SProp := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2'.
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2'_iso : Iso Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_plus2' imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2'.
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_plus2' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_plus2' Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_plus2' Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2' Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2'_iso := {}.