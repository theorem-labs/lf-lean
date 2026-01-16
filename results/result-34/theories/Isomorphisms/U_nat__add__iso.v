From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Nat_add : imported_nat -> imported_nat -> imported_nat := Imported.Nat_add.

(* Helper lemmas for Imported.Nat_add reduction *)
Lemma Nat_add_O_l : forall m : Imported.nat, Imported.Nat_add Imported.nat_O m = m.
Proof. intro m. reflexivity. Qed.

Lemma Nat_add_S_l : forall n m : Imported.nat, 
  Imported.Nat_add (Imported.nat_S n) m = Imported.nat_S (Imported.Nat_add n m).
Proof. intros n m. reflexivity. Qed.

(* Prove that nat_to_imported preserves addition *)
Lemma nat_to_imported_add_compat : forall n m : nat,
  Logic.eq (nat_to_imported (n + m)) (Imported.Nat_add (nat_to_imported n) (nat_to_imported m)).
Proof.
  induction n as [|n' IH]; intro m.
  - simpl. apply Nat_add_O_l.
  - simpl.
    transitivity (Imported.nat_S (Imported.Nat_add (nat_to_imported n') (nat_to_imported m))).
    + f_equal. apply IH.
    + symmetry. apply Nat_add_S_l.
Qed.

Instance Nat_add_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 + x3) (imported_Nat_add x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  constructor.
  destruct H12 as [H12]. destruct H34 as [H34].
  simpl in *.
  eapply eq_trans.
  - apply seq_of_eq. apply nat_to_imported_add_compat.
  - unfold imported_Nat_add. apply f_equal2; assumption.
Defined.
Instance: KnownConstant Nat.add := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Nat_add := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.add Nat_add_iso := {}.
Instance: IsoStatementProofBetween Nat.add Imported.Nat_add Nat_add_iso := {}.