From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)


Definition imported_True : SProp := Imported.Exported_True.
Instance True_iso : (Iso True imported_True).
Proof.
  unshelve eapply Build_Iso.
  - (* to: True -> Imported.Exported_True *)
    intro H. exact Imported.Exported_True_intro.
  - (* from: Imported.Exported_True -> True *)
    intro H. exact Logic.I.
  - (* to_from: SProp proof irrelevance is automatic *)
    intro H. 
    destruct H.
    apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intro H. 
    destruct H.
    apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant True := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Exported_True := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor True True_iso := {}.
Instance: IsoStatementProofBetween True Imported.Exported_True True_iso := {}.