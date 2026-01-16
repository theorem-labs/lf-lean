From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_apply__iff__example1 : forall x x0 x1 : SProp, imported_iff x x0 -> (x0 -> x1) -> x -> x1 := Imported.Original_LF__DOT__Logic_LF_Logic_apply__iff__example1.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_apply__iff__example1_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : x1 <-> x3) (x8 : imported_iff x2 x4),
  rel_iso (iff_iso hx hx0) x7 x8 ->
  forall (x9 : x3 -> x5) (x10 : x4 -> x6),
  (forall (x11 : x3) (x12 : x4), rel_iso hx0 x11 x12 -> rel_iso hx1 (x9 x11) (x10 x12)) ->
  forall (x11 : x1) (x12 : x2),
  rel_iso hx x11 x12 -> rel_iso hx1 (Original.LF_DOT_Logic.LF.Logic.apply_iff_example1 x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__Logic_LF_Logic_apply__iff__example1 x8 x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.apply_iff_example1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_apply__iff__example1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.apply_iff_example1 Original_LF__DOT__Logic_LF_Logic_apply__iff__example1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.apply_iff_example1 Imported.Original_LF__DOT__Logic_LF_Logic_apply__iff__example1 Original_LF__DOT__Logic_LF_Logic_apply__iff__example1_iso := {}.