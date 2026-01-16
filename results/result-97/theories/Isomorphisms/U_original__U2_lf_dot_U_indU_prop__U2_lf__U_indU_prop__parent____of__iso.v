From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_person__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_parent__of : imported_Original_LF__DOT__IndProp_LF_IndProp_Person -> imported_Original_LF__DOT__IndProp_LF_IndProp_Person -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_parent__of.

(* Forward direction: parent_of (Prop) -> parent_of (SProp) *)
Definition to_parent_of (x1 x3 : Original.LF_DOT_IndProp.LF.IndProp.Person)
  (H : Original.LF_DOT_IndProp.LF.IndProp.parent_of x1 x3) :
  imported_Original_LF__DOT__IndProp_LF_IndProp_parent__of
    (to Original_LF__DOT__IndProp_LF_IndProp_Person_iso x1)
    (to Original_LF__DOT__IndProp_LF_IndProp_Person_iso x3) :=
  match H with
  | Original.LF_DOT_IndProp.LF.IndProp.po_SC => Imported.Original_LF__DOT__IndProp_LF_IndProp_parent__of_po_SC
  | Original.LF_DOT_IndProp.LF.IndProp.po_SR => Imported.Original_LF__DOT__IndProp_LF_IndProp_parent__of_po_SR
  | Original.LF_DOT_IndProp.LF.IndProp.po_CM => Imported.Original_LF__DOT__IndProp_LF_IndProp_parent__of_po_CM
  end.

(* Backward direction: parent_of (SProp) -> parent_of (Prop) *)
Definition from_parent_of_sinhabited (x2 x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_Person)
  (H : imported_Original_LF__DOT__IndProp_LF_IndProp_parent__of x2 x4) :
  SInhabited (Original.LF_DOT_IndProp.LF.IndProp.parent_of
    (from Original_LF__DOT__IndProp_LF_IndProp_Person_iso x2)
    (from Original_LF__DOT__IndProp_LF_IndProp_Person_iso x4)) :=
  match H with
  | Imported.Original_LF__DOT__IndProp_LF_IndProp_parent__of_po_SC => sinhabits Original.LF_DOT_IndProp.LF.IndProp.po_SC
  | Imported.Original_LF__DOT__IndProp_LF_IndProp_parent__of_po_SR => sinhabits Original.LF_DOT_IndProp.LF.IndProp.po_SR
  | Imported.Original_LF__DOT__IndProp_LF_IndProp_parent__of_po_CM => sinhabits Original.LF_DOT_IndProp.LF.IndProp.po_CM
  end.

(* Helper to construct the from function *)
Definition from_parent_of_aux (x1 x3 : Original.LF_DOT_IndProp.LF.IndProp.Person)
  (H : imported_Original_LF__DOT__IndProp_LF_IndProp_parent__of 
         (to Original_LF__DOT__IndProp_LF_IndProp_Person_iso x1)
         (to Original_LF__DOT__IndProp_LF_IndProp_Person_iso x3)) :
  Original.LF_DOT_IndProp.LF.IndProp.parent_of x1 x3.
Proof.
  pose proof (@from_parent_of_sinhabited 
                (to Original_LF__DOT__IndProp_LF_IndProp_Person_iso x1)
                (to Original_LF__DOT__IndProp_LF_IndProp_Person_iso x3) H) as Hsinh.
  pose proof (from_to Original_LF__DOT__IndProp_LF_IndProp_Person_iso x1) as Heq1.
  pose proof (from_to Original_LF__DOT__IndProp_LF_IndProp_Person_iso x3) as Heq3.
  destruct Heq1. destruct Heq3.
  exact (sinhabitant Hsinh).
Defined.

Instance Original_LF__DOT__IndProp_LF_IndProp_parent__of_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.Person) (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_Person),
  rel_iso Original_LF__DOT__IndProp_LF_IndProp_Person_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_IndProp.LF.IndProp.Person) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_Person),
  rel_iso Original_LF__DOT__IndProp_LF_IndProp_Person_iso x3 x4 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.parent_of x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_parent__of x2 x4).
Proof.
  intros x1 x2 h12 x3 x4 h34.
  destruct h12 as [h12]. destruct h34 as [h34].
  destruct h12. destruct h34.
  unshelve eapply Build_Iso.
  - (* to *) intro H. exact (to_parent_of x1 x3 H).
  - (* from *) intro H. exact (from_parent_of_aux x1 x3 H).
  - (* to_from *) intro y. exact IsomorphismDefinitions.eq_refl.
  - (* from_to *) intro y. apply IsoEq.seq_of_peq_t. apply ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.parent_of := {}.
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_parent__of := {}.
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.parent_of Original_LF__DOT__IndProp_LF_IndProp_parent__of_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.parent_of Imported.Original_LF__DOT__IndProp_LF_IndProp_parent__of Original_LF__DOT__IndProp_LF_IndProp_parent__of_iso := {}.
