From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import Logic.ProofIrrelevance.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1 : imported_nat -> imported_nat -> SProp := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1.

(* Helper: convert nat to imported_nat *)
Fixpoint nat_to_imported (n : nat) : imported_nat :=
  match n with
  | O => Imported.nat_O
  | S m => Imported.nat_S (nat_to_imported m)
  end.

(* Helper: convert imported_nat to nat *)
Fixpoint imported_to_nat (n : imported_nat) : nat :=
  match n with
  | Imported.nat_O => O
  | Imported.nat_S m => S (imported_to_nat m)
  end.

(* Convert Original.le1 to Imported.le1 - use sCase for Prop -> SProp *)
Definition le1_to_imported : forall (n m : nat) (pf : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.le1 n m),
  Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1 (nat_to_imported n) (nat_to_imported m).
Proof.
  fix IH 3.
  intros n m pf.
  destruct pf as [k | k1 k2 pf'].
  - exact (Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1_le1_n (nat_to_imported k)).
  - exact (Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1_le1_S (nat_to_imported k1) (nat_to_imported k2) 
            (IH k1 k2 pf')).
Defined.

(* Key lemmas about nat_to_imported and imported_to_nat *)
Lemma nat_roundtrip : forall n, imported_to_nat (nat_to_imported n) = n.
Proof.
  induction n as [|n' IH].
  - reflexivity.
  - simpl. f_equal. exact IH.
Qed.

Lemma imported_roundtrip : forall n, nat_to_imported (imported_to_nat n) = n.
Proof.
  fix IH 1. intros [|m].
  - reflexivity.
  - simpl. f_equal. exact (IH m).
Qed.

(* rel_iso characterization - rel_iso nat_iso x1 x2 means to nat_iso x1 = x2 in SProp *)
Lemma rel_iso_char : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> nat_to_imported x1 = x2.
Proof.
  intros x1 x2 H.
  destruct H as [H].
  (* H : IsomorphismDefinitions.eq (to nat_iso x1) x2 *)
  apply eq_of_seq in H.
  (* H : to nat_iso x1 = x2 *)
  (* to nat_iso = nat_to_imported definitionally *)
  exact H.
Qed.

(* Convert Imported.le1 to SInhabited of Original.le1, using SProp-to-SProp elimination *)
Definition le1_from_imported_sinhabited (n : imported_nat) (m : imported_nat) 
  (pf : Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1 n m)
  : SInhabited (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.le1 (imported_to_nat n) (imported_to_nat m)) :=
  Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1_sind n
    (fun m' _ => SInhabited (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.le1 (imported_to_nat n) (imported_to_nat m')))
    (* le1_n case *)
    (sinhabits (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.le1_n (imported_to_nat n)))
    (* le1_S case *)
    (fun m' _ IH => 
      match IH with
      | sinhabits pf' => sinhabits (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.le1_S (imported_to_nat n) (imported_to_nat m') pf')
      end)
    m pf.

(* Helper: convert proof from imported to original, handling the type mismatch *)
Definition le1_from_imported (x1 x3 : nat)
  (pf : Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1 (nat_to_imported x1) (nat_to_imported x3))
  : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.le1 x1 x3.
Proof.
  pose proof (@le1_from_imported_sinhabited (nat_to_imported x1) (nat_to_imported x3) pf) as H.
  (* H : SInhabited (le1 (imported_to_nat (nat_to_imported x1)) (imported_to_nat (nat_to_imported x3))) *)
  (* We need le1 x1 x3 *)
  rewrite !nat_roundtrip in H.
  exact (sinhabitant H).
Defined.

(* The isomorphism between Prop and SProp versions *)
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> 
  Iso (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.le1 x1 x3) 
      (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1 x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  apply rel_iso_char in H12.
  apply rel_iso_char in H34.
  subst x2 x4.
  unfold imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1.
  
  refine (@Build_Iso _ _ 
    (fun pf => @le1_to_imported x1 x3 pf)
    (fun pf => le1_from_imported x1 x3 pf)
    _ _).
  - (* to_from: for SProp target, eq is trivial *)
    intro pf.
    exact IsomorphismDefinitions.eq_refl.
  - (* from_to: for Prop source, use proof irrelevance *)
    intro pf.
    exact (IsoEq.seq_of_peq_t (proof_irrelevance _ _ _)).
Defined.

Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.le1 := {}.
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.le1 Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.le1 Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1 Original_LF__DOT__IndPrinciples_LF_IndPrinciples_le1_iso := {}.