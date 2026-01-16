From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)
From Stdlib Require Import Arith.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso Isomorphisms.bool__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aeval__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_beval : (imported_String_string -> imported_nat) -> imported_Original_LF__DOT__Imp_LF_Imp_bexp -> imported_bool := Imported.Original_LF__DOT__Imp_LF_Imp_beval.

(* Helper for converting bool to imported mybool *)
Definition bool_to_imported (b : bool) : imported_bool :=
  match b with
  | true => Imported.mybool_mytrue
  | false => Imported.mybool_myfalse
  end.

(* nat comparison compatibility *)
Fixpoint nat_eqb_i (n m : imported_nat) : imported_bool :=
  match n, m with
  | Imported.nat_O, Imported.nat_O => Imported.mybool_mytrue
  | Imported.nat_O, Imported.nat_S _ => Imported.mybool_myfalse
  | Imported.nat_S _, Imported.nat_O => Imported.mybool_myfalse
  | Imported.nat_S n', Imported.nat_S m' => nat_eqb_i n' m'
  end.

Fixpoint nat_leb_i (n m : imported_nat) : imported_bool :=
  match n, m with
  | Imported.nat_O, _ => Imported.mybool_mytrue
  | Imported.nat_S _, Imported.nat_O => Imported.mybool_myfalse
  | Imported.nat_S n', Imported.nat_S m' => nat_leb_i n' m'
  end.

Definition negb_i (b : imported_bool) : imported_bool :=
  match b with
  | Imported.mybool_mytrue => Imported.mybool_myfalse
  | Imported.mybool_myfalse => Imported.mybool_mytrue
  end.

Definition andb_i (b1 b2 : imported_bool) : imported_bool :=
  match b1 with
  | Imported.mybool_mytrue => b2
  | Imported.mybool_myfalse => Imported.mybool_myfalse
  end.

Lemma nat_to_imported_eqb : forall n m : Datatypes.nat,
  IsomorphismDefinitions.eq (bool_to_imported (PeanoNat.Nat.eqb n m)) (nat_eqb_i (to nat_iso n) (to nat_iso m)).
Proof.
  fix IH 1. intros n m. destruct n, m; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (IH n m).
Qed.

Lemma nat_to_imported_leb : forall n m : Datatypes.nat,
  IsomorphismDefinitions.eq (bool_to_imported (PeanoNat.Nat.leb n m)) (nat_leb_i (to nat_iso n) (to nat_iso m)).
Proof.
  fix IH 1. intros n m. destruct n, m; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (IH n m).
Qed.

Lemma bool_to_imported_negb : forall b : Datatypes.bool,
  IsomorphismDefinitions.eq (bool_to_imported (Datatypes.negb b)) (negb_i (bool_to_imported b)).
Proof.
  intros b. destruct b; apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma bool_to_imported_andb : forall b1 b2 : Datatypes.bool,
  IsomorphismDefinitions.eq (bool_to_imported (Datatypes.andb b1 b2)) (andb_i (bool_to_imported b1) (bool_to_imported b2)).
Proof.
  intros b1 b2. destruct b1, b2; apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma nat_eqb_i_eq : forall n m : imported_nat,
  IsomorphismDefinitions.eq (nat_eqb_i n m) (Imported.nat_eqb n m).
Proof.
  fix IH 1. intros n m. destruct n, m; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (IH n m).
Qed.

Lemma nat_leb_i_eq : forall n m : imported_nat,
  IsomorphismDefinitions.eq (nat_leb_i n m) (Imported.nat_leb n m).
Proof.
  fix IH 1. intros n m. destruct n, m; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (IH n m).
Qed.

Lemma negb_i_eq : forall b : imported_bool,
  IsomorphismDefinitions.eq (negb_i b) (Imported.bool_negb b).
Proof.
  intros b. destruct b; apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma andb_i_eq : forall b1 b2 : imported_bool,
  IsomorphismDefinitions.eq (andb_i b1 b2) (Imported.bool_andb b1 b2).
Proof.
  intros b1 b2. destruct b1, b2; apply IsomorphismDefinitions.eq_refl.
Qed.

