From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3 : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> SProp := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3).

(* Use the to/from from the list isomorphism *)
Definition list_to (x1 x2 : Type) (hx : Iso x1 x2) : Original.LF_DOT_Poly.LF.Poly.list x1 -> imported_Original_LF__DOT__Poly_LF_Poly_list x2 :=
  to (Original_LF__DOT__Poly_LF_Poly_list_iso hx).

Definition list_from (x1 x2 : Type) (hx : Iso x1 x2) : imported_Original_LF__DOT__Poly_LF_Poly_list x2 -> Original.LF_DOT_Poly.LF.Poly.list x1 :=
  from (Original_LF__DOT__Poly_LF_Poly_list_iso hx).

(* Convert Perm3 from Original to Imported (result in SProp) *)
Definition Perm3_to (x1 x2 : Type) (hx : Iso x1 x2) 
  (l1 l2 : Original.LF_DOT_Poly.LF.Poly.list x1) 
  (p : Original.LF_DOT_IndProp.LF.IndProp.Perm3 l1 l2) :
  imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3 (list_to hx l1) (list_to hx l2).
Proof.
  unfold list_to.
  induction p.
  - (* perm3_swap12 *)
    simpl.
    apply Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3_perm3_swap12.
  - (* perm3_swap23 *)
    simpl.
    apply Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3_perm3_swap23.
  - (* perm3_trans *)
    eapply Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3_perm3_trans.
    + exact IHp1.
    + exact IHp2.
Defined.

(* Alternative approach: prove Perm3_from using the SProp eliminator to SProp *)
Definition Perm3_from_sprop (x1 x2 : Type) (hx : Iso x1 x2) 
  (l1 l2 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) 
  (p : imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3 l1 l2) :
  SInhabited (Original.LF_DOT_IndProp.LF.IndProp.Perm3 (list_from hx l1) (list_from hx l2)).
Proof.
  unfold list_from.
  induction p.
  - (* perm3_swap12 *)
    apply sinhabits.
    simpl.
    apply Original.LF_DOT_IndProp.LF.IndProp.perm3_swap12.
  - (* perm3_swap23 *)
    apply sinhabits.
    simpl.
    apply Original.LF_DOT_IndProp.LF.IndProp.perm3_swap23.
  - (* perm3_trans *)
    destruct IHp1 as [q1].
    destruct IHp2 as [q2].
    apply sinhabits.
    eapply Original.LF_DOT_IndProp.LF.IndProp.perm3_trans.
    + exact q1.
    + exact q2.
Defined.

Lemma list_from_to (x1 x2 : Type) (hx : Iso x1 x2) (l : Original.LF_DOT_Poly.LF.Poly.list x1) :
  list_from hx (list_to hx l) = l.
Proof.
  unfold list_from, list_to.
  apply IsoEq.eq_of_seq.
  apply from_to.
Defined.

(* Helper lemma to convert Perm3 from list_from to original list *)
Lemma Perm3_transport (x1 x2 : Type) (hx : Iso x1 x2) 
  (l1 l2 : Original.LF_DOT_Poly.LF.Poly.list x1) :
  Original.LF_DOT_IndProp.LF.IndProp.Perm3 (list_from hx (list_to hx l1)) (list_from hx (list_to hx l2)) ->
  Original.LF_DOT_IndProp.LF.IndProp.Perm3 l1 l2.
Proof.
  intro p.
  pose proof (list_from_to hx l1) as F1.
  pose proof (list_from_to hx l2) as F2.
  exact (Logic.eq_rect _ (fun x => Original.LF_DOT_IndProp.LF.IndProp.Perm3 x l2)
           (Logic.eq_rect _ (fun y => Original.LF_DOT_IndProp.LF.IndProp.Perm3 (list_from hx (list_to hx l1)) y) p l2 F2) l1 F1).
Defined.

Instance Original_LF__DOT__IndProp_LF_IndProp_Perm3_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 ->
  forall (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.Perm3 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3 x4 x6).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  destruct H34 as [H34']. destruct H56 as [H56']. simpl in *.
  pose proof (IsoEq.eq_of_seq H34') as E1.
  pose proof (IsoEq.eq_of_seq H56') as E2.
  subst x4 x6.
  (* Build directly *)
  refine (@Build_Iso _ _ 
    (fun p => @Perm3_to x1 x2 hx x3 x5 p)
    (fun p => Perm3_transport hx x3 x5 (sinhabitant (@Perm3_from_sprop x1 x2 hx _ _ p)))
    _ _).
  - intro p. exact IsomorphismDefinitions.eq_refl.
  - intro p. 
    (* Need to show eq (from (to p)) p where from/to are the functions above and eq is SProp *)
    (* Since Original.Perm3 x3 x5 is a Prop, we use proof irrelevance *)
    exact (@IsoEq.seq_of_peq_t (Original.LF_DOT_IndProp.LF.IndProp.Perm3 x3 x5) _ _ 
             (Stdlib.Logic.ProofIrrelevance.proof_irrelevance _ _ _)).
Defined.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.Perm3) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.Perm3) Original_LF__DOT__IndProp_LF_IndProp_Perm3_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.Perm3) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3) Original_LF__DOT__IndProp_LF_IndProp_Perm3_iso := {}.