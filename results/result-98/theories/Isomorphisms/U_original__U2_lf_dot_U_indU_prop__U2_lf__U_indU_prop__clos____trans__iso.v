From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_Original_LF__DOT__IndProp_LF_IndProp_clos__trans : forall x : Type, (x -> x -> SProp) -> x -> x -> SProp := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__trans).

(* Forward direction: clos_trans (Prop) -> clos_trans (SProp) *)
Section Forward.
Variable X1 X2 : Type.
Variable hx : Iso X1 X2.
Variable R1 : X1 -> X1 -> Prop.
Variable R2 : X2 -> X2 -> SProp.
Variable hR : forall (a : X1) (b : X2), rel_iso hx a b -> forall (c : X1) (d : X2), rel_iso hx c d -> Iso (R1 a c) (R2 b d).

Definition to_clos_trans_step (x1' y1' : X1) (HR : R1 x1' y1') :
  imported_Original_LF__DOT__IndProp_LF_IndProp_clos__trans R2 (to hx x1') (to hx y1') :=
  let iso_R := @hR x1' (to hx x1') IsomorphismDefinitions.eq_refl y1' (to hx y1') IsomorphismDefinitions.eq_refl in
  Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__trans_t_step _ _ (to hx x1') (to hx y1')
    (to iso_R HR).

