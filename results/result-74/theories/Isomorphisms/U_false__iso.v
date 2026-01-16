From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* (* Typeclasses Opaque rel_iso. *) *) *) (* for speed *)


Definition imported_False : SProp := Imported.MyFalse.

Definition False_to_imported : Logic.False -> imported_False := fun f => match f return imported_False with end.
Definition imported_to_False : imported_False -> Logic.False := fun f => Imported.MyFalse_recl (fun _ => Logic.False) f.

Instance False_iso : (Iso Logic.False imported_False).
Proof.
  refine {| to := False_to_imported;
            from := imported_to_False |}.
  - intro x. exact (Imported.MyFalse_indl (fun y => IsomorphismDefinitions.eq (False_to_imported (imported_to_False y)) y) x).
  - intro x. destruct x.
Defined.
Instance: KnownConstant Logic.False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.MyFalse := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Logic.False False_iso := {}.
Instance: IsoStatementProofBetween Logic.False Imported.MyFalse False_iso := {}.