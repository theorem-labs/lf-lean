From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Auto_LF_Auto_auto__example__5' : forall x : SProp, SProp -> forall x1 x2 x3 x4 x5 : SProp, (x4 -> x3) -> (x5 -> x4) -> (x1 -> x2) -> (x2 -> x3) -> (x -> x1) -> (x4 -> x3) -> x -> x3 := Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__5'.
Instance Original_LF__DOT__Auto_LF_Auto_auto__example__5'_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp),
  Iso x3 x4 ->
  forall (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : Prop) (x8 : SProp) (hx2 : Iso x7 x8) (x9 : Prop) (x10 : SProp) (hx3 : Iso x9 x10) (x11 : Prop) (x12 : SProp) (hx4 : Iso x11 x12) 
    (x13 : Prop) (x14 : SProp) (hx5 : Iso x13 x14) (x15 : x11 -> x9) (x16 : x12 -> x10),
  (forall (x17 : x11) (x18 : x12), rel_iso hx4 x17 x18 -> rel_iso hx3 (x15 x17) (x16 x18)) ->
  forall (x17 : x13 -> x11) (x18 : x14 -> x12),
  (forall (x19 : x13) (x20 : x14), rel_iso hx5 x19 x20 -> rel_iso hx4 (x17 x19) (x18 x20)) ->
  forall (x19 : x5 -> x7) (x20 : x6 -> x8),
  (forall (x21 : x5) (x22 : x6), rel_iso hx1 x21 x22 -> rel_iso hx2 (x19 x21) (x20 x22)) ->
  forall (x21 : x7 -> x9) (x22 : x8 -> x10),
  (forall (x23 : x7) (x24 : x8), rel_iso hx2 x23 x24 -> rel_iso hx3 (x21 x23) (x22 x24)) ->
  forall (x23 : x1 -> x5) (x24 : x2 -> x6),
  (forall (x25 : x1) (x26 : x2), rel_iso hx x25 x26 -> rel_iso hx1 (x23 x25) (x24 x26)) ->
  forall (x25 : x11 -> x9) (x26 : x12 -> x10),
  (forall (x27 : x11) (x28 : x12), rel_iso hx4 x27 x28 -> rel_iso hx3 (x25 x27) (x26 x28)) ->
  forall (x27 : x1) (x28 : x2),
  rel_iso hx x27 x28 ->
  rel_iso hx3 (Original.LF_DOT_Auto.LF.Auto.auto_example_5' x1 x3 x5 x7 x9 x11 x13 x15 x17 x19 x21 x23 x25 x27)
    (imported_Original_LF__DOT__Auto_LF_Auto_auto__example__5' x4 x16 x18 x20 x22 x24 x26 x28).
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.auto_example_5' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__5' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.auto_example_5' Original_LF__DOT__Auto_LF_Auto_auto__example__5'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.auto_example_5' Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__5' Original_LF__DOT__Auto_LF_Auto_auto__example__5'_iso := {}.