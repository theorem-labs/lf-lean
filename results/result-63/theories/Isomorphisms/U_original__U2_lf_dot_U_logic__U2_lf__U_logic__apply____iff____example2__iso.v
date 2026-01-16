From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_apply__iff__example2 : forall x x0 x1 : SProp, imported_iff x x0 -> (x -> x1) -> x0 -> x1 := Imported.Original_LF__DOT__Logic_LF_Logic_apply__iff__example2.
Instance Original_LF__DOT__Logic_LF_Logic_apply__iff__example2_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : x1 <-> x3) (x8 : imported_iff x2 x4),
  rel_iso (iff_iso hx hx0) x7 x8 ->
  forall (x9 : x1 -> x5) (x10 : x2 -> x6),
  (forall (x11 : x1) (x12 : x2), rel_iso hx x11 x12 -> rel_iso hx1 (x9 x11) (x10 x12)) ->
  forall (x11 : x3) (x12 : x4),
  rel_iso hx0 x11 x12 -> rel_iso hx1 (Original.LF_DOT_Logic.LF.Logic.apply_iff_example2 x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__Logic_LF_Logic_apply__iff__example2 x8 x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.apply_iff_example2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_apply__iff__example2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.apply_iff_example2 Original_LF__DOT__Logic_LF_Logic_apply__iff__example2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.apply_iff_example2 Imported.Original_LF__DOT__Logic_LF_Logic_apply__iff__example2 Original_LF__DOT__Logic_LF_Logic_apply__iff__example2_iso := {}.