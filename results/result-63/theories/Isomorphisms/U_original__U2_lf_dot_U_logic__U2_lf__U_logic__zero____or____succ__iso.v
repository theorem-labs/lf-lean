From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__pred__iso Isomorphisms.U_s__iso Isomorphisms.or__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_zero__or__succ : forall x : imported_nat, imported_or (imported_Corelib_Init_Logic_eq x imported_0) (imported_Corelib_Init_Logic_eq x (imported_S (imported_Nat_pred x))) := Imported.Original_LF__DOT__Logic_LF_Logic_zero__or__succ.
Instance Original_LF__DOT__Logic_LF_Logic_zero__or__succ_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso
    {|
      to := or_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (Corelib_Init_Logic_eq_iso hx (S_iso (Nat_pred_iso hx)));
      from := from (or_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (Corelib_Init_Logic_eq_iso hx (S_iso (Nat_pred_iso hx))));
      to_from :=
        fun x : imported_or (imported_Corelib_Init_Logic_eq x2 imported_0) (imported_Corelib_Init_Logic_eq x2 (imported_S (imported_Nat_pred x2))) =>
        to_from (or_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (Corelib_Init_Logic_eq_iso hx (S_iso (Nat_pred_iso hx)))) x;
      from_to := fun x : x1 = 0 \/ x1 = S (Nat.pred x1) => seq_p_of_t (from_to (or_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (Corelib_Init_Logic_eq_iso hx (S_iso (Nat_pred_iso hx)))) x)
    |} (Original.LF_DOT_Logic.LF.Logic.zero_or_succ x1) (imported_Original_LF__DOT__Logic_LF_Logic_zero__or__succ x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.zero_or_succ := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_zero__or__succ := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.zero_or_succ Original_LF__DOT__Logic_LF_Logic_zero__or__succ_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.zero_or_succ Imported.Original_LF__DOT__Logic_LF_Logic_zero__or__succ Original_LF__DOT__Logic_LF_Logic_zero__or__succ_iso := {}.