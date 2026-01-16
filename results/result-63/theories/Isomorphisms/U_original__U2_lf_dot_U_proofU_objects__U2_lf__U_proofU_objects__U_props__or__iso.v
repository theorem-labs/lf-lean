From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or : SProp -> SProp -> SProp := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or.
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or_iso : forall (x1 : Prop) (x2 : SProp),
  Iso x1 x2 -> forall (x3 : Prop) (x4 : SProp), Iso x3 x4 -> Iso (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or x1 x3) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or_iso := {}.