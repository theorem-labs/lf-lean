From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Type : Type := Imported.Type.
Instance Type_iso : Iso Type imported_Type.
Admitted.
Instance: KnownConstant Type := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Type := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Type Type_iso := {}.
Instance: IsoStatementProofBetween Type Imported.Type Type_iso := {}.