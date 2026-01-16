From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__mul__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Induction_LF_Induction_mult__1__l : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_mul (imported_S imported_0) x) x := Imported.Original_LF__DOT__Induction_LF_Induction_mult__1__l.
Monomorphic Instance Original_LF__DOT__Induction_LF_Induction_mult__1__l_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_mul_iso (S_iso _0_iso) hx) hx) (Original.LF_DOT_Induction.LF.Induction.mult_1_l x1) (imported_Original_LF__DOT__Induction_LF_Induction_mult__1__l x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.mult_1_l := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_mult__1__l := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.mult_1_l Original_LF__DOT__Induction_LF_Induction_mult__1__l_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.mult_1_l Imported.Original_LF__DOT__Induction_LF_Induction_mult__1__l Original_LF__DOT__Induction_LF_Induction_mult__1__l_iso := {}.