From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex : forall x : Type, (x -> SProp) -> SProp := (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex).
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Prop) (x4 : x2 -> SProp),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (x3 x5) (x4 x6)) ->
  Iso (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex x3) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex x4).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex) Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex) (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex) Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso := {}.