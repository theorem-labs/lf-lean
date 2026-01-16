From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
From Stdlib Require Import Logic.ProofIrrelevance.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reg____exp__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x -> SProp := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match).

(* Helper: convert exp_match to imported exp_match for canonical form *)
Fixpoint exp_match_to_canonical {T1 T2 : Type} (hT : Iso T1 T2)
  {s : Original.LF_DOT_Poly.LF.Poly.list T1}
  {re : Original.LF_DOT_IndProp.LF.IndProp.reg_exp T1}
  (Hmatch : Original.LF_DOT_IndProp.LF.IndProp.exp_match s re)
  {struct Hmatch}
  : Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match T2
      (to (Original_LF__DOT__Poly_LF_Poly_list_iso hT) s)
      (to (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hT) re).
Proof.
  destruct Hmatch.
  - (* MEmpty *)
    simpl. exact (Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match_MEmpty T2).
  - (* MChar *)
    simpl. exact (Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match_MChar T2 (to hT x)).
  - (* MApp *)
    simpl.
    pose proof (list_to_app_compat hT s1 s2) as Happ.
    pose proof (Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match_MApp T2 _ _ _ _ 
                  (@exp_match_to_canonical T1 T2 hT s1 re1 Hmatch1) 
                  (@exp_match_to_canonical T1 T2 hT s2 re2 Hmatch2)) as Hres.
    exact (eq_srect_nodep (fun l => Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match T2 l _) Hres (eq_sym Happ)).
  - (* MUnionL *)
    simpl. exact (Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match_MUnionL T2 _ _ _ (@exp_match_to_canonical T1 T2 hT s1 re1 Hmatch)).
  - (* MUnionR *)
    simpl. exact (Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match_MUnionR T2 _ _ _ (@exp_match_to_canonical T1 T2 hT s2 re2 Hmatch)).
  - (* MStar0 *)
    simpl. exact (Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match_MStar0 T2 _).
  - (* MStarApp *)
    simpl.
    pose proof (list_to_app_compat hT s1 s2) as Happ.
    pose proof (Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match_MStarApp T2 _ _ _ 
                  (@exp_match_to_canonical T1 T2 hT s1 re Hmatch1) 
                  (@exp_match_to_canonical T1 T2 hT s2 _ Hmatch2)) as Hres.
    exact (eq_srect_nodep (fun l => Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match T2 l _) Hres (eq_sym Happ)).
Defined.

(* Simple definition to transport along eq (not dependent on proof) *)
Definition eq_rect_nodep_simple {A : Type} {a b : A} (P : A -> Type) (x : P a) (H : a = b) : P b :=
  match H in (_ = y) return P y with
  | Logic.eq_refl => x
  end.

