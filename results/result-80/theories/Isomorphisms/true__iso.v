From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.bool__iso.

Definition imported_true : imported_bool := Imported.Stdlib_bool_true.
Instance true_iso : rel_iso bool_iso true imported_true.
Proof.
  constructor. simpl. apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant true := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Stdlib_bool_true := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor true true_iso := {}.
Instance: IsoStatementProofBetween true Imported.Stdlib_bool_true true_iso := {}.