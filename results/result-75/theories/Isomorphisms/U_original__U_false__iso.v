From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_False : SProp := Imported.Original_False.
Monomorphic Instance Original_False_iso : Iso Original.False imported_Original_False.
Admitted.
Instance: KnownConstant Original.False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.False Original_False_iso := {}.
Instance: IsoStatementProofBetween Original.False Imported.Original_False Original_False_iso := {}.