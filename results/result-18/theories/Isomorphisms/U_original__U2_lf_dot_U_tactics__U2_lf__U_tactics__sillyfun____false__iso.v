From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__sillyfun__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun__false : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun x) imported_Original_LF__DOT__Basics_LF_Basics_false := Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun__false.

(* This is an isomorphism between admitted theorems *)
Instance Original_LF__DOT__Tactics_LF_Tactics_sillyfun__false_iso : forall (x1 : Datatypes.nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Tactics_LF_Tactics_sillyfun_iso hx) Original_LF__DOT__Basics_LF_Basics_false_iso) (Original.LF_DOT_Tactics.LF.Tactics.sillyfun_false x1)
    (imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun__false x2).
Proof.
  intros x1 x2 hx.
  constructor.
  (* Both sides are in SProp - they're equal by SProp proof irrelevance *)
  apply IsomorphismDefinitions.eq_refl.
Qed.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.sillyfun_false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun__false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.sillyfun_false Original_LF__DOT__Tactics_LF_Tactics_sillyfun__false_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.sillyfun_false Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun__false Original_LF__DOT__Tactics_LF_Tactics_sillyfun__false_iso := {}.