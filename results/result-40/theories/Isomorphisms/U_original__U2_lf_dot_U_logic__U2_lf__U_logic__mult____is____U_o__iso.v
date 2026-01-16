From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__mul__iso Isomorphisms.or__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_mult__is__O : forall x x0 : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Nat_mul x x0) imported_0 -> imported_or (imported_Corelib_Init_Logic_eq x imported_0) (imported_Corelib_Init_Logic_eq x0 imported_0) := Imported.Original_LF__DOT__Logic_LF_Logic_mult__is__O.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_mult__is__O_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : x1 * x3 = O)
    (x6 : imported_Corelib_Init_Logic_eq (imported_Nat_mul x2 x4) imported_0),
  rel_iso (relax_Iso_Ts_Ps (Corelib_Init_Logic_eq_iso (Nat_mul_iso hx hx0) _0_iso)) x5 x6 ->
  rel_iso (relax_Iso_Ts_Ps (or_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (Corelib_Init_Logic_eq_iso hx0 _0_iso))) (Original.LF_DOT_Logic.LF.Logic.mult_is_O x1 x3 x5)
    (imported_Original_LF__DOT__Logic_LF_Logic_mult__is__O x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.mult_is_O := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_mult__is__O := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.mult_is_O Original_LF__DOT__Logic_LF_Logic_mult__is__O_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.mult_is_O Imported.Original_LF__DOT__Logic_LF_Logic_mult__is__O Original_LF__DOT__Logic_LF_Logic_mult__is__O_iso := {}.