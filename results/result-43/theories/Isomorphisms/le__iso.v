From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. (* removed *) *)

Local Open Scope nat_scope.
From Stdlib Require Import Arith.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_le : imported_nat -> imported_nat -> SProp := Imported.le.

(* le_to_imported: convert Rocq le to Imported.le *)
Fixpoint le_to_imported (n m : nat) (H : Peano.le n m) {struct H} : 
  Imported.le (nat_to_imported n) (nat_to_imported m).
Proof.
  destruct H.
  - apply Imported.le_le_n.
  - apply Imported.le_le_S. apply le_to_imported. exact H.
Defined.

(* To convert from Imported.le (SProp) to Peano.le (Prop), we need to go through SInhabited.
   
   Step 1: Build SInhabited (Peano.le (imported_to_nat n') (imported_to_nat m'))
           from Imported.le n' m'.
   Since both Imported.le and SInhabited are in SProp, we can eliminate Imported.le to SProp.
*)

(* Helper: convert between imported nat indices and nat *)
(* Imported.le n' m' means le n' m' where the first argument is implicit (the n) *)
(* le n m is really @le n m where the first n is the starting point *)

Fixpoint imported_le_to_peano_le_sinhabited (n' : Imported.nat) (m' : Imported.nat)
  (H : @Imported.le n' m') {struct H} : SInhabited (Peano.le (imported_to_nat n') (imported_to_nat m')).
Proof.
  destruct H as [ | m0 H'].
  - (* le_le_n : n' <= n' *)
    exact (sinhabits (le_n (imported_to_nat n'))).
  - (* le_le_S : n' <= m0 -> n' <= S m0 *)
    apply sinhabits.
    apply le_S.
    exact (sinhabitant (imported_le_to_peano_le_sinhabited n' m0 H')).
Defined.

(* Now we can define from_imported_le using sinhabitant *)
Definition from_imported_le (n m : Datatypes.nat) 
  (H : @Imported.le (nat_to_imported n) (nat_to_imported m)) : Peano.le n m.
Proof.
  (* Get SInhabited (imported_to_nat (nat_to_imported n) <= imported_to_nat (nat_to_imported m)) *)
  pose (H' := @imported_le_to_peano_le_sinhabited (nat_to_imported n) (nat_to_imported m) H).
  (* imported_to_nat (nat_to_imported n) = n *)
  rewrite !nat_roundtrip in H'.
  exact (sinhabitant H').
Defined.

(* Helper *)
Lemma nat_from_to_prop : forall x : Datatypes.nat, imported_to_nat (nat_to_imported x) = x.
Proof.
  intro x. induction x as [|n IHn]; simpl; [reflexivity | f_equal; exact IHn].
Defined.

(* The isomorphism *)
Instance le_iso : forall (x1 : Datatypes.nat) (x2 : imported_nat) 
  (_ : @rel_iso Datatypes.nat imported_nat nat_iso x1 x2) 
  (x3 : Datatypes.nat) (x4 : imported_nat) 
  (_ : @rel_iso Datatypes.nat imported_nat nat_iso x3 x4), 
  Iso (le x1 x3) (imported_le x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  destruct H12 as [Hproj12].
  destruct H34 as [Hproj34].
  unfold imported_le.
  
  apply IsoEq.eq_of_seq in Hproj12.
  apply IsoEq.eq_of_seq in Hproj34.
  subst x2 x4.
  
  unshelve refine {|
    to := @le_to_imported x1 x3;
    from := @from_imported_le x1 x3
  |}.
  - intro. apply IsomorphismDefinitions.eq_refl.
  - intro x. apply IsoEq.seq_of_eq.
    apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant le := {}.
Instance: KnownConstant Imported.le := {}.
Instance: IsoStatementProofFor le le_iso := {}.
Instance: IsoStatementProofBetween le Imported.le le_iso := {}.
