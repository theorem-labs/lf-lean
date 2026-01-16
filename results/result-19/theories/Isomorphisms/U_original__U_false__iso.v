From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


Definition imported_Original_False : SProp := Imported.Original_False.
Instance Original_False_iso : (Iso Original.False imported_Original_False).
Proof.
  unshelve eapply Build_Iso.
  - (* to: Original.False -> imported_Original_False *)
    intro f. destruct f.
  - (* from: imported_Original_False -> Original.False *)
    intro f. destruct f.
  - (* to_from *)
    intro f. destruct f.
  - (* from_to *)
    intro f. destruct f.
Defined.
Instance: KnownConstant Original.False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.False Original_False_iso := {}.
Instance: IsoStatementProofBetween Original.False Imported.Original_False Original_False_iso := {}.