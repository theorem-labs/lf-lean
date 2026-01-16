From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.list__iso.

Monomorphic Definition imported_nil : forall x : Type, imported_list x := (@Imported.nil).
Monomorphic Instance nil_iso : forall (x1 x2 : Type) (hx : Iso x1 x2), rel_iso (list_iso hx) nil (imported_nil x2).
Admitted.
Instance: KnownConstant (@nil) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.nil) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@nil) nil_iso := {}.
Instance: IsoStatementProofBetween (@nil) (@Imported.nil) nil_iso := {}.