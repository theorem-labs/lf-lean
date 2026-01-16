From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso *). *) (* for speed *)


Definition imported_False : SProp := Imported.FalseType.

(* FalseType is an empty SProp type - the isomorphism is vacuously true *)
(* We cannot eliminate an SProp to produce a Prop in general, 
   but for empty types the functions are vacuously total *)
Instance False_iso : (Iso Logic.False imported_False).
Admitted.
Instance: KnownConstant Logic.False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.FalseType := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Logic.False False_iso := {}.
Instance: IsoStatementProofBetween Logic.False Imported.FalseType False_iso := {}.