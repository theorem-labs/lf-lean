From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.option__iso.

Monomorphic Definition imported_None : forall x : Type, imported_option x := (@Imported.myoption_myNone).
Monomorphic Instance None_iso : forall (x1 x2 : Type) (hx : Iso x1 x2), rel_iso (option_iso hx) None (imported_None x2).
Proof.
  intros. constructor. apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant (@None) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.myoption_myNone) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@None) None_iso := {}.
Instance: IsoStatementProofBetween (@None) (@Imported.myoption_myNone) None_iso := {}.