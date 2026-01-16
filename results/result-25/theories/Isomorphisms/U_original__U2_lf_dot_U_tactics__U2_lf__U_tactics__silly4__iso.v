From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_silly4 : forall x x0 x1 x2 : imported_nat, (imported_Corelib_Init_Logic_eq x x0 -> imported_Corelib_Init_Logic_eq x1 x2) -> imported_Corelib_Init_Logic_eq x0 x -> imported_Corelib_Init_Logic_eq x2 x1 := Imported.Original_LF__DOT__Tactics_LF_Tactics_silly4.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_silly4_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) (x9 : x1 = x3 -> x5 = x7) (x10 : imported_Corelib_Init_Logic_eq x2 x4 -> imported_Corelib_Init_Logic_eq x6 x8),
  (forall (x11 : x1 = x3) (x12 : imported_Corelib_Init_Logic_eq x2 x4), rel_iso (Corelib_Init_Logic_eq_iso hx hx0) x11 x12 -> rel_iso (Corelib_Init_Logic_eq_iso hx1 hx2) (x9 x11) (x10 x12)) ->
  forall (x11 : x3 = x1) (x12 : imported_Corelib_Init_Logic_eq x4 x2),
  rel_iso (Corelib_Init_Logic_eq_iso hx0 hx) x11 x12 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx2 hx1) (Original.LF_DOT_Tactics.LF.Tactics.silly4 x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__Tactics_LF_Tactics_silly4 x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.silly4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_silly4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.silly4 Original_LF__DOT__Tactics_LF_Tactics_silly4_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.silly4 Imported.Original_LF__DOT__Tactics_LF_Tactics_silly4 Original_LF__DOT__Tactics_LF_Tactics_silly4_iso := {}.