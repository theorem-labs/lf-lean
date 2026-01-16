From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__mul__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_mul__0__r : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_mul x imported_0) imported_0 := Imported.Original_LF__DOT__Induction_LF_Induction_mul__0__r.

Instance Original_LF__DOT__Induction_LF_Induction_mul__0__r_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_mul_iso hx _0_iso) _0_iso) (Original.LF_DOT_Induction.LF.Induction.mul_0_r x1) (imported_Original_LF__DOT__Induction_LF_Induction_mul__0__r x2).
Admitted.

Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.mul_0_r := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_mul__0__r := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.mul_0_r Original_LF__DOT__Induction_LF_Induction_mul__0__r_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.mul_0_r Imported.Original_LF__DOT__Induction_LF_Induction_mul__0__r Original_LF__DOT__Induction_LF_Induction_mul__0__r_iso := {}.
