From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *)

From IsomorphismChecker Require Export Isomorphisms.nat__iso.
From Stdlib Require Import Logic.ProofIrrelevance.

Local Open Scope nat_scope.

Definition imported_le : imported_nat -> imported_nat -> SProp := Imported.le.

(* Convert nat to imported_nat - using Fixpoint style *)
Fixpoint le_to_imported (n m : nat) (H : Peano.le n m) {struct H} : imported_le (nat_to_imported n) (nat_to_imported m).
Proof.
  destruct H.
  - exact (Imported.le_le_n (nat_to_imported n)).
  - exact (Imported.le_le_S (nat_to_imported n) (nat_to_imported m) (le_to_imported n m H)).
Defined.

(* Convert imported_nat to nat *)
Fixpoint imported_to_nat (n : imported_nat) : nat :=
  match n with
  | Imported.nat_O => O
  | Imported.nat_S n' => S (imported_to_nat n')
  end.

(* nat_to_imported and imported_to_nat are inverses *)
Lemma nat_to_imported_inv : forall n, imported_to_nat (nat_to_imported n) = n.
Proof.
  induction n; simpl; [reflexivity | f_equal; auto].
Qed.

(* Convert from imported_le to le - done through SInhabited *)
(* The key is that Imported.le has first argument as parameter *)
Lemma imported_to_le_sinhabited : forall (n m : imported_nat), 
  imported_le n m -> SInhabited (Peano.le (imported_to_nat n) (imported_to_nat m)).
Proof.
  intros n m H.
  exact (Imported.le_indl n (fun m' _ => SInhabited (Peano.le (imported_to_nat n) (imported_to_nat m')))
           (sinhabits (Peano.le_n (imported_to_nat n)))
           (fun m' _ IH => sinhabits (Peano.le_S _ _ (sinhabitant IH)))
           m H).
Defined.

Definition imported_to_le (n m : imported_nat) (H : imported_le n m) : Peano.le (imported_to_nat n) (imported_to_nat m) :=
  sinhabitant (@imported_to_le_sinhabited n m H).

(* The isomorphism *)
Instance le_iso : (forall (x1 : nat) (x2 : imported_nat) (_ : @rel_iso nat imported_nat nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (_ : @rel_iso nat imported_nat nat_iso x3 x4), Iso (Peano.le x1 x3) (imported_le x2 x4)).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  destruct H12 as [H12]. destruct H34 as [H34]. simpl in *.
  apply IsoEq.eq_of_seq in H12.
  apply IsoEq.eq_of_seq in H34.
  subst x2 x4.
  unfold imported_le.
  
  unshelve refine {|
    to := @le_to_imported x1 x3;
    from := fun H => _ 
  |}.
  - pose (@imported_to_le (nat_to_imported x1) (nat_to_imported x3) H) as H'.
    rewrite !nat_to_imported_inv in H'.
    exact H'.
  - intro. apply IsomorphismDefinitions.eq_refl.
  - intro x. apply IsoEq.seq_of_eq.
    apply proof_irrelevance.
Defined.

Instance: KnownConstant le := {}. 
Instance: KnownConstant Imported.le := {}. 
Instance: IsoStatementProofFor le le_iso := {}.
Instance: IsoStatementProofBetween le Imported.le le_iso := {}.
