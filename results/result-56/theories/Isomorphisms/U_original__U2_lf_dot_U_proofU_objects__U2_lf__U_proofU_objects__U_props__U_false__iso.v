From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False : SProp := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False_iso : Iso Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.False imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False.
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.False Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.False Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False_iso := {}.