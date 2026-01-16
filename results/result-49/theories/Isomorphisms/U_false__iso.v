From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_False : SProp := Imported.FalseType.

Definition imported_False_to : Logic.False -> imported_False := fun H => False_sind _ H.
Definition imported_False_from : imported_False -> Logic.False := fun H => Imported.FalseType_recl (fun _ => Logic.False) H.

Instance False_iso : (Iso Logic.False imported_False).
Proof.
  refine {| to := imported_False_to; from := imported_False_from |}.
  intro x; exact (Imported.FalseType_indl _ x).
  intro x; exact (False_sind _ x).
Defined.
Instance: KnownConstant Logic.False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.FalseType := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Logic.False False_iso := {}.
Instance: IsoStatementProofBetween Logic.False Imported.FalseType False_iso := {}.