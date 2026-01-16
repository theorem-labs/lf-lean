From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.bool__iso.

Definition imported_false : imported_bool := Imported.Stdlib_bool_false.
Instance false_iso : rel_iso bool_iso false imported_false.
Proof.
  constructor. apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Stdlib_bool_false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor false false_iso := {}.
Instance: IsoStatementProofBetween false Imported.Stdlib_bool_false false_iso := {}.