(* Helper: our simpler beval definition *)
Fixpoint beval_aux
    (st : imported_String_string -> imported_nat)
    (b : imported_Original_LF__DOT__Imp_LF_Imp_bexp)
  : imported_bool :=
  match b with
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BTrue => Imported.mybool_mytrue
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BFalse => Imported.mybool_myfalse
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BEq a1 a2 => nat_eqb_i (aeval_aux st a1) (aeval_aux st a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNeq a1 a2 => negb_i (nat_eqb_i (aeval_aux st a1) (aeval_aux st a2))
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BLe a1 a2 => nat_leb_i (aeval_aux st a1) (aeval_aux st a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BGt a1 a2 => negb_i (nat_leb_i (aeval_aux st a1) (aeval_aux st a2))
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNot b1 => negb_i (beval_aux st b1)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BAnd b1 b2 => andb_i (beval_aux st b1) (beval_aux st b2)
  end.

Lemma beval_aux_eq : forall st b,
  IsomorphismDefinitions.eq (beval_aux st b) (imported_Original_LF__DOT__Imp_LF_Imp_beval st b).
Proof.
  intros st b.
  induction b as [| | a1 a2 | a1 a2 | a1 a2 | a1 a2 | b1 IHb1 | b1 IHb1 b2 IHb2]; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - (* BEq *)
    apply (eq_trans (nat_eqb_i_eq _ _)).
    apply (f_equal2 Imported.nat_eqb (aeval_aux_eq st a1) (aeval_aux_eq st a2)).
  - (* BNeq *)
    apply (eq_trans (negb_i_eq _)).
    apply (f_equal Imported.bool_negb).
    apply (eq_trans (nat_eqb_i_eq _ _)).
    apply (f_equal2 Imported.nat_eqb (aeval_aux_eq st a1) (aeval_aux_eq st a2)).
  - (* BLe *)
    apply (eq_trans (nat_leb_i_eq _ _)).
    apply (f_equal2 Imported.nat_leb (aeval_aux_eq st a1) (aeval_aux_eq st a2)).
  - (* BGt *)
    apply (eq_trans (negb_i_eq _)).
    apply (f_equal Imported.bool_negb).
    apply (eq_trans (nat_leb_i_eq _ _)).
    apply (f_equal2 Imported.nat_leb (aeval_aux_eq st a1) (aeval_aux_eq st a2)).
  - (* BNot *)
    apply (eq_trans (negb_i_eq _)).
    apply (f_equal Imported.bool_negb IHb1).
  - (* BAnd *)
    apply (eq_trans (andb_i_eq _ _)).
    apply (f_equal2 Imported.bool_andb IHb1 IHb2).
Qed.

Lemma beval_iso_core : forall (st : Original.LF_DOT_Imp.LF.Imp.state) (st' : imported_String_string -> imported_nat),
  (forall (x : String.string) (x' : imported_String_string), 
   rel_iso String_string_iso x x' -> rel_iso nat_iso (st x) (st' x')) ->
  forall b : Original.LF_DOT_Imp.LF.Imp.bexp,
  IsomorphismDefinitions.eq 
    (bool_to_imported (Original.LF_DOT_Imp.LF.Imp.beval st b))
    (beval_aux st' (bexp_to_imported b)).
Proof.
  intros st st' Hst.
  fix IH 1.
  intros b. destruct b as [| | a1 a2 | a1 a2 | a1 a2 | a1 a2 | b1 | b1 b2]; simpl.
  - (* BTrue *) apply IsomorphismDefinitions.eq_refl.
  - (* BFalse *) apply IsomorphismDefinitions.eq_refl.
  - (* BEq *)
    apply (eq_trans (nat_to_imported_eqb _ _)).
    apply (f_equal2 nat_eqb_i (aeval_iso_core st st' Hst a1) (aeval_iso_core st st' Hst a2)).
  - (* BNeq *)
    apply (eq_trans (bool_to_imported_negb _)).
    apply (f_equal negb_i).
    apply (eq_trans (nat_to_imported_eqb _ _)).
    apply (f_equal2 nat_eqb_i (aeval_iso_core st st' Hst a1) (aeval_iso_core st st' Hst a2)).
  - (* BLe *)
    apply (eq_trans (nat_to_imported_leb _ _)).
    apply (f_equal2 nat_leb_i (aeval_iso_core st st' Hst a1) (aeval_iso_core st st' Hst a2)).
  - (* BGt *)
    apply (eq_trans (bool_to_imported_negb _)).
    apply (f_equal negb_i).
    apply (eq_trans (nat_to_imported_leb _ _)).
    apply (f_equal2 nat_leb_i (aeval_iso_core st st' Hst a1) (aeval_iso_core st st' Hst a2)).
  - (* BNot *)
    apply (eq_trans (bool_to_imported_negb _)).
    apply (f_equal negb_i (IH b1)).
  - (* BAnd *)
    apply (eq_trans (bool_to_imported_andb _ _)).
    apply (f_equal2 andb_i (IH b1) (IH b2)).
Qed.

Instance Original_LF__DOT__Imp_LF_Imp_beval_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat),
  (forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.bexp) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_bexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso x3 x4 -> rel_iso bool_iso (Original.LF_DOT_Imp.LF.Imp.beval x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_beval x2 x4).
Proof.
  intros st st' Hst b b' Hb.
  pose proof (proj_rel_iso Hb) as Hb_eq; simpl in Hb_eq.
  constructor; simpl.
  apply (eq_trans (beval_iso_core st st' Hst b)).
  apply (eq_trans (beval_aux_eq st' (bexp_to_imported b))).
  apply (f_equal (imported_Original_LF__DOT__Imp_LF_Imp_beval st') Hb).
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.beval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_beval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.beval Original_LF__DOT__Imp_LF_Imp_beval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.beval Imported.Original_LF__DOT__Imp_LF_Imp_beval Original_LF__DOT__Imp_LF_Imp_beval_iso := {}.