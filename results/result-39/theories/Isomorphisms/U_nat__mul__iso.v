From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_nat__add__iso.

Definition imported_Nat_mul : imported_nat -> imported_nat -> imported_nat := Imported.nat_mul.

Lemma nat_mul_unfold n m : Imported.nat_mul (Imported.nat_S n) m = Imported.nat_add m (Imported.nat_mul n m).
Proof. reflexivity. Qed.

Lemma nat_to_imported_mul_compat (n m : nat) : 
  IsomorphismDefinitions.eq (nat_to_imported (n * m)) (Imported.nat_mul (nat_to_imported n) (nat_to_imported m)).
Proof.
  unfold nat_to_imported.
  induction n.
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    rewrite nat_mul_unfold.
    eapply eq_trans.
    + apply nat_to_imported_add_compat.
    + apply f_equal2.
      * apply IsomorphismDefinitions.eq_refl.
      * exact IHn.
Qed.

Instance Nat_mul_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 * x3) (imported_Nat_mul x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  constructor. simpl.
  unfold imported_Nat_mul.
  destruct H12 as [H12].
  destruct H34 as [H34].
  eapply IsoEq.eq_trans.
  - apply nat_to_imported_mul_compat.
  - apply IsoEq.f_equal2; exact H12 + exact H34.
Defined.
Instance: KnownConstant Nat.mul := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.nat_mul := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.mul Nat_mul_iso := {}.
Instance: IsoStatementProofBetween Nat.mul Imported.nat_mul Nat_mul_iso := {}.