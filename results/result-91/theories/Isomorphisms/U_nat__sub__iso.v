From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Nat_sub : imported_nat -> imported_nat -> imported_nat := Imported.Nat_sub.

(* Use to nat_iso as the conversion function *)
Definition nat_to_imported : nat -> imported_nat := to nat_iso.

(* helper lemma: nat_to_imported commutes with subtraction *)
Fixpoint nat_to_imported_sub (x1 x3 : nat)
  : nat_to_imported (x1 - x3) = imported_Nat_sub (nat_to_imported x1) (nat_to_imported x3).
Proof.
  destruct x1 as [|x1']; destruct x3 as [|x3']; simpl; try reflexivity.
  (* S x1' - S x3' *)
  exact (nat_to_imported_sub x1' x3').
Defined.

Instance Nat_sub_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 ->
  rel_iso nat_iso (x1 - x3) (imported_Nat_sub x2 x4).
Proof.
  intros x1 x2 Hx1 x3 x4 Hx3.
  pose proof (eq_of_seq (proj_rel_iso Hx1)) as Hx1'.
  pose proof (eq_of_seq (proj_rel_iso Hx3)) as Hx3'.
  subst x2 x4.
  constructor. simpl.
  apply seq_of_eq.
  exact (nat_to_imported_sub x1 x3).
Defined.

Instance: KnownConstant Nat.sub := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Nat_sub := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.sub Nat_sub_iso := {}.
Instance: IsoStatementProofBetween Nat.sub Imported.Nat_sub Nat_sub_iso := {}.