From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__double__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_double__injective : forall x x0 : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Induction_LF_Induction_double x) (imported_Original_LF__DOT__Induction_LF_Induction_double x0) -> imported_Corelib_Init_Logic_eq x x0 := Imported.Original_LF__DOT__Tactics_LF_Tactics_double__injective.
Instance Original_LF__DOT__Tactics_LF_Tactics_double__injective_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4)
    (x5 : Original.LF_DOT_Induction.LF.Induction.double x1 = Original.LF_DOT_Induction.LF.Induction.double x3)
    (x6 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Induction_LF_Induction_double x2) (imported_Original_LF__DOT__Induction_LF_Induction_double x4)),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Induction_LF_Induction_double_iso hx) (Original_LF__DOT__Induction_LF_Induction_double_iso hx0)) x5 x6 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx hx0) (Original.LF_DOT_Tactics.LF.Tactics.double_injective x1 x3 x5) (imported_Original_LF__DOT__Tactics_LF_Tactics_double__injective x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.double_injective := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_double__injective := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.double_injective Original_LF__DOT__Tactics_LF_Tactics_double__injective_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.double_injective Imported.Original_LF__DOT__Tactics_LF_Tactics_double__injective Original_LF__DOT__Tactics_LF_Tactics_double__injective_iso := {}.