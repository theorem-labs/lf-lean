From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(*Typeclasses Opaque rel_iso.*) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun1 : imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun1.

(* Helper lemma: sillyfun1 is compatible with to nat_iso *)
Lemma sillyfun1_iso_aux : forall n,
  IsomorphismDefinitions.eq
    (bool_to_imported (Original.LF_DOT_Tactics.LF.Tactics.sillyfun1 n))
    (Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun1 (nat_to_imported n)).
Proof.
  intro n.
  destruct n as [|n1]; [apply IsomorphismDefinitions.eq_refl|].
  destruct n1 as [|n2]; [apply IsomorphismDefinitions.eq_refl|].
  destruct n2 as [|n3]; [apply IsomorphismDefinitions.eq_refl|].
  destruct n3 as [|n4]; [apply IsomorphismDefinitions.eq_refl|].
  destruct n4 as [|n5]; [apply IsomorphismDefinitions.eq_refl|].
  destruct n5 as [|n6]; [apply IsomorphismDefinitions.eq_refl|].
  apply IsomorphismDefinitions.eq_refl.
Qed.

Instance Original_LF__DOT__Tactics_LF_Tactics_sillyfun1_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Tactics.LF.Tactics.sillyfun1 x1) (imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun1 x2).
Proof.
  intros x1 x2 H.
  constructor.
  destruct H as [H].
  simpl in *.
  unfold imported_Original_LF__DOT__Tactics_LF_Tactics_sillyfun1.
  eapply eq_trans.
  - apply sillyfun1_iso_aux.
  - apply f_equal. assumption.
Qed.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.sillyfun1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.sillyfun1 Original_LF__DOT__Tactics_LF_Tactics_sillyfun1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.sillyfun1 Imported.Original_LF__DOT__Tactics_LF_Tactics_sillyfun1 Original_LF__DOT__Tactics_LF_Tactics_sillyfun1_iso := {}.