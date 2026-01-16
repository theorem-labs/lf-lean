From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import Logic.ProofIrrelevance.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_gt : imported_nat -> imported_nat -> SProp := Imported.gt.

(* Helper: convert Coq gt to Imported.gt *)
Fixpoint gt_to_imported (n m : Datatypes.nat) (H : n > m) {struct n} : Imported.gt (nat_to_imported n) (nat_to_imported m).
Proof.
  unfold Peano.gt, Peano.lt in H.
  destruct n as [|n'].
  - inversion H.
  - destruct m as [|m'].
    + simpl. apply Imported.gt_gt_succ.
    + simpl. apply Imported.gt_gt_succ_succ. apply gt_to_imported.
      unfold Peano.gt, Peano.lt. apply le_S_n. exact H.
Defined.

(* Helper: convert Imported.gt to SInhabited (Coq gt) *)
Fixpoint gt_from_imported (n m : imported_nat) (H : Imported.gt n m) {struct H} : SInhabited (imported_to_nat n > imported_to_nat m).
Proof.
  destruct H as [n' | n' m' H'].
  - simpl. apply sinhabits. unfold Peano.gt, Peano.lt. apply le_n_S. apply le_0_n.
  - simpl. apply sinhabits.
    pose (IH := gt_from_imported n' m' H').
    pose (prf := @sinhabitant _ IH).
    unfold Peano.gt, Peano.lt in *. apply le_n_S. exact prf.
Defined.

(* Helper lemmas *)
Lemma le_0_n : forall n : Datatypes.nat, (0 <= n)%nat.
Proof. intros n. induction n; [apply le_n | apply le_S; exact IHn]. Qed.

Lemma nat_roundtrip : forall n : Datatypes.nat, imported_to_nat (nat_iso n) = n.
Proof. induction n; simpl; [reflexivity | f_equal; exact IHn]. Qed.

(* Helper to go from imported_to_nat (nat_to_imported x) > ... to x > ... *)
Definition gt_from_imported_coq (x1 x3 : Datatypes.nat) 
  (H : Imported.gt (nat_to_imported x1) (nat_to_imported x3)) : x1 > x3.
Proof.
  pose proof (@gt_from_imported (nat_to_imported x1) (nat_to_imported x3) H) as prf.
  pose proof (sinhabitant prf) as gt_prf.
  rewrite !nat_roundtrip in gt_prf. exact gt_prf.
Defined.

Monomorphic Instance gt_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (x1 > x3) (imported_gt x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  pose proof (proj_rel_iso H12) as E12.
  pose proof (proj_rel_iso H34) as E34.
  simpl in E12, E34.
  rewrite <- (eq_of_seq E12), <- (eq_of_seq E34).
  unfold imported_gt.
  apply relax_Iso_Ps_Ts.
  exact (@Build_Iso@{Prop SProp; Set Set}
    (x1 > x3)
    (Imported.gt (nat_to_imported x1) (nat_to_imported x3))
    (fun p => @gt_to_imported x1 x3 p)
    (fun sp => gt_from_imported_coq x1 x3 sp)
    (fun sp => IsomorphismDefinitions.eq_refl)
    (fun p => IsoEq.seq_of_peq (proof_irrelevance _ _ p))).
Defined.
Instance: KnownConstant gt := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.gt := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor gt gt_iso := {}.
Instance: IsoStatementProofBetween gt Imported.gt gt_iso := {}.