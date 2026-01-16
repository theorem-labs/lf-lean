From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_nat__mul__iso.

Monomorphic Definition imported_Original_LF__DOT__Induction_LF_Induction_mult__0__plus' : forall x x0 : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_mul (imported_Nat_add (imported_Nat_add x imported_0) imported_0) x0) (imported_Nat_mul x x0) := Imported.Original_LF__DOT__Induction_LF_Induction_mult__0__plus'.
Monomorphic Instance Original_LF__DOT__Induction_LF_Induction_mult__0__plus'_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_mul_iso (Nat_add_iso (Nat_add_iso hx _0_iso) _0_iso) hx0) (Nat_mul_iso hx hx0)) (Original.LF_DOT_Induction.LF.Induction.mult_0_plus' x1 x3)
    (imported_Original_LF__DOT__Induction_LF_Induction_mult__0__plus' x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.mult_0_plus' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_mult__0__plus' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.mult_0_plus' Original_LF__DOT__Induction_LF_Induction_mult__0__plus'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.mult_0_plus' Imported.Original_LF__DOT__Induction_LF_Induction_mult__0__plus' Original_LF__DOT__Induction_LF_Induction_mult__0__plus'_iso := {}.