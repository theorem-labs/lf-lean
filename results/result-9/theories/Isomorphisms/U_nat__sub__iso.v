From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_Nat_sub : imported_nat -> imported_nat -> imported_nat := Imported.Nat_sub.

(* Helper lemma for subtraction correspondence *)
Lemma sub_to_imported : forall n m : Datatypes.nat,
  nat_to_imported (n - m) = Imported.Nat_sub (nat_to_imported n) (nat_to_imported m).
Proof.
  induction n as [|n' IHn]; intros m.
  - destruct m; simpl; reflexivity.
  - destruct m as [|m']; simpl.
    + reflexivity.
    + apply IHn.
Qed.

Monomorphic Instance Nat_sub_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 - x3) (imported_Nat_sub x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  pose proof (proj_rel_iso H12) as E12.
  pose proof (proj_rel_iso H34) as E34.
  simpl in E12, E34.
  constructor. simpl.
  rewrite <- (eq_of_seq E12), <- (eq_of_seq E34).
  unfold imported_Nat_sub.
  apply seq_of_eq. apply sub_to_imported.
Defined.
Instance: KnownConstant Nat.sub := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Nat_sub := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.sub Nat_sub_iso := {}.
Instance: IsoStatementProofBetween Nat.sub Imported.Nat_sub Nat_sub_iso := {}.