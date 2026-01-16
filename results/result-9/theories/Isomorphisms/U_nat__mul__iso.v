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

(* Helper lemma for addition correspondence *)
Lemma add_to_imported : forall n m : Datatypes.nat,
  nat_to_imported (n + m) = Imported.Nat_add (nat_to_imported n) (nat_to_imported m).
Proof.
  induction n as [|n' IHn]; intros m; simpl.
  - reflexivity.
  - (* Goal: nat_S (nat_to_imported (n' + m)) = Nat_add (nat_S (nat_to_imported n')) (nat_to_imported m) *)
    (* Nat_add (nat_S x) y = nat_S (Nat_add x y) by definition *)
    change (Imported.Nat_add (Imported.nat_S (nat_to_imported n')) (nat_to_imported m))
      with (Imported.nat_S (Imported.Nat_add (nat_to_imported n') (nat_to_imported m))).
    f_equal. apply IHn.
Qed.

(* Helper lemma for multiplication correspondence *)
Lemma mul_to_imported : forall n m : Datatypes.nat,
  nat_to_imported (n * m) = Imported.Nat_mul (nat_to_imported n) (nat_to_imported m).
Proof.
  induction n as [|n' IHn]; intros m; simpl.
  - reflexivity.
  - (* Goal: nat_to_imported (m + n' * m) = Nat_mul (nat_S (nat_to_imported n')) (nat_to_imported m) *)
    (* Nat_mul (nat_S x) y = Nat_add y (Nat_mul x y) by definition *)
    change (Imported.Nat_mul (Imported.nat_S (nat_to_imported n')) (nat_to_imported m))
      with (Imported.Nat_add (nat_to_imported m) (Imported.Nat_mul (nat_to_imported n') (nat_to_imported m))).
    rewrite <- IHn. apply add_to_imported.
Qed.

Monomorphic Instance Nat_mul_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 * x3) (imported_Nat_mul x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  pose proof (proj_rel_iso H12) as E12.
  pose proof (proj_rel_iso H34) as E34.
  simpl in E12, E34.
  constructor. simpl.
  rewrite <- (eq_of_seq E12), <- (eq_of_seq E34).
  unfold imported_Nat_mul.
  apply seq_of_eq. apply mul_to_imported.
Defined.
Instance: KnownConstant Nat.mul := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Nat_mul := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.mul Nat_mul_iso := {}.
Instance: IsoStatementProofBetween Nat.mul Imported.Nat_mul Nat_mul_iso := {}.