From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_bar : imported_nat -> imported_nat := Imported.Original_LF__DOT__Tactics_LF_Tactics_bar.

(* Both bar functions always return 5. We prove they are related. *)
(* Original bar: fun x => match x with | O => 5 | S _ => 5 end *)
(* Imported bar: same structure, always returns five *)

Lemma bar_equiv : forall (x1 : nat),
  nat_to_imported (Original.LF_DOT_Tactics.LF.Tactics.bar x1) = Imported.Original_LF__DOT__Tactics_LF_Tactics_bar (nat_to_imported x1).
Proof.
  intro x1.
  destruct x1; reflexivity.
Qed.

Instance Original_LF__DOT__Tactics_LF_Tactics_bar_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Tactics.LF.Tactics.bar x1) (imported_Original_LF__DOT__Tactics_LF_Tactics_bar x2).
Proof.
  intros x1 x2 H.
  constructor. simpl in *.
  unfold imported_Original_LF__DOT__Tactics_LF_Tactics_bar.
  eapply eq_trans.
  - apply seq_of_eq. apply bar_equiv.
  - apply f_equal. exact H.
Defined.

Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.bar := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_bar := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.bar Original_LF__DOT__Tactics_LF_Tactics_bar_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.bar Imported.Original_LF__DOT__Tactics_LF_Tactics_bar Original_LF__DOT__Tactics_LF_Tactics_bar_iso := {}.
