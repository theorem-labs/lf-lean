From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and : SProp -> SProp -> SProp := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and_iso : (forall (x1 : Prop) (x2 : SProp) (_ : Iso x1 x2) (x3 : Prop) (x4 : SProp) (_ : Iso x3 x4),
   Iso (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.And.and x1 x3) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and x2 x4)).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.And.and := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.And.and Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.And.and Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and_iso := {}.