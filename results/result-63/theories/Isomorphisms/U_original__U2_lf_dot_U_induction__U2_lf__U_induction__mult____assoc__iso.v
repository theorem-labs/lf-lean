From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__mul__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_mult__assoc : forall x x0 x1 : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_mul x (imported_Nat_mul x0 x1)) (imported_Nat_mul (imported_Nat_mul x x0) x1) := Imported.Original_LF__DOT__Induction_LF_Induction_mult__assoc.
Instance Original_LF__DOT__Induction_LF_Induction_mult__assoc_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6),
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_mul_iso hx (Nat_mul_iso hx0 hx1)) (Nat_mul_iso (Nat_mul_iso hx hx0) hx1)) (Original.LF_DOT_Induction.LF.Induction.mult_assoc x1 x3 x5)
    (imported_Original_LF__DOT__Induction_LF_Induction_mult__assoc x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.mult_assoc := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_mult__assoc := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.mult_assoc Original_LF__DOT__Induction_LF_Induction_mult__assoc_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.mult_assoc Imported.Original_LF__DOT__Induction_LF_Induction_mult__assoc Original_LF__DOT__Induction_LF_Induction_mult__assoc_iso := {}.