Fixpoint to_clos_trans_aux (x1 y1 : X1)
  (H : Original.LF_DOT_IndProp.LF.IndProp.clos_trans R1 x1 y1) {struct H} :
  imported_Original_LF__DOT__IndProp_LF_IndProp_clos__trans R2 (to hx x1) (to hx y1) :=
  match H with
  | @Original.LF_DOT_IndProp.LF.IndProp.t_step _ _ x1' y1' HR =>
    @to_clos_trans_step x1' y1' HR
  | @Original.LF_DOT_IndProp.LF.IndProp.t_trans _ _ x1' y1' z1' Hxy Hyz =>
    Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__trans_t_trans _ _ (to hx x1') (to hx y1') (to hx z1')
      (@to_clos_trans_aux x1' y1' Hxy)
      (@to_clos_trans_aux y1' z1' Hyz)
  end.

Definition to_clos_trans : forall (a : X1) (b : X2), rel_iso hx a b -> 
  forall (c : X1) (d : X2), rel_iso hx c d ->
  Original.LF_DOT_IndProp.LF.IndProp.clos_trans R1 a c -> 
  imported_Original_LF__DOT__IndProp_LF_IndProp_clos__trans R2 b d.
Proof.
  intros a b hab c d hcd H.
  destruct hab as [hab].
  destruct hcd as [hcd].
  destruct hab. destruct hcd.
  exact (@to_clos_trans_aux a c H).
Defined.

End Forward.

(* Backward direction: clos_trans (SProp) -> clos_trans (Prop) *)
Section Backward.
Variable X1 X2 : Type.
Variable hx : Iso X1 X2.
Variable R1 : X1 -> X1 -> Prop.
Variable R2 : X2 -> X2 -> SProp.
Variable hR : forall (a : X1) (b : X2), rel_iso hx a b -> forall (c : X1) (d : X2), rel_iso hx c d -> Iso (R1 a c) (R2 b d).

(* For the backward direction, we need to go from SProp to Prop.
   We cannot eliminate SProp to Prop directly, so we use sinhabitant. *)

(* Transport R2 along the to_from equalities *)
Definition transport_R2_back (x2' y2' : X2) (HR : R2 x2' y2') :
  R2 (to hx (from hx x2')) (to hx (from hx y2')).
Proof.
  (* to_from hx x2' : to hx (from hx x2') = x2' (in IsomorphismDefinitions.eq, which is SProp)
     We need to go the other way: from x2' to to hx (from hx x2') *)
  exact (match IsoEq.eq_sym (to_from hx x2') in (IsomorphismDefinitions.eq _ z1) 
               return R2 z1 (to hx (from hx y2')) with 
         | IsomorphismDefinitions.eq_refl => 
           match IsoEq.eq_sym (to_from hx y2') in (IsomorphismDefinitions.eq _ z2) 
                 return R2 x2' z2 with 
           | IsomorphismDefinitions.eq_refl => HR
           end
         end).
Defined.

(* Build SInhabited of the Prop result from the SProp proof *)
Fixpoint from_clos_trans_aux_sinhabited (x2 y2 : X2)
  (H : Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__trans X2 R2 x2 y2) {struct H} :
  SInhabited (Original.LF_DOT_IndProp.LF.IndProp.clos_trans R1 (from hx x2) (from hx y2)).
Proof.
  destruct H as [x2' y2' HR | x2' y2' z2' Hxy Hyz].
  - (* t_step case *)
    apply sinhabits.
    pose proof (@hR (from hx x2') (to hx (from hx x2')) IsomorphismDefinitions.eq_refl 
                    (from hx y2') (to hx (from hx y2')) IsomorphismDefinitions.eq_refl) as Hi.
    apply (@Original.LF_DOT_IndProp.LF.IndProp.t_step X1 R1 (from hx x2') (from hx y2')).
    apply (from Hi).
    exact (@transport_R2_back x2' y2' HR).
  - (* t_trans case *)
    pose proof (from_clos_trans_aux_sinhabited x2' y2' Hxy) as IH1.
    pose proof (from_clos_trans_aux_sinhabited y2' z2' Hyz) as IH2.
    apply sinhabits.
    apply (@Original.LF_DOT_IndProp.LF.IndProp.t_trans X1 R1 (from hx x2') (from hx y2') (from hx z2')).
    + exact (sinhabitant IH1).
    + exact (sinhabitant IH2).
Defined.

Definition from_clos_trans : forall (a : X1) (b : X2), rel_iso hx a b -> 
  forall (c : X1) (d : X2), rel_iso hx c d ->
  imported_Original_LF__DOT__IndProp_LF_IndProp_clos__trans R2 b d ->
  Original.LF_DOT_IndProp.LF.IndProp.clos_trans R1 a c.
Proof.
  intros a b hab c d hcd H.
  destruct hab as [hab].
  destruct hcd as [hcd].
  destruct hab. destruct hcd.
  pose proof (@from_clos_trans_aux_sinhabited (to hx a) (to hx c) H) as Haux.
  pose proof (from_to hx a) as Ha.
  pose proof (from_to hx c) as Hc.
  destruct Ha. destruct Hc.
  exact (sinhabitant Haux).
Defined.

End Backward.

Instance Original_LF__DOT__IndProp_LF_IndProp_clos__trans_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> x1 -> Prop) (x4 : x2 -> x2 -> SProp),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) ->
  forall (x5 : x1) (x6 : x2),
  rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.clos_trans x3 x5 x7) (imported_Original_LF__DOT__IndProp_LF_IndProp_clos__trans x4 x6 x8).
Proof.
  intros x1 x2 hx R1 R2 hR a b hab c d hcd.
  apply Build_Iso with
    (to := @to_clos_trans x1 x2 hx R1 R2 hR a b hab c d hcd)
    (from := @from_clos_trans x1 x2 hx R1 R2 hR a b hab c d hcd).
  - (* to_from: SProp is proof-irrelevant, so any two proofs are equal *)
    intro y.
    exact IsomorphismDefinitions.eq_refl.
  - (* from_to: Prop is proof-irrelevant, use proof_irrelevance and convert to SProp eq *)
    intro y.
    apply IsoEq.seq_of_peq_t.
    apply ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.clos_trans) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__trans) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.clos_trans) Original_LF__DOT__IndProp_LF_IndProp_clos__trans_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.clos_trans) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__trans) Original_LF__DOT__IndProp_LF_IndProp_clos__trans_iso := {}.