From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.list__iso.

Definition imported_nil : forall x : Type, imported_list x := @Imported.mylist_mynil.
Instance nil_iso : forall (x1 x2 : Type) (hx : Iso x1 x2), rel_iso (list_iso hx) nil (imported_nil x2).
Proof.
  intros x1 x2 hx.
  constructor. simpl.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant (@nil) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.mylist_mynil) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@nil) nil_iso := {}.
Instance: IsoStatementProofBetween (@nil) (@Imported.mylist_mynil) nil_iso := {}.