From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_f__equal : forall (x x0 : Type) (x1 : x -> x0) (x2 x3 : x), imported_Corelib_Init_Logic_eq x2 x3 -> imported_Corelib_Init_Logic_eq (x1 x2) (x1 x3) := Imported.Original_LF__DOT__Tactics_LF_Tactics_f__equal.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_f__equal_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x1 -> x3) (x6 : x2 -> x4) (hx1 : forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso hx0 (x5 x7) (x6 x8)) 
    (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) (x11 : x7 = x9) (x12 : imported_Corelib_Init_Logic_eq x8 x10),
  rel_iso (Corelib_Init_Logic_eq_iso hx2 hx3) x11 x12 ->
  rel_iso (Corelib_Init_Logic_eq_iso (hx1 x7 x8 hx2) (hx1 x9 x10 hx3)) (Original.LF_DOT_Tactics.LF.Tactics.f_equal x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__Tactics_LF_Tactics_f__equal x6 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.f_equal := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_f__equal := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.f_equal Original_LF__DOT__Tactics_LF_Tactics_f__equal_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.f_equal Imported.Original_LF__DOT__Tactics_LF_Tactics_f__equal Original_LF__DOT__Tactics_LF_Tactics_f__equal_iso := {}.