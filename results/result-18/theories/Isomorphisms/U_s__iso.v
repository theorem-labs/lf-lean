From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_S : imported_nat -> imported_nat := Imported.S_export.
Instance S_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Datatypes.S x1) (imported_S x2).
Proof.
  intros x1 x2 H.
  constructor. simpl.
  simpl.
  apply (IsoEq.f_equal Imported.nat_S H).
Defined.
Instance: KnownConstant Datatypes.S := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.S_export := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Datatypes.S S_iso := {}.
Instance: IsoStatementProofBetween Datatypes.S Imported.S_export S_iso := {}.