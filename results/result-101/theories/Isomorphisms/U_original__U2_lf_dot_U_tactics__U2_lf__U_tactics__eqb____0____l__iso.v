From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_eqb__0__l : forall x : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb imported_0 x) imported_Original_LF__DOT__Basics_LF_Basics_true -> imported_Corelib_Init_Logic_eq x imported_0 := Imported.Original_LF__DOT__Tactics_LF_Tactics_eqb__0__l.
Instance Original_LF__DOT__Tactics_LF_Tactics_eqb__0__l_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_Basics.LF.Basics.eqb 0 x1 = Original.LF_DOT_Basics.LF.Basics.true)
    (x4 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb imported_0 x2) imported_Original_LF__DOT__Basics_LF_Basics_true),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_eqb_iso _0_iso hx) Original_LF__DOT__Basics_LF_Basics_true_iso) x3 x4 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (Original.LF_DOT_Tactics.LF.Tactics.eqb_0_l x1 x3) (imported_Original_LF__DOT__Tactics_LF_Tactics_eqb__0__l x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.eqb_0_l := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_eqb__0__l := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.eqb_0_l Original_LF__DOT__Tactics_LF_Tactics_eqb__0__l_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.eqb_0_l Imported.Original_LF__DOT__Tactics_LF_Tactics_eqb__0__l Original_LF__DOT__Tactics_LF_Tactics_eqb__0__l_iso := {}.