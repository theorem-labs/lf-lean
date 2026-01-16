From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Monomorphic Definition imported_True : SProp := Imported.MyTrue.

(* Iso between Prop True and SProp MyTrue *)
Monomorphic Instance True_iso : (Iso True imported_True).
Proof.
  unshelve eapply Build_Iso.
  - (* to: True -> imported_True (SProp) *)
    intro H. exact Imported.MyTrue_intro.
  - (* from: imported_True -> True *)
    intro H. exact Logic.I.
  - (* to_from: eq in SProp, so proof irrelevance applies automatically *)
    intro x.
    exact (IsomorphismDefinitions.eq_refl Imported.MyTrue_intro).
  - (* from_to *)
    intro x; destruct x; apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant True := {}.
Instance: KnownConstant Imported.MyTrue := {}.
Instance: IsoStatementProofFor True True_iso := {}.
Instance: IsoStatementProofBetween True Imported.MyTrue True_iso := {}.