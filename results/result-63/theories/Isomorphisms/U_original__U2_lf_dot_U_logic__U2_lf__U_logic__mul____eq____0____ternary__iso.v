From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__mul__iso Isomorphisms.iff__iso Isomorphisms.or__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_mul__eq__0__ternary : forall x x0 x1 : imported_nat,
  imported_iff (imported_Corelib_Init_Logic_eq (imported_Nat_mul (imported_Nat_mul x x0) x1) imported_0)
    (imported_or (imported_Corelib_Init_Logic_eq x imported_0) (imported_or (imported_Corelib_Init_Logic_eq x0 imported_0) (imported_Corelib_Init_Logic_eq x1 imported_0))) := Imported.Original_LF__DOT__Logic_LF_Logic_mul__eq__0__ternary.
Instance Original_LF__DOT__Logic_LF_Logic_mul__eq__0__ternary_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6),
  rel_iso
    {|
      to :=
        iff_iso (Corelib_Init_Logic_eq_iso (Nat_mul_iso (Nat_mul_iso hx hx0) hx1) _0_iso)
          (or_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (or_iso (Corelib_Init_Logic_eq_iso hx0 _0_iso) (Corelib_Init_Logic_eq_iso hx1 _0_iso)));
      from :=
        from
          (iff_iso (Corelib_Init_Logic_eq_iso (Nat_mul_iso (Nat_mul_iso hx hx0) hx1) _0_iso)
             (or_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (or_iso (Corelib_Init_Logic_eq_iso hx0 _0_iso) (Corelib_Init_Logic_eq_iso hx1 _0_iso))));
      to_from :=
        fun
          x : imported_iff (imported_Corelib_Init_Logic_eq (imported_Nat_mul (imported_Nat_mul x2 x4) x6) imported_0)
                (imported_or (imported_Corelib_Init_Logic_eq x2 imported_0) (imported_or (imported_Corelib_Init_Logic_eq x4 imported_0) (imported_Corelib_Init_Logic_eq x6 imported_0))) =>
        to_from
          (iff_iso (Corelib_Init_Logic_eq_iso (Nat_mul_iso (Nat_mul_iso hx hx0) hx1) _0_iso)
             (or_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (or_iso (Corelib_Init_Logic_eq_iso hx0 _0_iso) (Corelib_Init_Logic_eq_iso hx1 _0_iso))))
          x;
      from_to :=
        fun x : x1 * x3 * x5 = 0 <-> x1 = 0 \/ x3 = 0 \/ x5 = 0 =>
        seq_p_of_t
          (from_to
             (iff_iso (Corelib_Init_Logic_eq_iso (Nat_mul_iso (Nat_mul_iso hx hx0) hx1) _0_iso)
                (or_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (or_iso (Corelib_Init_Logic_eq_iso hx0 _0_iso) (Corelib_Init_Logic_eq_iso hx1 _0_iso))))
             x)
    |} (Original.LF_DOT_Logic.LF.Logic.mul_eq_0_ternary x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_mul__eq__0__ternary x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.mul_eq_0_ternary := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_mul__eq__0__ternary := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.mul_eq_0_ternary Original_LF__DOT__Logic_LF_Logic_mul__eq__0__ternary_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.mul_eq_0_ternary Imported.Original_LF__DOT__Logic_LF_Logic_mul__eq__0__ternary Original_LF__DOT__Logic_LF_Logic_mul__eq__0__ternary_iso := {}.