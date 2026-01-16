From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__mul__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_mul__comm : forall x x0 : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_mul x x0) (imported_Nat_mul x0 x) := Imported.Original_LF__DOT__Induction_LF_Induction_mul__comm.
Instance Original_LF__DOT__Induction_LF_Induction_mul__comm_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_mul_iso hx hx0) (Nat_mul_iso hx0 hx)) (Original.LF_DOT_Induction.LF.Induction.mul_comm x1 x3)
    (imported_Original_LF__DOT__Induction_LF_Induction_mul__comm x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.mul_comm := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_mul__comm := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.mul_comm Original_LF__DOT__Induction_LF_Induction_mul__comm_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.mul_comm Imported.Original_LF__DOT__Induction_LF_Induction_mul__comm Original_LF__DOT__Induction_LF_Induction_mul__comm_iso := {}.