From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__2 : forall x x0 x1 x2 x3 x4 : SProp, (x -> x0) -> (x -> x1) -> (x3 -> x1) -> (x2 -> x3 -> x4) -> ((x -> x0) -> x -> x2) -> x3 -> x -> x4 := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__2.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__2_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : Prop) (x8 : SProp) (hx2 : Iso x7 x8) 
    (x9 : Prop) (x10 : SProp) (hx3 : Iso x9 x10) (x11 : Prop) (x12 : SProp) (hx4 : Iso x11 x12) (x13 : x1 -> x3) (x14 : x2 -> x4),
  (forall (x15 : x1) (x16 : x2), rel_iso hx x15 x16 -> rel_iso hx0 (x13 x15) (x14 x16)) ->
  forall (x15 : x1 -> x5) (x16 : x2 -> x6),
  (forall (x17 : x1) (x18 : x2), rel_iso hx x17 x18 -> rel_iso hx1 (x15 x17) (x16 x18)) ->
  forall (x17 : x9 -> x5) (x18 : x10 -> x6),
  (forall (x19 : x9) (x20 : x10), rel_iso hx3 x19 x20 -> rel_iso hx1 (x17 x19) (x18 x20)) ->
  forall (x19 : x7 -> x9 -> x11) (x20 : x8 -> x10 -> x12),
  (forall (x21 : x7) (x22 : x8), rel_iso hx2 x21 x22 -> forall (x23 : x9) (x24 : x10), rel_iso hx3 x23 x24 -> rel_iso hx4 (x19 x21 x23) (x20 x22 x24)) ->
  forall (x21 : (x1 -> x3) -> x1 -> x7) (x22 : (x2 -> x4) -> x2 -> x8),
  (forall (x23 : x1 -> x3) (x24 : x2 -> x4),
   (forall (x25 : x1) (x26 : x2), rel_iso hx x25 x26 -> rel_iso hx0 (x23 x25) (x24 x26)) -> forall (x25 : x1) (x26 : x2), rel_iso hx x25 x26 -> rel_iso hx2 (x21 x23 x25) (x22 x24 x26)) ->
  forall (x23 : x9) (x24 : x10),
  rel_iso hx3 x23 x24 ->
  forall (x25 : x1) (x26 : x2),
  rel_iso hx x25 x26 ->
  rel_iso hx4 (Original.LF_DOT_AltAuto.LF.AltAuto.auto_example_2 x1 x3 x5 x7 x9 x11 x13 x15 x17 x19 x21 x23 x25)
    (imported_Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__2 x14 x16 x18 x20 x22 x24 x26).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.auto_example_2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.auto_example_2 Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.auto_example_2 Imported.Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__2 Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__2_iso := {}.