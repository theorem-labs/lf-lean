From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aexp__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp -> imported_nat -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR.

(* Helper lemmas for relating operations *)
Lemma plus_nat_to_imported : forall n m,
  nat_to_imported (n + m) = Imported.nat_add (nat_to_imported n) (nat_to_imported m).
Proof.
  induction n; intros m.
  - simpl. reflexivity.
  - simpl.
    change (Imported.nat_add (Imported.nat_S (nat_to_imported n)) (nat_to_imported m)) with
      (Imported.nat_S (Imported.nat_add (nat_to_imported n) (nat_to_imported m))).
    f_equal.
    apply IHn.
Defined.

Lemma minus_nat_to_imported : forall n m,
  nat_to_imported (n - m) = Imported.nat_sub (nat_to_imported n) (nat_to_imported m).
Proof.
  induction n; intros m.
  - simpl. destruct m; reflexivity.
  - destruct m.
    + simpl. reflexivity.
    + simpl. apply IHn.
Defined.

Lemma mult_nat_to_imported : forall n m,
  nat_to_imported (n * m) = Imported.nat_mul (nat_to_imported n) (nat_to_imported m).
Proof.
  induction n; intros m.
  - simpl. reflexivity.
  - simpl.
    change (Imported.nat_mul (Imported.nat_S (nat_to_imported n)) (nat_to_imported m)) with
      (Imported.nat_add (nat_to_imported m) (Imported.nat_mul (nat_to_imported n) (nat_to_imported m))).
    rewrite <- IHn.
    rewrite <- plus_nat_to_imported.
    reflexivity.
Defined.

(* Forward direction: Original -> Imported *)
Definition aevalR_to_imported : forall (a : Original.LF_DOT_Imp.LF.Imp.AExp.aexp) (n : nat),
  Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.aevalR a n ->
  imported_Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR (aexp_to_imported a) (nat_to_imported n).
Proof.
  fix IH 3.
  intros a n H.
  destruct H.
  - simpl. apply Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR_E_ANum.
  - simpl.
    rewrite plus_nat_to_imported.
    apply Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR_E_APlus.
    + apply IH. exact H.
    + apply IH. exact H0.
  - simpl.
    rewrite minus_nat_to_imported.
    apply Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR_E_AMinus.
    + apply IH. exact H.
    + apply IH. exact H0.
  - simpl.
    rewrite mult_nat_to_imported.
    apply Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR_E_AMult.
    + apply IH. exact H.
    + apply IH. exact H0.
Defined.

(* Helper lemmas for the reverse direction *)
Lemma imported_to_nat_plus : forall n m,
  imported_to_nat (Imported.nat_add n m) = imported_to_nat n + imported_to_nat m.
Proof.
  induction n; intros m.
  - simpl. reflexivity.
  - simpl.
    change (Imported.nat_add (Imported.nat_S n) m) with
      (Imported.nat_S (Imported.nat_add n m)).
    simpl. f_equal. apply IHn.
Defined.

Lemma imported_to_nat_minus : forall n m,
  imported_to_nat (Imported.nat_sub n m) = imported_to_nat n - imported_to_nat m.
Proof.
  induction n; intros m.
  - simpl. destruct m; reflexivity.
  - destruct m.
    + simpl. reflexivity.
    + simpl.
      change (Imported.nat_sub (Imported.nat_S n) (Imported.nat_S m)) with
        (Imported.nat_sub n m).
      apply IHn.
Defined.

Lemma imported_to_nat_mult : forall n m,
  imported_to_nat (Imported.nat_mul n m) = imported_to_nat n * imported_to_nat m.
Proof.
  induction n; intros m.
  - simpl. reflexivity.
  - change (Imported.nat_mul (Imported.nat_S n) m) with
      (Imported.nat_add m (Imported.nat_mul n m)).
    simpl imported_to_nat at 2.
    simpl Nat.mul.
    transitivity (imported_to_nat m + imported_to_nat (Imported.nat_mul n m)).
    + apply imported_to_nat_plus.
    + f_equal. apply IHn.
Defined.

(* Backward direction: Imported -> Original (in SProp) *)
(* We can't directly destruct SProp to produce Prop, so we build an SProp version *)
Definition aevalR_from_imported_sprop : forall (a : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp) (n : imported_nat),
  imported_Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR a n ->
  SInhabited (Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.aevalR (imported_to_aexp a) (imported_to_nat n)).
Proof.
  fix IH 3.
  intros a n H.
  destruct H.
  - simpl. apply sinhabits. apply Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.E_ANum.
  - simpl.
    rewrite imported_to_nat_plus.
    apply sinhabits.
    apply Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.E_APlus.
    + apply sinhabitant. apply IH. exact H.
    + apply sinhabitant. apply IH. exact H0.
  - simpl.
    rewrite imported_to_nat_minus.
    apply sinhabits.
    apply Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.E_AMinus.
    + apply sinhabitant. apply IH. exact H.
    + apply sinhabitant. apply IH. exact H0.
  - simpl.
    rewrite imported_to_nat_mult.
    apply sinhabits.
    apply Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.E_AMult.
    + apply sinhabitant. apply IH. exact H.
    + apply sinhabitant. apply IH. exact H0.
Defined.

Definition aevalR_from_imported (a : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp) (n : imported_nat)
  (H : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR a n)
  : Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.aevalR (imported_to_aexp a) (imported_to_nat n).
Proof.
  apply sinhabitant.
  apply aevalR_from_imported_sprop.
  exact H.
Defined.

Lemma aexp_round_trip : forall a, imported_to_aexp (aexp_to_imported a) = a.
Proof.
  intro a. induction a.
  - simpl.
    f_equal.
    induction n.
    + reflexivity.
    + simpl. f_equal. exact IHn.
  - simpl. f_equal; assumption.
  - simpl. f_equal; assumption.
  - simpl. f_equal; assumption.
Defined.

Lemma nat_round_trip : forall n, imported_to_nat (nat_to_imported n) = n.
Proof.
  intro n. induction n.
  - reflexivity.
  - simpl. f_equal. exact IHn.
Defined.

Instance Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat),
  rel_iso nat_iso x3 x4 -> Iso (Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.aevalR x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR x2 x4).
Proof.
  intros x1 x2 Haexp x3 x4 Hnat.
  simpl in *.
  simpl in *.
  (* x2 = aexp_to_imported x1 and x4 = nat_to_imported x3 *)
  (* Use destruct on the equalities *)
  destruct Haexp.
  destruct Hnat.
  (* Now x2 = aexp_to_imported x1 and x4 = nat_to_imported x3 definitionally *)
  (* Build the Iso directly *)
  unshelve eapply Build_Iso.
  - (* to: aevalR x1 x3 -> imported_aevalR (aexp_to_imported x1) (nat_to_imported x3) *)
    intro H.
    apply aevalR_to_imported.
    exact H.
  - (* from: imported_aevalR (aexp_to_imported x1) (nat_to_imported x3) -> aevalR x1 x3 *)
    intro H.
    pose proof (@aevalR_from_imported (aexp_to_imported x1) (nat_to_imported x3) H) as Hresult.
    rewrite aexp_round_trip in Hresult.
    rewrite nat_round_trip in Hresult.
    exact Hresult.
  - (* to_from: forall y, to (from y) = y (in SProp) *)
    intro H. apply IsomorphismDefinitions.eq_refl.
  - (* from_to: forall x, from (to x) = x (in SProp for Prop type) *)
    intro H. apply IsoEq.seq_of_peq_t. apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.aevalR := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.aevalR Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.aevalR Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR_iso := {}.