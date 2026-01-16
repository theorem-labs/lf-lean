From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import ProofIrrelevance.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor : SProp -> SProp -> SProp := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor.

(* Helper lemma to convert between Coq eq and SProp eq for Prop types *)
Lemma prop_proof_irrelevance_sprop : forall (P : Prop) (x y : P), IsomorphismDefinitions.eq x y.
Proof.
  intros P x y.
  assert (x = y) by apply proof_irrelevance.
  subst. apply IsomorphismDefinitions.eq_refl.
Defined.

Instance Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso : (forall (x1 : Prop) (x2 : SProp) (_ : Iso x1 x2) (x3 : Prop) (x4 : SProp) (_ : Iso x3 x4),
   Iso (Original.LF_DOT_AltAuto.LF.AltAuto.nor x1 x3) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor x2 x4)).
Proof.
  intros x1 x2 iso12 x3 x4 iso34.
  unfold imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor.
  unshelve econstructor.
  - (* to: nor x1 x3 -> Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor x2 x4 *)
    intros [Hnotp Hnotq].
    constructor.
    + (* ~P in SProp: x2 -> Imported.False *)
      intro h2.
      destruct (Hnotp (iso12.(from) h2)).
    + (* ~Q in SProp: x4 -> Imported.False *)
      intro h4.
      destruct (Hnotq (iso34.(from) h4)).
  - (* from: Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor x2 x4 -> nor x1 x3 *)
    intros H.
    destruct H as [Hnotp Hnotq].
    constructor.
    + (* ~P in Prop: x1 -> False *)
      intro h1.
      destruct (Hnotp (iso12.(to) h1)).
    + (* ~Q in Prop: x3 -> False *)
      intro h3.
      destruct (Hnotq (iso34.(to) h3)).
  - (* to_from: in SProp, proof irrelevance is automatic *)
    intros x.
    apply IsomorphismDefinitions.eq_refl.
  - (* from_to: need proof irrelevance since nor is in Prop *)
    intros x.
    apply prop_proof_irrelevance_sprop.
Defined.

Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.nor := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.nor Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.nor Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso := {}.