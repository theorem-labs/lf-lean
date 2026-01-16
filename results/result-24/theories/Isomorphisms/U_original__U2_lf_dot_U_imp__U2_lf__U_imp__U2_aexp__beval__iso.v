From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__bexp__iso Isomorphisms.bool__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aeval__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_beval : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp -> imported_bool := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_beval.

(* Lemmas for helper functions *)
Lemma Nat_eqb_correct : forall n m,
  IsomorphismDefinitions.eq (Imported.Nat_eqb (nat_to_imported n) (nat_to_imported m)) (bool_to_imported (Nat.eqb n m)).
Proof.
  induction n as [|n IH]; intro m.
  - destruct m; simpl; apply IsomorphismDefinitions.eq_refl.
  - destruct m as [|m].
    + simpl. apply IsomorphismDefinitions.eq_refl.
    + simpl. apply IH.
Defined.

Lemma Nat_leb_correct : forall n m,
  IsomorphismDefinitions.eq (Imported.Nat_leb (nat_to_imported n) (nat_to_imported m)) (bool_to_imported (Nat.leb n m)).
Proof.
  induction n as [|n IH]; intro m.
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - destruct m as [|m].
    + simpl. apply IsomorphismDefinitions.eq_refl.
    + simpl. apply IH.
Defined.

Lemma negb_correct : forall b,
  IsomorphismDefinitions.eq (Imported.negb (bool_to_imported b)) (bool_to_imported (negb b)).
Proof.
  intro b. destruct b; simpl; apply IsomorphismDefinitions.eq_refl.
Defined.

Lemma andb_correct : forall b1 b2,
  IsomorphismDefinitions.eq (Imported.andb (bool_to_imported b1) (bool_to_imported b2)) (bool_to_imported (andb b1 b2)).
Proof.
  intros b1 b2. destruct b1; destruct b2; simpl; apply IsomorphismDefinitions.eq_refl.
Defined.

Lemma beval_correct : forall b,
  IsomorphismDefinitions.eq (Imported.Original_LF__DOT__Imp_LF_Imp_AExp_beval (bexp_to_imported b)) (bool_to_imported (Original.LF_DOT_Imp.LF.Imp.AExp.beval b)).
Proof.
  induction b as [| | a1 a2 | a1 a2 | a1 a2 | a1 a2 | b1 IH1 | b1 IH1 b2 IH2]; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - (* BEq *)
    apply (IsoEq.eq_trans (IsoEq.f_equal2 Imported.Nat_eqb (aeval_correct a1) (aeval_correct a2))).
    apply Nat_eqb_correct.
  - (* BNeq *)
    apply (IsoEq.eq_trans (IsoEq.f_equal Imported.negb (IsoEq.f_equal2 Imported.Nat_eqb (aeval_correct a1) (aeval_correct a2)))).
    apply (IsoEq.eq_trans (IsoEq.f_equal Imported.negb (Nat_eqb_correct _ _))).
    apply negb_correct.
  - (* BLe *)
    apply (IsoEq.eq_trans (IsoEq.f_equal2 Imported.Nat_leb (aeval_correct a1) (aeval_correct a2))).
    apply Nat_leb_correct.
  - (* BGt *)
    apply (IsoEq.eq_trans (IsoEq.f_equal Imported.negb (IsoEq.f_equal2 Imported.Nat_leb (aeval_correct a1) (aeval_correct a2)))).
    apply (IsoEq.eq_trans (IsoEq.f_equal Imported.negb (Nat_leb_correct _ _))).
    apply negb_correct.
  - (* BNot *)
    apply (IsoEq.eq_trans (IsoEq.f_equal Imported.negb IH1)).
    apply negb_correct.
  - (* BAnd *)
    apply (IsoEq.eq_trans (IsoEq.f_equal2 Imported.andb IH1 IH2)).
    apply andb_correct.
Defined.

Instance Original_LF__DOT__Imp_LF_Imp_AExp_beval_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.bexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_bexp_iso x1 x2 -> rel_iso bool_iso (Original.LF_DOT_Imp.LF.Imp.AExp.beval x1) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_beval x2).
Proof.
  intros x1 x2 H.
  destruct H1 as [H1]. simpl in H1. constructor. simpl.
  simpl in *.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_AExp_beval.
  (* Goal: bool_to_imported(beval x1) = beval(x2) *)
  (* We have: bexp_to_imported(x1) = x2 *)
  (* From beval_correct: beval(bexp_to_imported x1) = bool_to_imported(beval x1) *)
  (* So: beval(x2) = beval(bexp_to_imported x1) = bool_to_imported(beval x1) *)
  apply IsoEq.eq_sym.
  apply (IsoEq.eq_trans (IsoEq.f_equal Imported.Original_LF__DOT__Imp_LF_Imp_AExp_beval (IsoEq.eq_sym H))).
  apply beval_correct.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.beval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_beval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.beval Original_LF__DOT__Imp_LF_Imp_AExp_beval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.beval Imported.Original_LF__DOT__Imp_LF_Imp_AExp_beval Original_LF__DOT__Imp_LF_Imp_AExp_beval_iso := {}.