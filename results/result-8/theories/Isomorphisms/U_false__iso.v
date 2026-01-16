From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


(* Use Imported.False directly *)
Definition imported_False : SProp := Imported.False.
Instance False_iso : (Iso False imported_False).
Proof.
  unshelve eapply Build_Iso.
  - (* to: False -> imported_False *)
    intro f. destruct f.
  - (* from: imported_False -> False *)
    intro f. destruct f.
  - (* to_from *)
    intro f. destruct f.
  - (* from_to *)
    intro f. destruct f.
Defined.
Instance: KnownConstant False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor False False_iso := {}.
Instance: IsoStatementProofBetween False Imported.False False_iso := {}.