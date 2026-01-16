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
Lemma nat_to_imported_mul_compat : forall (n m : nat),
  nat_to_imported (n * m) = Imported.Nat_mul (nat_to_imported n) (nat_to_imported m).
Proof.
  induction n as [|n' IH].
  - simpl. intros m. reflexivity.
  - intros m. simpl.
    (* S n' * m = m + n' * m in Coq *)
    (* Imported.Nat_mul (S n) m = Imported.Nat_add m (Imported.Nat_mul n m) in Lean (by definitional equality) *)
    (* Need: nat_to_imported (m + n' * m) = Imported.Nat_mul (Imported.nat_S (nat_to_imported n')) (nat_to_imported m) *)
    (* LHS after add_compat: Imported.Nat_add (nat_to_imported m) (nat_to_imported (n' * m)) *)
    (* LHS after IH: Imported.Nat_add (nat_to_imported m) (Imported.Nat_mul (nat_to_imported n') (nat_to_imported m)) *)
    (* RHS unfolds to: Imported.Nat_add (nat_to_imported m) (Imported.Nat_mul (nat_to_imported n') (nat_to_imported m)) *)
    etransitivity.
    + exact (nat_to_imported_add_compat m (n' * m)).
    + exact (Corelib.Init.Logic.f_equal (fun x => Imported.Nat_add (nat_to_imported m) x) (IH m)).
Defined.

Monomorphic Instance Nat_mul_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 * x3) (imported_Nat_mul x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  constructor.
  eapply IsoEq.eq_trans.
  - apply seq_of_eq. apply nat_to_imported_mul_compat.
  - apply f_equal2; [exact (proj_rel_iso H12) | exact (proj_rel_iso H34)].
Defined.
Instance: KnownConstant Nat.mul := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Nat_mul := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.mul Nat_mul_iso := {}.
Instance: IsoStatementProofBetween Nat.mul Imported.Nat_mul Nat_mul_iso := {}.