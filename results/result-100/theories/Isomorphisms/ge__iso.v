From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_ge : imported_nat -> imported_nat -> SProp := Imported.ge.
Instance ge_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (x1 >= x3) (imported_ge x2 x4).
Admitted.
Instance: KnownConstant ge := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.ge := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor ge ge_iso := {}.
Instance: IsoStatementProofBetween ge Imported.ge ge_iso := {}.