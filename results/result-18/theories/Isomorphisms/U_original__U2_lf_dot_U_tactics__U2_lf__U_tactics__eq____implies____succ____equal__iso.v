From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_eq__implies__succ__equal : forall x x0 : imported_nat, imported_Corelib_Init_Logic_eq x x0 -> imported_Corelib_Init_Logic_eq (imported_S x) (imported_S x0) := Imported.Original_LF__DOT__Tactics_LF_Tactics_eq__implies__succ__equal.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_eq__implies__succ__equal_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : x1 = x3) (x6 : imported_Corelib_Init_Logic_eq x2 x4),
  rel_iso (Corelib_Init_Logic_eq_iso hx hx0) x5 x6 ->
  rel_iso (Corelib_Init_Logic_eq_iso (S_iso hx) (S_iso hx0)) (Original.LF_DOT_Tactics.LF.Tactics.eq_implies_succ_equal x1 x3 x5)
    (imported_Original_LF__DOT__Tactics_LF_Tactics_eq__implies__succ__equal x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.eq_implies_succ_equal := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_eq__implies__succ__equal := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.eq_implies_succ_equal Original_LF__DOT__Tactics_LF_Tactics_eq__implies__succ__equal_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.eq_implies_succ_equal Imported.Original_LF__DOT__Tactics_LF_Tactics_eq__implies__succ__equal Original_LF__DOT__Tactics_LF_Tactics_eq__implies__succ__equal_iso := {}.