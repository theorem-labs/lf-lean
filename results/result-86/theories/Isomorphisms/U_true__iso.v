From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)

Definition imported_True : SProp := Imported.MyTrue.

Definition True_to_imported (x : Logic.True) : imported_True :=
  Imported.MyTrue_intro.

Definition imported_to_True (x : imported_True) : Logic.True :=
  Logic.I.

Instance True_iso : Iso Logic.True imported_True.
Proof.
  exists True_to_imported imported_to_True.
  - intro x. apply IsomorphismDefinitions.eq_refl.
  - intro x. destruct x. apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Logic.True := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.MyTrue := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Logic.True True_iso := {}.
Instance: IsoStatementProofBetween Logic.True Imported.MyTrue True_iso := {}.
