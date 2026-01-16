From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__mul__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_mult__n__1 : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_mul x (imported_S imported_0)) x := Imported.Original_LF__DOT__Basics_LF_Basics_mult__n__1.
Instance Original_LF__DOT__Basics_LF_Basics_mult__n__1_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_mul_iso hx (S_iso _0_iso)) hx) (Original.LF_DOT_Basics.LF.Basics.mult_n_1 x1) (imported_Original_LF__DOT__Basics_LF_Basics_mult__n__1 x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.mult_n_1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_mult__n__1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.mult_n_1 Original_LF__DOT__Basics_LF_Basics_mult__n__1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.mult_n_1 Imported.Original_LF__DOT__Basics_LF_Basics_mult__n__1 Original_LF__DOT__Basics_LF_Basics_mult__n__1_iso := {}.