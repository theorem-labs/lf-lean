From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

Local Open Scope nat_scope.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_le : imported_nat -> imported_nat -> SProp := Imported.le.

Lemma le_refl_imported : forall n, Imported.le (to nat_iso n) (to nat_iso n).
Proof.
  induction n; simpl.
  - exact Imported.MyTrue_intro.
  - exact IHn.
Qed.

Lemma le_step_imported : forall n m,
  Imported.le (to nat_iso n) (to nat_iso m) ->
  Imported.le (to nat_iso n) (to nat_iso (S m)).
Proof.
  intros n.
  induction n as [|n' IHn]; intros m H; simpl in *.
  - exact Imported.MyTrue_intro.
  - destruct m as [|m']; simpl in *.
    + destruct H.  (* H is MyFalse *)
    + apply IHn. exact H.
Qed.

Lemma le_to_imported : forall n m : nat, Peano.le n m -> Imported.le (to nat_iso n) (to nat_iso m).
Proof.
  intros n m Hle.
  induction Hle.
  - apply le_refl_imported.
  - apply le_step_imported. exact IHHle.
Qed.

Lemma imported_to_le : forall n m, Imported.le (to nat_iso n) (to nat_iso m) -> Peano.le n m.
Proof.
  fix IH 1.
  intros n m H.
  destruct n; simpl in *.
  - apply Peano.le_0_n.
  - destruct m; simpl in *.
    + destruct H.
    + apply le_n_S. apply IH. exact H.
Qed.

Instance le_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) 
                         (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4), 
                    Iso (Peano.le x1 x3) (imported_le x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  unfold imported_le.
  pose proof (proj_rel_iso H12) as E12.
  pose proof (proj_rel_iso H34) as E34.
  apply IsoEq.eq_of_seq in E12.
  apply IsoEq.eq_of_seq in E34.
  subst x2 x4.
  
  unshelve refine {|
    to := @le_to_imported x1 x3;
    from := @imported_to_le x1 x3
  |}.
  - intro. apply IsomorphismDefinitions.eq_refl.
  - intro x. apply IsoEq.seq_of_eq.
    apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant le := {}. 
Instance: KnownConstant Imported.le := {}. 
Instance: IsoStatementProofFor le le_iso := {}.
Instance: IsoStatementProofBetween le Imported.le le_iso := {}.
