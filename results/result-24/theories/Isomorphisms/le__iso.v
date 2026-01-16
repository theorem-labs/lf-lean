From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_le : imported_nat -> imported_nat -> SProp := Imported.le.

Instance le_iso : (forall (x1 : Datatypes.nat) (x2 : imported_nat) (_ : @rel_iso Datatypes.nat imported_nat nat_iso x1 x2) (x3 : Datatypes.nat) (x4 : imported_nat) (_ : @rel_iso Datatypes.nat imported_nat nat_iso x3 x4), Iso (Peano.le x1 x3) (imported_le x2 x4)).
Admitted.

Instance: KnownConstant Peano.le := {}.
Instance: KnownConstant Imported.le := {}.
Instance: IsoStatementProofFor Peano.le le_iso := {}.
Instance: IsoStatementProofBetween Peano.le Imported.le le_iso := {}.
