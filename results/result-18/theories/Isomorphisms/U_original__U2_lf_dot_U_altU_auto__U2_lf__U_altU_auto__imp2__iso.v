From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_imp2 : forall x x0 : SProp, x -> (x -> x0) -> x0 := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_imp2.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_imp2_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : x1) (x6 : x2),
  rel_iso hx x5 x6 ->
  forall (x7 : x1 -> x3) (x8 : x2 -> x4),
  (forall (x9 : x1) (x10 : x2), rel_iso hx x9 x10 -> rel_iso hx0 (x7 x9) (x8 x10)) ->
  rel_iso hx0 (Original.LF_DOT_AltAuto.LF.AltAuto.imp2 x1 x3 x5 x7) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_imp2 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.imp2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_imp2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.imp2 Original_LF__DOT__AltAuto_LF_AltAuto_imp2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.imp2 Imported.Original_LF__DOT__AltAuto_LF_AltAuto_imp2 Original_LF__DOT__AltAuto_LF_AltAuto_imp2_iso := {}.