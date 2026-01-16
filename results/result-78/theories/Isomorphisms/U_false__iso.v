From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)

Definition imported_False : SProp := Imported.False_.

(* Build Iso between empty types *)
Definition False_to_imported : Logic.False -> imported_False := fun H => match H with end.

(* For the imported -> Logic.False direction, we need to use sinhabitant *)
Lemma imported_False_to_SInhabited : imported_False -> SInhabited Logic.False.
Proof.
  intro H. exact (Imported.False__indl (fun _ => SInhabited Logic.False) H).
Defined.

Definition imported_to_False : imported_False -> Logic.False := fun H => sinhabitant (imported_False_to_SInhabited H).

Instance False_iso : Iso Logic.False imported_False :=
  {| to := False_to_imported;
     from := imported_to_False;
     to_from := fun H => Imported.False__indl (fun y => IsomorphismDefinitions.eq (False_to_imported (imported_to_False y)) y) H;
     from_to := fun H => match H with end
  |}.

Instance: KnownConstant Logic.False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.False_ := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Logic.False False_iso := {}.
Instance: IsoStatementProofBetween Logic.False Imported.False_ False_iso := {}.
