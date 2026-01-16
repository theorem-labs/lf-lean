From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aexp__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_aeval : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp -> imported_nat := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aeval.

(* We need to prove that Imported.Nat_add is the same as addition on imported_nat *)
Lemma Nat_add_correct : forall n m,
  IsomorphismDefinitions.eq (Imported.Nat_add (nat_to_imported n) (nat_to_imported m)) (nat_to_imported (n + m)).
Proof.
  induction n as [|n IH]; intro m.
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    apply (IsoEq.f_equal Imported.nat_S (IH m)).
Defined.

Lemma Nat_sub_correct : forall n m,
  IsomorphismDefinitions.eq (Imported.Nat_sub (nat_to_imported n) (nat_to_imported m)) (nat_to_imported (n - m)).
Proof.
  induction n as [|n IH]; intro m.
  - simpl. destruct m; simpl; apply IsomorphismDefinitions.eq_refl.
  - destruct m as [|m].
    + simpl. apply IsomorphismDefinitions.eq_refl.
    + simpl. apply IH.
Defined.

Lemma Nat_mul_correct : forall n m,
  IsomorphismDefinitions.eq (Imported.Nat_mul (nat_to_imported n) (nat_to_imported m)) (nat_to_imported (n * m)).
Proof.
  induction n as [|n IH]; intro m.
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    apply (IsoEq.eq_trans (IsoEq.f_equal2 Imported.Nat_add IsomorphismDefinitions.eq_refl (IH m))).
    apply Nat_add_correct.
Defined.

Lemma aeval_correct : forall a,
  IsomorphismDefinitions.eq (Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aeval (aexp_to_imported a)) (nat_to_imported (Original.LF_DOT_Imp.LF.Imp.AExp.aeval a)).
Proof.
  induction a as [n | a1 IH1 a2 IH2 | a1 IH1 a2 IH2 | a1 IH1 a2 IH2]; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (IsoEq.eq_trans (IsoEq.f_equal2 Imported.Nat_add IH1 IH2)).
    apply Nat_add_correct.
  - apply (IsoEq.eq_trans (IsoEq.f_equal2 Imported.Nat_sub IH1 IH2)).
    apply Nat_sub_correct.
  - apply (IsoEq.eq_trans (IsoEq.f_equal2 Imported.Nat_mul IH1 IH2)).
    apply Nat_mul_correct.
Defined.

Instance Original_LF__DOT__Imp_LF_Imp_AExp_aeval_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Imp.LF.Imp.AExp.aeval x1) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_aeval x2).
Proof.
  intros x1 x2 H.
  destruct H1 as [H1]. simpl in H1. constructor. simpl.
  simpl in *.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_AExp_aeval.
  (* Goal: nat_to_imported(aeval x1) = aeval(x2) *)
  (* We have: aexp_to_imported(x1) = x2 *)
  (* From aeval_correct: aeval(aexp_to_imported x1) = nat_to_imported(aeval x1) *)
  (* So: aeval(x2) = aeval(aexp_to_imported x1) = nat_to_imported(aeval x1) *)
  apply IsoEq.eq_sym.
  apply (IsoEq.eq_trans (IsoEq.f_equal Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aeval (IsoEq.eq_sym H))).
  apply aeval_correct.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.aeval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aeval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.aeval Original_LF__DOT__Imp_LF_Imp_AExp_aeval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.aeval Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aeval Original_LF__DOT__Imp_LF_Imp_AExp_aeval_iso := {}.