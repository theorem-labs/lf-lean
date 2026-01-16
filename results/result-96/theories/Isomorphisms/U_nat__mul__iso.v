From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Nat_mul : imported_nat -> imported_nat -> imported_nat := Imported.Nat_mul.

(* We need Nat_add_commutes from U_nat__add__iso - import it *)
From IsomorphismChecker Require Export Isomorphisms.U_nat__add__iso.

(* Helper lemmas for Nat_mul *)
Lemma Nat_mul_O_l : forall m : Imported.nat, Imported.Nat_mul Imported.nat_O m = Imported.nat_O.
Proof. intro m. reflexivity. Qed.

Lemma Nat_mul_S_l : forall n m : Imported.nat, 
  Imported.Nat_mul (Imported.nat_S n) m = Imported.Nat_add m (Imported.Nat_mul n m).
Proof. intros n m. reflexivity. Qed.

(* Prove that Nat_mul commutes with the isomorphism *)
Lemma Nat_mul_commutes : forall n m : nat,
  Logic.eq (nat_to_imported (n * m)) (Imported.Nat_mul (nat_to_imported n) (nat_to_imported m)).
Proof.
  induction n as [| n' IH]; intro m; simpl.
  { symmetry. apply Nat_mul_O_l. }
  { transitivity (Imported.Nat_add (nat_to_imported m) (Imported.Nat_mul (nat_to_imported n') (nat_to_imported m))).
    - transitivity (Imported.Nat_add (nat_to_imported m) (nat_to_imported (n' * m))).
      + apply nat_to_imported_add_compat.
      + f_equal. apply IH.
    - symmetry. apply Nat_mul_S_l.
  }
Defined.

Instance Nat_mul_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 * x3) (imported_Nat_mul x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  constructor.
  destruct H12 as [H12]. destruct H34 as [H34].
  simpl in *.
  eapply eq_trans.
  - apply seq_of_eq. apply Nat_mul_commutes.
  - unfold imported_Nat_mul. apply f_equal2; assumption.
Defined.
Instance: KnownConstant Nat.mul := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Nat_mul := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.mul Nat_mul_iso := {}.
Instance: IsoStatementProofBetween Nat.mul Imported.Nat_mul Nat_mul_iso := {}.