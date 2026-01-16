From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. - disabled *) (* for speed *)

Definition imported_False : SProp := Imported.myFalse.
Instance False_iso : (Iso False imported_False).
Proof.
  unshelve eapply Build_Iso.
  - (* to: False -> imported_False *)
    intro H. destruct H.
  - (* from: imported_False -> False *)
    intro H. exact (Imported.myFalse_recl (fun _ => False) H).
  - (* to_from *)
    intro H. exact (Imported.myFalse_indl (fun _ => _) H).
  - (* from_to *)
    intro H. destruct H.
Defined.
Instance: KnownConstant False := {}. 
Instance: KnownConstant Imported.myFalse := {}. 
Instance: IsoStatementProofFor False False_iso := {}.
Instance: IsoStatementProofBetween False Imported.myFalse False_iso := {}.