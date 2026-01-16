From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__odd__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__sillyfun1__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun1__odd : forall x : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun1 x) imported_Original_LF__DOT__Basics_LF_Basics_true ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_odd x) imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun1__odd.
Instance Original_LF__DOT__Tactics_LF_Tactics_sillyfun1__odd_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_Tactics.LF.Tactics.sillyfun1 x1 = Original.LF_DOT_Basics.LF.Basics.true)
    (x4 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun1 x2) imported_Original_LF__DOT__Basics_LF_Basics_true),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Tactics_LF_Tactics_sillyfun1_iso hx) Original_LF__DOT__Basics_LF_Basics_true_iso) x3 x4 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_odd_iso hx) Original_LF__DOT__Basics_LF_Basics_true_iso) (Original.LF_DOT_Tactics.LF.Tactics.sillyfun1_odd x1 x3)
    (imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun1__odd x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.sillyfun1_odd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun1__odd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.sillyfun1_odd Original_LF__DOT__Tactics_LF_Tactics_sillyfun1__odd_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.sillyfun1_odd Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun1__odd Original_LF__DOT__Tactics_LF_Tactics_sillyfun1__odd_iso := {}.