From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_lt : imported_nat -> imported_nat -> SProp := Imported.lt.
Monomorphic Instance lt_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (x1 < x3) (imported_lt x2 x4).
Admitted.
Instance: KnownConstant lt := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.lt := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor lt lt_iso := {}.
Instance: IsoStatementProofBetween lt Imported.lt lt_iso := {}.