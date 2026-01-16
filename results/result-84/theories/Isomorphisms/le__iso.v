From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_le : imported_nat -> imported_nat -> SProp := Imported.le.
Instance le_iso : forall (x1 : Corelib.Init.Datatypes.nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : Corelib.Init.Datatypes.nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (Corelib.Init.Peano.le x1 x3) (imported_le x2 x4).
Admitted.
Instance: KnownConstant le := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.le := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor le le_iso := {}.
Instance: IsoStatementProofBetween le Imported.le le_iso := {}.