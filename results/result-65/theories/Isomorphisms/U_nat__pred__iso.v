From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Nat_pred : imported_nat -> imported_nat := Imported.Nat_pred.

(* Prove that nat_to_imported preserves pred *)
Lemma nat_to_imported_pred_compat (n : nat) : 
  nat_to_imported (Nat.pred n) = Imported.Nat_pred (nat_to_imported n).
Proof.
  destruct n; reflexivity.
Qed.

Instance Nat_pred_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Nat.pred x1) (imported_Nat_pred x2).
Proof.
  intros x1 x2 H12.
  destruct H12 as [H12].
  constructor.
  eapply eq_trans.
  - apply seq_of_eq. apply nat_to_imported_pred_compat.
  - apply f_equal; assumption.
Defined.

Instance: KnownConstant Nat.pred := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Nat_pred := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.pred Nat_pred_iso := {}.
Instance: IsoStatementProofBetween Nat.pred Imported.Nat_pred Nat_pred_iso := {}.
