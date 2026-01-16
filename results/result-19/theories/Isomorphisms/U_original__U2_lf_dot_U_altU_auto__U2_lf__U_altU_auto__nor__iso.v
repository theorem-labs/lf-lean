From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import ProofIrrelevance.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.

From IsomorphismChecker Require Export Isomorphisms.U_false__iso.
From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso.

Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor : SProp -> SProp -> SProp := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso : forall (x1 : Prop) (x2 : SProp),
  Iso x1 x2 -> forall (x3 : Prop) (x4 : SProp), Iso x3 x4 -> Iso (Original.LF_DOT_AltAuto.LF.AltAuto.nor x1 x3) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  unfold imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor.
  unshelve eapply Build_Iso.
  - (* to *)
    intro H. destruct H as [Hnot1 Hnot3].
    (* Build Imported.nor *)
    apply Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor_stroke.
    + (* x2 -> MyFalse *)
      intro H2.
      apply (to False_iso).
      apply Hnot1.
      exact (from H12 H2).
    + (* x4 -> MyFalse *)
      intro H4.
      apply (to False_iso).
      apply Hnot3.
      exact (from H34 H4).
  - (* from *)
    intro H.
    apply Original.LF_DOT_AltAuto.LF.AltAuto.stroke.
    + (* ~ x1 *)
      intro H1.
      apply (from False_iso).
      exact (@Imported.a____at___Solution__hyg1467 x2 x4 H (to H12 H1)).
    + (* ~ x3 *)
      intro H3.
      apply (from False_iso).
      exact (@Imported.a____at___Solution__hyg1473 x2 x4 H (to H34 H3)).
  - (* to_from *)
    intro H.
    apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intro H.
    apply seq_of_eq.
    apply ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.nor := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.nor Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.nor Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso := {}.
