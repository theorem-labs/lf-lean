From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.list__iso.

Definition imported_app : forall x : Type, imported_list x -> imported_list x -> imported_list x := Imported.app.
Instance app_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : list x1) (x4 : imported_list x2),
  rel_iso (list_iso hx) x3 x4 -> forall (x5 : list x1) (x6 : imported_list x2), rel_iso (list_iso hx) x5 x6 -> rel_iso (list_iso hx) (x3 ++ x5)%list (imported_app x4 x6).
Admitted.
Instance: KnownConstant app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor app app_iso := {}.
Instance: IsoStatementProofBetween app Imported.app app_iso := {}.