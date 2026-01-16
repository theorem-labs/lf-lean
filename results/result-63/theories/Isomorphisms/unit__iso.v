From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_unit : Type := Imported.unit.
Instance unit_iso : Iso unit imported_unit.
Admitted.
Instance: KnownConstant unit := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.unit := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor unit unit_iso := {}.
Instance: IsoStatementProofBetween unit Imported.unit unit_iso := {}.