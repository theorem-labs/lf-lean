From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Logic_LF_Logic_iff : SProp -> SProp -> SProp := Imported.Original_LF__DOT__Logic_LF_Logic_iff.
Instance Original_LF__DOT__Logic_LF_Logic_iff_iso : forall (x1 : Prop) (x2 : SProp), Iso x1 x2 -> forall (x3 : Prop) (x4 : SProp), Iso x3 x4 -> Iso (Original.LF_DOT_Logic.LF.Logic.iff x1 x3) (imported_Original_LF__DOT__Logic_LF_Logic_iff x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.iff Original_LF__DOT__Logic_LF_Logic_iff_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.iff Imported.Original_LF__DOT__Logic_LF_Logic_iff Original_LF__DOT__Logic_LF_Logic_iff_iso := {}.