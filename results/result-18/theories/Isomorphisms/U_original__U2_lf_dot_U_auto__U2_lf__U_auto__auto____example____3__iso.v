From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Auto_LF_Auto_auto__example__3 : forall x x0 x1 x2 x3 x4 : SProp, (x -> x0) -> (x0 -> x1) -> (x1 -> x2) -> (x2 -> x3) -> (x3 -> x4) -> x -> x4 := Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__3.
Monomorphic Instance Original_LF__DOT__Auto_LF_Auto_auto__example__3_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : Prop) (x8 : SProp) (hx2 : Iso x7 x8) 
    (x9 : Prop) (x10 : SProp) (hx3 : Iso x9 x10) (x11 : Prop) (x12 : SProp) (hx4 : Iso x11 x12) (x13 : x1 -> x3) (x14 : x2 -> x4),
  (forall (x15 : x1) (x16 : x2), rel_iso hx x15 x16 -> rel_iso hx0 (x13 x15) (x14 x16)) ->
  forall (x15 : x3 -> x5) (x16 : x4 -> x6),
  (forall (x17 : x3) (x18 : x4), rel_iso hx0 x17 x18 -> rel_iso hx1 (x15 x17) (x16 x18)) ->
  forall (x17 : x5 -> x7) (x18 : x6 -> x8),
  (forall (x19 : x5) (x20 : x6), rel_iso hx1 x19 x20 -> rel_iso hx2 (x17 x19) (x18 x20)) ->
  forall (x19 : x7 -> x9) (x20 : x8 -> x10),
  (forall (x21 : x7) (x22 : x8), rel_iso hx2 x21 x22 -> rel_iso hx3 (x19 x21) (x20 x22)) ->
  forall (x21 : x9 -> x11) (x22 : x10 -> x12),
  (forall (x23 : x9) (x24 : x10), rel_iso hx3 x23 x24 -> rel_iso hx4 (x21 x23) (x22 x24)) ->
  forall (x23 : x1) (x24 : x2),
  rel_iso hx x23 x24 ->
  rel_iso hx4 (Original.LF_DOT_Auto.LF.Auto.auto_example_3 x1 x3 x5 x7 x9 x11 x13 x15 x17 x19 x21 x23) (imported_Original_LF__DOT__Auto_LF_Auto_auto__example__3 x14 x16 x18 x20 x22 x24).
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.auto_example_3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.auto_example_3 Original_LF__DOT__Auto_LF_Auto_auto__example__3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.auto_example_3 Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__3 Original_LF__DOT__Auto_LF_Auto_auto__example__3_iso := {}.