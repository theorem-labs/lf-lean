From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_option : Type -> Type := Imported.myoption.
Monomorphic Instance option_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (option x1) (imported_option x2).
Admitted.
Instance: KnownConstant option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.myoption := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor option option_iso := {}.
Instance: IsoStatementProofBetween option Imported.myoption option_iso := {}.