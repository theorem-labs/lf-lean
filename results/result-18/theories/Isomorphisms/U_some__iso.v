From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.option__iso.

Monomorphic Definition imported_Some : forall x : Type, x -> imported_option x := (@Imported.mySome).
Monomorphic Instance Some_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2), rel_iso hx x3 x4 -> rel_iso (option_iso hx) (Some x3) (imported_Some x4).
Admitted.
Instance: KnownConstant (@Some) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.mySome) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Some) Some_iso := {}.
Instance: IsoStatementProofBetween (@Some) (@Imported.mySome) Some_iso := {}.