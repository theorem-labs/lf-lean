From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_0 : imported_nat := Imported.nat_O.
Instance _0_iso : rel_iso nat_iso O imported_0.
Proof.
  constructor. simpl.
  unfold imported_0. 
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant O := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.nat_O := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor O _0_iso := {}.