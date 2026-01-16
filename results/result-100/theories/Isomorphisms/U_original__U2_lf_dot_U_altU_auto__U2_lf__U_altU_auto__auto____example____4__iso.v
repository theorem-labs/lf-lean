From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.and__iso Isomorphisms.or__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__4 : forall x x0 x1 : SProp, x0 -> (x0 -> x1) -> imported_or x (imported_and x0 x1) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__4.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__4_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : x3) (x8 : x4),
  rel_iso hx0 x7 x8 ->
  forall (x9 : x3 -> x5) (x10 : x4 -> x6),
  (forall (x11 : x3) (x12 : x4), rel_iso hx0 x11 x12 -> rel_iso hx1 (x9 x11) (x10 x12)) ->
  rel_iso
    {|
      to := or_iso hx (and_iso hx0 hx1);
      from := from (or_iso hx (and_iso hx0 hx1));
      to_from := fun x : imported_or x2 (imported_and x4 x6) => to_from (or_iso hx (and_iso hx0 hx1)) x;
      from_to := fun x : x1 \/ x3 /\ x5 => seq_p_of_t (from_to (or_iso hx (and_iso hx0 hx1)) x)
    |} (Original.LF_DOT_AltAuto.LF.AltAuto.auto_example_4 x1 x3 x5 x7 x9) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__4 x2 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.auto_example_4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.auto_example_4 Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__4_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.auto_example_4 Imported.Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__4 Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__4_iso := {}.