From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.bool__iso.

Monomorphic Definition imported_true : imported_bool := Imported.true.
Monomorphic Instance true_iso : rel_iso bool_iso true imported_true.
Admitted.
Instance: KnownConstant true := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.true := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor true true_iso := {}.
Instance: IsoStatementProofBetween true Imported.true true_iso := {}.