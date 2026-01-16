From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)
From Stdlib Require Import Arith.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_aeval : (imported_String_string -> imported_nat) -> imported_Original_LF__DOT__Imp_LF_Imp_aexp -> imported_nat := Imported.Original_LF__DOT__Imp_LF_Imp_aeval.

(* nat operations compatibility *)
Fixpoint nat_add_i (n m : imported_nat) : imported_nat :=
  match n with
  | Imported.nat_O => m
  | Imported.nat_S n' => Imported.nat_S (nat_add_i n' m)
  end.

Fixpoint nat_sub_i (n m : imported_nat) : imported_nat :=
  match n, m with
  | Imported.nat_O, _ => Imported.nat_O
  | n, Imported.nat_O => n
  | Imported.nat_S n', Imported.nat_S m' => nat_sub_i n' m'
  end.

Fixpoint nat_mul_i (n m : imported_nat) : imported_nat :=
  match n with
  | Imported.nat_O => Imported.nat_O
  | Imported.nat_S n' => nat_add_i m (nat_mul_i n' m)
  end.

Lemma nat_to_imported_add : forall n m : Datatypes.nat,
  IsomorphismDefinitions.eq (to nat_iso (n + m)) (nat_add_i (to nat_iso n) (to nat_iso m)).
Proof.
  fix IH 1. intros n m. destruct n; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (f_equal Imported.nat_S (IH n m)).
Qed.

Lemma nat_to_imported_sub : forall n m : Datatypes.nat,
  IsomorphismDefinitions.eq (to nat_iso (n - m)) (nat_sub_i (to nat_iso n) (to nat_iso m)).
Proof.
  fix IH 1. intros n m. destruct n, m; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (IH n m).
Qed.

Lemma nat_to_imported_mul : forall n m : Datatypes.nat,
  IsomorphismDefinitions.eq (to nat_iso (n * m)) (nat_mul_i (to nat_iso n) (to nat_iso m)).
Proof.
  fix IH 1. intros n m. destruct n; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (eq_trans (nat_to_imported_add m (n * m))).
    apply (f_equal2 nat_add_i IsomorphismDefinitions.eq_refl (IH n m)).
Qed.

Lemma nat_add_i_eq : forall n m : imported_nat,
  IsomorphismDefinitions.eq (nat_add_i n m) (Imported.nat_add n m).
Proof.
  fix IH 1. intros n m. destruct n; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (f_equal Imported.nat_S (IH n m)).
Qed.

Lemma nat_sub_i_eq : forall n m : imported_nat,
  IsomorphismDefinitions.eq (nat_sub_i n m) (Imported.nat_sub n m).
Proof.
  fix IH 1. intros n m. destruct n, m; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (IH n m).
Qed.

Lemma nat_mul_i_eq : forall n m : imported_nat,
  IsomorphismDefinitions.eq (nat_mul_i n m) (Imported.nat_mul n m).
Proof.
  fix IH 1. intros n m. destruct n; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (eq_trans (nat_add_i_eq m (nat_mul_i n m))).
    apply (f_equal2 Imported.nat_add IsomorphismDefinitions.eq_refl (IH n m)).
Qed.

(* Helper: our simpler aeval definition *)
Fixpoint aeval_aux
    (st : imported_String_string -> imported_nat)
    (a : imported_Original_LF__DOT__Imp_LF_Imp_aexp)
  : imported_nat :=
  match a with
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum n => n
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId x => st x
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_APlus a1 a2 => nat_add_i (aeval_aux st a1) (aeval_aux st a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMinus a1 a2 => nat_sub_i (aeval_aux st a1) (aeval_aux st a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMult a1 a2 => nat_mul_i (aeval_aux st a1) (aeval_aux st a2)
  end.

Lemma aeval_aux_eq : forall st a,
  IsomorphismDefinitions.eq (aeval_aux st a) (imported_Original_LF__DOT__Imp_LF_Imp_aeval st a).
Proof.
  intros st a.
  induction a as [n | x | a1 IH1 a2 IH2 | a1 IH1 a2 IH2 | a1 IH1 a2 IH2]; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (eq_trans (nat_add_i_eq _ _)).
    apply (f_equal2 Imported.nat_add IH1 IH2).
  - apply (eq_trans (nat_sub_i_eq _ _)).
    apply (f_equal2 Imported.nat_sub IH1 IH2).
  - apply (eq_trans (nat_mul_i_eq _ _)).
    apply (f_equal2 Imported.nat_mul IH1 IH2).
Qed.

Lemma aeval_iso_core : forall (st : Original.LF_DOT_Imp.LF.Imp.state) (st' : imported_String_string -> imported_nat),
  (forall (x : String.string) (x' : imported_String_string), 
   rel_iso String_string_iso x x' -> rel_iso nat_iso (st x) (st' x')) ->
  forall a : Original.LF_DOT_Imp.LF.Imp.aexp,
  IsomorphismDefinitions.eq 
    (to nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a))
    (aeval_aux st' (aexp_to_imported a)).
Proof.
  intros st st' Hst.
  fix IH 1.
  intros a. destruct a as [n | x | a1 a2 | a1 a2 | a1 a2]; simpl.
  - (* ANum *) apply IsomorphismDefinitions.eq_refl.
  - (* AId *) apply (Hst x (to String_string_iso x) IsomorphismDefinitions.eq_refl).
  - (* APlus *)
    apply (eq_trans (nat_to_imported_add _ _)).
    apply (f_equal2 nat_add_i (IH a1) (IH a2)).
  - (* AMinus *)
    apply (eq_trans (nat_to_imported_sub _ _)).
    apply (f_equal2 nat_sub_i (IH a1) (IH a2)).
  - (* AMult *)
    apply (eq_trans (nat_to_imported_mul _ _)).
    apply (f_equal2 nat_mul_i (IH a1) (IH a2)).
Qed.

Instance Original_LF__DOT__Imp_LF_Imp_aeval_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat),
  (forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.aexp) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_aeval x2 x4).
Proof.
  intros st st' Hst a a' Ha.
  unfold rel_iso in Ha; simpl in Ha.
  unfold rel_iso; simpl.
  apply (eq_trans (aeval_iso_core st st' Hst a)).
  apply (eq_trans (aeval_aux_eq st' (aexp_to_imported a))).
  apply (f_equal (imported_Original_LF__DOT__Imp_LF_Imp_aeval st') Ha).
Qed.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.aeval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_aeval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.aeval Original_LF__DOT__Imp_LF_Imp_aeval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.aeval Imported.Original_LF__DOT__Imp_LF_Imp_aeval Original_LF__DOT__Imp_LF_Imp_aeval_iso := {}.