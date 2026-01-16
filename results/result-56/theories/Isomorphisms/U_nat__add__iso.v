From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* (* Typeclasses Opaque rel_iso. *) *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Nat_add : imported_nat -> imported_nat -> imported_nat := Imported.Nat_add.

(* Lemma that Nat_add commutes with the isomorphism *)
Lemma Nat_add_commutes : forall n m : nat,
  Logic.eq (nat_to_imported (n + m)) (Imported.Nat_add (nat_to_imported n) (nat_to_imported m)).
Proof.
  induction n as [| n' IH]; intro m; simpl.
  { reflexivity. }
  { change (Imported.Nat_add (Imported.nat_S (nat_to_imported n')) (nat_to_imported m))
      with (Imported.nat_S (Imported.Nat_add (nat_to_imported n') (nat_to_imported m))).
    apply Logic.f_equal.
    apply IH. }
Qed.

Instance Nat_add_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 + x3) (imported_Nat_add x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  destruct H12 as [H12]. destruct H34 as [H34].
  constructor. simpl in *.
  eapply eq_trans.
  - apply seq_of_eq. apply Nat_add_commutes.
  - apply f_equal2; assumption.
Defined.

Instance: KnownConstant Nat.add := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Nat_add := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.add Nat_add_iso := {}.
Instance: IsoStatementProofBetween Nat.add Imported.Nat_add Nat_add_iso := {}.
