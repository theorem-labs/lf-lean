From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.nat__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun : imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun.

(* Helper lemma: sillyfun commutes with the isomorphism *)
Lemma sillyfun_commutes : forall (n : nat),
  IsomorphismDefinitions.eq 
    (to Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Tactics.LF.Tactics.sillyfun n))
    (Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun (to nat_iso n)).
Proof.
  intros n.
  unfold Original.LF_DOT_Tactics.LF.Tactics.sillyfun.
  unfold Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun.
  (* Both functions: check if n=3, if true return false; check if n=5, if true return false; else return false *)
  (* So both always return false *)
  (* We need to show that the structure matches *)
  pose proof (eqb_iso_helper n 3) as H3.
  pose proof (eqb_iso_helper n 5) as H5.
  (* The key insight: regardless of the branch, both sides return bool_false *)
  destruct (Original.LF_DOT_Basics.LF.Basics.eqb n 3) eqn:E3;
  destruct (Original.LF_DOT_Basics.LF.Basics.eqb n 5) eqn:E5;
  simpl in *;
  destruct H3; destruct H5;
  apply IsomorphismDefinitions.eq_refl.
Qed.

Instance Original_LF__DOT__Tactics_LF_Tactics_sillyfun_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Tactics.LF.Tactics.sillyfun x1) (imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun x2).
Proof.
  intros x1 x2 H.
  destruct H as [H'].
  unfold imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun.
  constructor.
  pose proof (sillyfun_commutes x1) as Hc.
  apply IsoEq.eq_of_seq in H'.
  subst x2.
  exact Hc.
Defined.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.sillyfun := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.sillyfun Original_LF__DOT__Tactics_LF_Tactics_sillyfun_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.sillyfun Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun Original_LF__DOT__Tactics_LF_Tactics_sillyfun_iso := {}.