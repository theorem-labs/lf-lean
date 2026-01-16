From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.option__iso.

Definition imported_Some : forall x : Type, x -> imported_option x := (@Imported.option_Some).

Instance Some_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2), rel_iso hx x3 x4 -> rel_iso (option_iso hx) (Some x3) (imported_Some x4).
Proof.
  intros x1 x2 hx x3 x4 Hrel.
  unfold option_to_imported, imported_Some.
  constructor. simpl.
  exact (IsoEq.f_equal (Imported.option_Some x2) (proj_rel_iso Hrel)).
Defined.

Instance: KnownConstant (@Some) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.option_Some) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Some) Some_iso := {}.
Instance: IsoStatementProofBetween (@Some) (@Imported.option_Some) Some_iso := {}.