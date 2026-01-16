From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__mul__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_specialize__example : forall x : imported_nat, (forall x0 : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_mul x0 x) imported_0) -> imported_Corelib_Init_Logic_eq x imported_0 := Imported.Original_LF__DOT__Tactics_LF_Tactics_specialize__example.
Instance Original_LF__DOT__Tactics_LF_Tactics_specialize__example_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : forall m : nat, m * x1 = 0)
    (x4 : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_mul x x2) imported_0),
  (forall (x5 : nat) (x6 : imported_nat) (hx0 : rel_iso nat_iso x5 x6), rel_iso (Corelib_Init_Logic_eq_iso (Nat_mul_iso hx0 hx) _0_iso) (x3 x5) (x4 x6)) ->
  rel_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (Original.LF_DOT_Tactics.LF.Tactics.specialize_example x1 x3) (imported_Original_LF__DOT__Tactics_LF_Tactics_specialize__example x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.specialize_example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_specialize__example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.specialize_example Original_LF__DOT__Tactics_LF_Tactics_specialize__example_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.specialize_example Imported.Original_LF__DOT__Tactics_LF_Tactics_specialize__example Original_LF__DOT__Tactics_LF_Tactics_specialize__example_iso := {}.