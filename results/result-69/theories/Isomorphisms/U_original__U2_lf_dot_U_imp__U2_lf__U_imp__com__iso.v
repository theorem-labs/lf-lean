From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From Stdlib Require Import Ascii String.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.


Definition imported_Original_LF__DOT__Imp_LF_Imp_com : Type := Imported.Original_LF__DOT__Imp_LF_Imp_com.

(* com isomorphism *)
Fixpoint com_to_imported (c : Original.LF_DOT_Imp.LF.Imp.com) : Imported.Original_LF__DOT__Imp_LF_Imp_com :=
  match c with
  | Original.LF_DOT_Imp.LF.Imp.CSkip => Imported.Original_LF__DOT__Imp_LF_Imp_com_CSkip
  | Original.LF_DOT_Imp.LF.Imp.CAsgn s a => 
      Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn (string_to_imported s) (aexp_to_imported a)
  | Original.LF_DOT_Imp.LF.Imp.CSeq c1 c2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq (com_to_imported c1) (com_to_imported c2)
  | Original.LF_DOT_Imp.LF.Imp.CIf b c1 c2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf (bexp_to_imported b) (com_to_imported c1) (com_to_imported c2)
  | Original.LF_DOT_Imp.LF.Imp.CWhile b c1 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile (bexp_to_imported b) (com_to_imported c1)
  end.

Fixpoint com_from_imported (c : Imported.Original_LF__DOT__Imp_LF_Imp_com) : Original.LF_DOT_Imp.LF.Imp.com :=
  match c with
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CSkip => Original.LF_DOT_Imp.LF.Imp.CSkip
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn s a => 
      Original.LF_DOT_Imp.LF.Imp.CAsgn (string_from_imported s) (aexp_from_imported a)
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq c1 c2 => 
      Original.LF_DOT_Imp.LF.Imp.CSeq (com_from_imported c1) (com_from_imported c2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf b c1 c2 => 
      Original.LF_DOT_Imp.LF.Imp.CIf (bexp_from_imported b) (com_from_imported c1) (com_from_imported c2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b c1 => 
      Original.LF_DOT_Imp.LF.Imp.CWhile (bexp_from_imported b) (com_from_imported c1)
  end.

(* Helper lemmas for com constructors *)
Lemma imported_com_CAsgn_eq : forall s s' a a',
  @Logic.eq _ s s' -> @Logic.eq _ a a' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn s a) (Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn s' a').
Proof. intros. destruct H. destruct H0. reflexivity. Defined.

Lemma imported_com_CSeq_eq : forall c1 c1' c2 c2',
  @Logic.eq _ c1 c1' -> @Logic.eq _ c2 c2' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq c1 c2) (Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq c1' c2').
Proof. intros. destruct H. destruct H0. reflexivity. Defined.

Lemma imported_com_CIf_eq : forall b b' c1 c1' c2 c2',
  @Logic.eq _ b b' -> @Logic.eq _ c1 c1' -> @Logic.eq _ c2 c2' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf b c1 c2) (Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf b' c1' c2').
Proof. intros. destruct H. destruct H0. destruct H1. reflexivity. Defined.

Lemma imported_com_CWhile_eq : forall b b' c c',
  @Logic.eq _ b b' -> @Logic.eq _ c c' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b c) (Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b' c').
Proof. intros. destruct H. destruct H0. reflexivity. Defined.

Lemma coq_com_CAsgn_eq : forall s s' a a',
  @Logic.eq _ s s' -> @Logic.eq _ a a' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.CAsgn s a) (Original.LF_DOT_Imp.LF.Imp.CAsgn s' a').
Proof. intros. destruct H. destruct H0. reflexivity. Defined.

Lemma coq_com_CSeq_eq : forall c1 c1' c2 c2',
  @Logic.eq _ c1 c1' -> @Logic.eq _ c2 c2' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.CSeq c1 c2) (Original.LF_DOT_Imp.LF.Imp.CSeq c1' c2').
Proof. intros. destruct H. destruct H0. reflexivity. Defined.

Lemma coq_com_CIf_eq : forall b b' c1 c1' c2 c2',
  @Logic.eq _ b b' -> @Logic.eq _ c1 c1' -> @Logic.eq _ c2 c2' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.CIf b c1 c2) (Original.LF_DOT_Imp.LF.Imp.CIf b' c1' c2').
Proof. intros. destruct H. destruct H0. destruct H1. reflexivity. Defined.

Lemma coq_com_CWhile_eq : forall b b' c c',
  @Logic.eq _ b b' -> @Logic.eq _ c c' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.CWhile b c) (Original.LF_DOT_Imp.LF.Imp.CWhile b' c').
Proof. intros. destruct H. destruct H0. reflexivity. Defined.

Lemma com_to_from : forall c, com_to_imported (com_from_imported c) = c.
Proof.
  fix IH 1.
  destruct c.
  - reflexivity.
  - simpl. apply imported_com_CAsgn_eq; [apply string_to_from | apply aexp_to_from].
  - simpl. apply imported_com_CSeq_eq; apply IH.
  - simpl. apply imported_com_CIf_eq; [apply bexp_to_from | apply IH | apply IH].
  - simpl. apply imported_com_CWhile_eq; [apply bexp_to_from | apply IH].
Defined.

Lemma com_from_to : forall c, com_from_imported (com_to_imported c) = c.
Proof.
  fix IH 1.
  destruct c.
  - reflexivity.
  - simpl. apply coq_com_CAsgn_eq; [apply string_from_to | apply aexp_from_to].
  - simpl. apply coq_com_CSeq_eq; apply IH.
  - simpl. apply coq_com_CIf_eq; [apply bexp_from_to | apply IH | apply IH].
  - simpl. apply coq_com_CWhile_eq; [apply bexp_from_to | apply IH].
Defined.

Instance Original_LF__DOT__Imp_LF_Imp_com_iso : Iso Original.LF_DOT_Imp.LF.Imp.com imported_Original_LF__DOT__Imp_LF_Imp_com := {|
  to := com_to_imported;
  from := com_from_imported;
  to_from := fun x => logic_eq_to_iso_eq (com_to_from x);
  from_to := fun x => logic_eq_to_iso_eq (com_from_to x);
|}.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.com := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_com := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.com Original_LF__DOT__Imp_LF_Imp_com_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.com Imported.Original_LF__DOT__Imp_LF_Imp_com Original_LF__DOT__Imp_LF_Imp_com_iso := {}.
