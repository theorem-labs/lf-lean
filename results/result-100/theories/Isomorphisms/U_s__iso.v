From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_S : imported_nat -> imported_nat := Imported.nat_S.
Instance S_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (S x1) (imported_S x2).
Proof.
  intros x1 x2 H.
  constructor. simpl in *.
  unfold imported_S, Imported.nat_S.
  apply (IsoEq.f_equal Lean.Nat_succ).
  exact H.
Defined.
Instance: KnownConstant S := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.nat_S := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor S S_iso := {}.
Instance: IsoStatementProofBetween S Imported.nat_S S_iso := {}.