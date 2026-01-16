From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_True : SProp := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_True.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_True_iso : Iso Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.True imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_True.
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.True := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_True := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.True Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_True_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.True Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_True Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_True_iso := {}.