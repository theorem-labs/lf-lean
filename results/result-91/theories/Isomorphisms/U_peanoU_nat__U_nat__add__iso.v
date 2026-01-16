From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


#[local] Open Scope nat_scope.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_PeanoNat_Nat_add : imported_nat -> imported_nat -> imported_nat := Imported.PeanoNat_Nat_add.

(* Prove that nat_to_imported preserves addition *)
Lemma nat_to_imported_add : forall n m : nat, 
  Logic.eq (nat_to_imported (n + m)) (Imported.PeanoNat_Nat_add (nat_to_imported n) (nat_to_imported m)).
Proof.
  induction n as [|n' IH]; intros m.
  - (* n = 0 *)
    reflexivity.
  - (* n = S n' *)
    simpl (nat_to_imported (S n' + m)).
    simpl (nat_to_imported (S n')).
    (* Now we have: nat_S (nat_to_imported (n' + m)) = 
                    PeanoNat_Nat_add (nat_S (nat_to_imported n')) (nat_to_imported m) *)
    (* We need to show that PeanoNat_Nat_add (S x) y = S (PeanoNat_Nat_add x y) *)
    change (Imported.nat_S (nat_to_imported (n' + m)) = 
            Imported.nat_S (Imported.PeanoNat_Nat_add (nat_to_imported n') (nat_to_imported m))).
    apply Logic.f_equal.
    apply IH.
Qed.

Instance PeanoNat_Nat_add_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 + x3) (imported_PeanoNat_Nat_add x2 x4).
Proof.
  intros x1 x2 hx1 x3 x4 hx2.
  destruct hx1 as [hx1]. destruct hx2 as [hx2].
  simpl in *.
  destruct hx1. destruct hx2.
  constructor.
  unfold imported_PeanoNat_Nat_add. simpl.
  apply seq_of_eq.
  apply nat_to_imported_add.
Defined.
Instance: KnownConstant PeanoNat.Nat.add := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.PeanoNat_Nat_add := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor PeanoNat.Nat.add PeanoNat_Nat_add_iso := {}.
Instance: IsoStatementProofBetween PeanoNat.Nat.add Imported.PeanoNat_Nat_add PeanoNat_Nat_add_iso := {}.