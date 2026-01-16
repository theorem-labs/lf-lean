From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_match__ex5 : forall x x0 : SProp, x -> x0 -> x := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_match__ex5.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_match__ex5_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : x1) (x6 : x2),
  rel_iso hx x5 x6 ->
  forall (x7 : x3) (x8 : x4), rel_iso hx0 x7 x8 -> rel_iso hx (Original.LF_DOT_AltAuto.LF.AltAuto.match_ex5 x1 x3 x5 x7) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_match__ex5 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.match_ex5 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_match__ex5 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.match_ex5 Original_LF__DOT__AltAuto_LF_AltAuto_match__ex5_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.match_ex5 Imported.Original_LF__DOT__AltAuto_LF_AltAuto_match__ex5 Original_LF__DOT__AltAuto_LF_AltAuto_match__ex5_iso := {}.