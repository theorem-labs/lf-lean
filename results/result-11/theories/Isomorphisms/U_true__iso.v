From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

Definition imported_True : SProp := Imported.True.

Definition True_to_imported : Logic.True -> imported_True := fun _ => Imported.True_intro.
Definition imported_to_True : imported_True -> Logic.True := fun _ => I.

Instance True_iso : (Iso Logic.True imported_True).
Proof.
  apply Build_Iso with
    (to := True_to_imported)
    (from := imported_to_True).
  - intro x. exact (Imported.True_indl (fun y => IsomorphismDefinitions.eq (True_to_imported (imported_to_True y)) y) IsomorphismDefinitions.eq_refl x).
  - intro x. destruct x. apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Logic.True := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.True := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Logic.True True_iso := {}.
Instance: IsoStatementProofBetween Logic.True Imported.True True_iso := {}.