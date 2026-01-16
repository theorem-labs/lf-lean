From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso Isomorphisms.U_nat__add__iso.

Monomorphic Definition imported_Nat_mul : imported_nat -> imported_nat -> imported_nat := Imported.Nat_mul.

(* Prove that nat_to_imported preserves multiplication *)
Fixpoint nat_to_imported_mul_compat (n m : nat) : 
  nat_to_imported (n * m) = Imported.Nat_mul (nat_to_imported n) (nat_to_imported m) :=
  match n with
  | O => Corelib.Init.Logic.eq_refl
  | S n' => 
    (* S n' * m = m + n' * m *)
    (* We need: nat_to_imported (m + n' * m) = Nat_add (nat_to_imported m) (Nat_mul (nat_to_imported n') (nat_to_imported m)) *)
    Corelib.Init.Logic.eq_trans (nat_to_imported_add_compat m (n' * m))
      (Corelib.Init.Logic.f_equal (Imported.Nat_add (nat_to_imported m)) (nat_to_imported_mul_compat n' m))
  end.

Monomorphic Instance Nat_mul_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 * x3) (imported_Nat_mul x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  destruct H12 as [H12]. destruct H34 as [H34].
  simpl in *.
  constructor. simpl.
  eapply eq_trans.
  - apply seq_of_eq. apply nat_to_imported_mul_compat.
  - apply f_equal2; [exact H12 | exact H34].
Defined.
Instance: KnownConstant Nat.mul := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Nat_mul := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.mul Nat_mul_iso := {}.
Instance: IsoStatementProofBetween Nat.mul Imported.Nat_mul Nat_mul_iso := {}.