(* Helper: convert imported exp_match to SInhabited of original exp_match
   We use SInhabited because we can't eliminate SProp directly to Prop *)
Fixpoint exp_match_from_canonical_SInhabited {T1 T2 : Type} (hT : Iso T1 T2)
  {s : imported_Original_LF__DOT__Poly_LF_Poly_list T2}
  {re : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp T2}
  (Hmatch : Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match T2 s re)
  {struct Hmatch}
  : SInhabited (Original.LF_DOT_IndProp.LF.IndProp.exp_match 
      (from (Original_LF__DOT__Poly_LF_Poly_list_iso hT) s)
      (from (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hT) re)).
Proof.
  destruct Hmatch.
  - (* MEmpty *)
    simpl. apply sinhabits. exact Original.LF_DOT_IndProp.LF.IndProp.MEmpty.
  - (* MChar *)
    simpl. apply sinhabits. exact (Original.LF_DOT_IndProp.LF.IndProp.MChar (from hT x)).
  - (* MApp *)
    simpl.
    apply sinhabits.
    pose proof (list_to_app_compat hT 
                  (from (Original_LF__DOT__Poly_LF_Poly_list_iso hT) s1)
                  (from (Original_LF__DOT__Poly_LF_Poly_list_iso hT) s2)) as Happ.
    pose proof (eq_trans Happ 
                  (f_equal2 (Imported.Original_LF__DOT__Poly_LF_Poly_app T2) 
                     (to_from (Original_LF__DOT__Poly_LF_Poly_list_iso hT) s1)
                     (to_from (Original_LF__DOT__Poly_LF_Poly_list_iso hT) s2))) as Happ'.
    pose proof (Original.LF_DOT_IndProp.LF.IndProp.MApp _ _ _ _
                  (sinhabitant (@exp_match_from_canonical_SInhabited T1 T2 hT s1 re1 Hmatch1))
                  (sinhabitant (@exp_match_from_canonical_SInhabited T1 T2 hT s2 re2 Hmatch2))) as Hres.
    pose proof (eq_rect_nodep_simple
                  (fun l => Original.LF_DOT_IndProp.LF.IndProp.exp_match l _) 
                  Hres 
                  (eq_of_seq (eq_trans (eq_sym (from_to (Original_LF__DOT__Poly_LF_Poly_list_iso hT) _)) 
                               (f_equal (from (Original_LF__DOT__Poly_LF_Poly_list_iso hT)) Happ')))) as Hfinal.
    exact Hfinal.
  - (* MUnionL *)
    simpl. apply sinhabits. 
    exact (Original.LF_DOT_IndProp.LF.IndProp.MUnionL _ _ _ 
             (sinhabitant (@exp_match_from_canonical_SInhabited T1 T2 hT s1 re1 Hmatch))).
  - (* MUnionR *)
    simpl. apply sinhabits.
    exact (Original.LF_DOT_IndProp.LF.IndProp.MUnionR _ _ _ 
             (sinhabitant (@exp_match_from_canonical_SInhabited T1 T2 hT s2 re2 Hmatch))).
  - (* MStar0 *)
    simpl. apply sinhabits. exact (Original.LF_DOT_IndProp.LF.IndProp.MStar0 _).
  - (* MStarApp *)
    simpl.
    apply sinhabits.
    pose proof (list_to_app_compat hT 
                  (from (Original_LF__DOT__Poly_LF_Poly_list_iso hT) s1)
                  (from (Original_LF__DOT__Poly_LF_Poly_list_iso hT) s2)) as Happ.
    pose proof (eq_trans Happ 
                  (f_equal2 (Imported.Original_LF__DOT__Poly_LF_Poly_app T2) 
                     (to_from (Original_LF__DOT__Poly_LF_Poly_list_iso hT) s1)
                     (to_from (Original_LF__DOT__Poly_LF_Poly_list_iso hT) s2))) as Happ'.
    pose proof (Original.LF_DOT_IndProp.LF.IndProp.MStarApp _ _
                  (from (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hT) re)
                  (sinhabitant (@exp_match_from_canonical_SInhabited T1 T2 hT s1 re Hmatch1))
                  (sinhabitant (@exp_match_from_canonical_SInhabited T1 T2 hT s2 _ Hmatch2))) as Hres.
    pose proof (eq_rect_nodep_simple 
                  (fun l => Original.LF_DOT_IndProp.LF.IndProp.exp_match l _) 
                  Hres 
                  (eq_of_seq (eq_trans (eq_sym (from_to (Original_LF__DOT__Poly_LF_Poly_list_iso hT) _)) 
                               (f_equal (from (Original_LF__DOT__Poly_LF_Poly_list_iso hT)) Happ')))) as Hfinal.
    exact Hfinal.
Defined.

Instance Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso : (forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
     (_ : @rel_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx) x3 x4)
     (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
     (_ : @rel_iso (Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2) (@Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso x1 x2 hx) x5 x6),
   Iso (@Original.LF_DOT_IndProp.LF.IndProp.exp_match x1 x3 x5) (@imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2 x4 x6)).
Proof.
  intros x1 x2 hx x3 x4 Hx34 x5 x6 Hx56.
  destruct Hx34 as [Hx34']. destruct Hx56 as [Hx56']. simpl in Hx34', Hx56'.
  unshelve eapply Build_Iso.
  - (* to: Original.exp_match x3 x5 -> imported exp_match x4 x6 *)
    intro Hmatch.
    pose proof (@exp_match_to_canonical x1 x2 hx x3 x5 Hmatch) as Hcanon.
    exact (eq_srect_nodep (fun l => Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match x2 l _) 
             (eq_srect_nodep (fun r => Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match x2 _ r) 
                Hcanon Hx56') Hx34').
  - (* from: imported exp_match x4 x6 -> Original.exp_match x3 x5 *)
    intro Hmatch.
    pose proof (@exp_match_from_canonical_SInhabited x1 x2 hx x4 x6 Hmatch) as Hcanon.
    apply sinhabitant.
    (* We have: Hcanon : SInhabited (exp_match (from list_iso x4) (from reg_iso x6))
       We need: SInhabited (exp_match x3 x5)
       Using Hx34' : eq (to list_iso x3) x4  and  Hx56' : eq (to reg_iso x5) x6 *)
    pose proof (eq_srect_nodep (fun l => SInhabited (Original.LF_DOT_IndProp.LF.IndProp.exp_match l _)) 
                 Hcanon (eq_trans (f_equal (from (Original_LF__DOT__Poly_LF_Poly_list_iso hx)) (eq_sym Hx34')) 
                                   (from_to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3))) as H1.
    pose proof (eq_srect_nodep (fun r => SInhabited (Original.LF_DOT_IndProp.LF.IndProp.exp_match _ r)) 
                 H1 (eq_trans (f_equal (from (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx)) (eq_sym Hx56'))
                              (from_to (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x5))) as H2.
    exact H2.
  - (* to_from: SProp, trivially irrelevant *)
    intro y. apply IsomorphismDefinitions.eq_refl.
  - (* from_to: Prop, use proof_irrelevance *)
    intro y. apply seq_of_eq. apply proof_irrelevance.
Defined.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.exp_match) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.exp_match) Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.exp_match) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match) Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso := {}.