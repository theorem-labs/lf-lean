From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_S : imported_nat -> imported_nat := Imported.S.
Monomorphic Instance S_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (S x1) (imported_S x2).
Proof.
  intros x1 x2 H.
  destruct H as [H].
  constructor. simpl in *.
  apply (IsoEq.f_equal Imported.nat_S H).
Defined.
Instance: KnownConstant S := {}.
Instance: KnownConstant Imported.S := {}.
Instance: IsoStatementProofFor S S_iso := {}.
Instance: IsoStatementProofBetween S Imported.S S_iso := {}.
