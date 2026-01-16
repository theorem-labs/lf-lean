From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From Stdlib Require Import Ascii String.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.


Definition imported_Original_LF__DOT__Imp_LF_Imp_bexp : Type := Imported.Original_LF__DOT__Imp_LF_Imp_bexp.

(* Now we define the bexp isomorphism *)
Fixpoint bexp_to_imported (b : Original.LF_DOT_Imp.LF.Imp.bexp) : Imported.Original_LF__DOT__Imp_LF_Imp_bexp :=
  match b with
  | Original.LF_DOT_Imp.LF.Imp.BTrue => Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BTrue
  | Original.LF_DOT_Imp.LF.Imp.BFalse => Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BFalse
  | Original.LF_DOT_Imp.LF.Imp.BEq a1 a2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BEq (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.BNeq a1 a2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNeq (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.BLe a1 a2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BLe (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.BGt a1 a2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BGt (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.BNot b1 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNot (bexp_to_imported b1)
  | Original.LF_DOT_Imp.LF.Imp.BAnd b1 b2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BAnd (bexp_to_imported b1) (bexp_to_imported b2)
  end.

Fixpoint bexp_from_imported (b : Imported.Original_LF__DOT__Imp_LF_Imp_bexp) : Original.LF_DOT_Imp.LF.Imp.bexp :=
  match b with
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BTrue => Original.LF_DOT_Imp.LF.Imp.BTrue
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BFalse => Original.LF_DOT_Imp.LF.Imp.BFalse
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BEq a1 a2 => 
      Original.LF_DOT_Imp.LF.Imp.BEq (aexp_from_imported a1) (aexp_from_imported a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNeq a1 a2 => 
      Original.LF_DOT_Imp.LF.Imp.BNeq (aexp_from_imported a1) (aexp_from_imported a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BLe a1 a2 => 
      Original.LF_DOT_Imp.LF.Imp.BLe (aexp_from_imported a1) (aexp_from_imported a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BGt a1 a2 => 
      Original.LF_DOT_Imp.LF.Imp.BGt (aexp_from_imported a1) (aexp_from_imported a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNot b1 => 
      Original.LF_DOT_Imp.LF.Imp.BNot (bexp_from_imported b1)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BAnd b1 b2 => 
      Original.LF_DOT_Imp.LF.Imp.BAnd (bexp_from_imported b1) (bexp_from_imported b2)
  end.

(* Helper lemmas for bexp constructors *)
Lemma imported_bexp_BEq_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BEq a1 a2) (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BEq a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Qed.

Lemma imported_bexp_BNeq_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNeq a1 a2) (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNeq a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Qed.

Lemma imported_bexp_BLe_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BLe a1 a2) (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BLe a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Qed.

Lemma imported_bexp_BGt_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BGt a1 a2) (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BGt a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Qed.

Lemma imported_bexp_BNot_eq : forall b b',
  @Logic.eq _ b b' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNot b) (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNot b').
Proof. intros. destruct H. reflexivity. Qed.

Lemma imported_bexp_BAnd_eq : forall b1 b1' b2 b2',
  @Logic.eq _ b1 b1' -> @Logic.eq _ b2 b2' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BAnd b1 b2) (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BAnd b1' b2').
Proof. intros. destruct H. destruct H0. reflexivity. Qed.

Lemma coq_bexp_BEq_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.BEq a1 a2) (Original.LF_DOT_Imp.LF.Imp.BEq a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Qed.

Lemma coq_bexp_BNeq_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.BNeq a1 a2) (Original.LF_DOT_Imp.LF.Imp.BNeq a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Qed.

Lemma coq_bexp_BLe_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.BLe a1 a2) (Original.LF_DOT_Imp.LF.Imp.BLe a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Qed.

Lemma coq_bexp_BGt_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.BGt a1 a2) (Original.LF_DOT_Imp.LF.Imp.BGt a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Qed.

Lemma coq_bexp_BNot_eq : forall b b',
  @Logic.eq _ b b' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.BNot b) (Original.LF_DOT_Imp.LF.Imp.BNot b').
Proof. intros. destruct H. reflexivity. Qed.

Lemma coq_bexp_BAnd_eq : forall b1 b1' b2 b2',
  @Logic.eq _ b1 b1' -> @Logic.eq _ b2 b2' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.BAnd b1 b2) (Original.LF_DOT_Imp.LF.Imp.BAnd b1' b2').
Proof. intros. destruct H. destruct H0. reflexivity. Qed.

Lemma bexp_to_from : forall b, bexp_to_imported (bexp_from_imported b) = b.
Proof.
  fix IH 1.
  destruct b.
  - reflexivity.
  - reflexivity.
  - simpl. apply imported_bexp_BEq_eq; apply aexp_to_from.
  - simpl. apply imported_bexp_BNeq_eq; apply aexp_to_from.
  - simpl. apply imported_bexp_BLe_eq; apply aexp_to_from.
  - simpl. apply imported_bexp_BGt_eq; apply aexp_to_from.
  - simpl. apply imported_bexp_BNot_eq; apply IH.
  - simpl. apply imported_bexp_BAnd_eq; apply IH.
Qed.

Lemma bexp_from_to : forall b, bexp_from_imported (bexp_to_imported b) = b.
Proof.
  fix IH 1.
  destruct b.
  - reflexivity.
  - reflexivity.
  - simpl. apply coq_bexp_BEq_eq; apply aexp_from_to.
  - simpl. apply coq_bexp_BNeq_eq; apply aexp_from_to.
  - simpl. apply coq_bexp_BLe_eq; apply aexp_from_to.
  - simpl. apply coq_bexp_BGt_eq; apply aexp_from_to.
  - simpl. apply coq_bexp_BNot_eq; apply IH.
  - simpl. apply coq_bexp_BAnd_eq; apply IH.
Qed.

Instance Original_LF__DOT__Imp_LF_Imp_bexp_iso : Iso Original.LF_DOT_Imp.LF.Imp.bexp imported_Original_LF__DOT__Imp_LF_Imp_bexp := {|
  to := bexp_to_imported;
  from := bexp_from_imported;
  to_from := fun x => logic_eq_to_iso_eq (bexp_to_from x);
  from_to := fun x => logic_eq_to_iso_eq (bexp_from_to x);
|}.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.bexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_bexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.bexp Original_LF__DOT__Imp_LF_Imp_bexp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.bexp Imported.Original_LF__DOT__Imp_LF_Imp_bexp Original_LF__DOT__Imp_LF_Imp_bexp_iso := {}.
