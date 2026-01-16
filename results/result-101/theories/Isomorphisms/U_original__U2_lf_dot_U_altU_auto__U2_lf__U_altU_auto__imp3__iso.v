From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_imp3 : forall x x0 x1 : SProp, (x -> x0 -> x1) -> x0 -> x -> x1 := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_imp3.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_imp3_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : x1 -> x3 -> x5) (x8 : x2 -> x4 -> x6),
  (forall (x9 : x1) (x10 : x2), rel_iso hx x9 x10 -> forall (x11 : x3) (x12 : x4), rel_iso hx0 x11 x12 -> rel_iso hx1 (x7 x9 x11) (x8 x10 x12)) ->
  forall (x9 : x3) (x10 : x4),
  rel_iso hx0 x9 x10 ->
  forall (x11 : x1) (x12 : x2), rel_iso hx x11 x12 -> rel_iso hx1 (Original.LF_DOT_AltAuto.LF.AltAuto.imp3 x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_imp3 x8 x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.imp3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_imp3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.imp3 Original_LF__DOT__AltAuto_LF_AltAuto_imp3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.imp3 Imported.Original_LF__DOT__AltAuto_LF_AltAuto_imp3 Original_LF__DOT__AltAuto_LF_AltAuto_imp3_iso := {}.