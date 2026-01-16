From Stdlib Require Import Logic.ProofIrrelevance.
From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *)
From Stdlib Require Import Arith.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aeval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__beval__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_ceval : imported_Original_LF__DOT__Imp_LF_Imp_com -> (imported_String_string -> imported_nat) -> (imported_String_string -> imported_nat) -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_ceval.

(* State conversion *)
Definition state_to_imported (st : Original.LF_DOT_Imp.LF.Imp.state) : imported_String_string -> imported_nat :=
  fun x' => to nat_iso (st (from String_string_iso x')).

(* Helper lemmas for state equality *)
Lemma state_to_imported_ext : forall st1 st2 : Original.LF_DOT_Imp.LF.Imp.state,
  (forall x, st1 x = st2 x) ->
  forall x', state_to_imported st1 x' = state_to_imported st2 x'.
Proof.
  intros st1 st2 Heq x'.
  unfold state_to_imported. f_equal. apply Heq.
Qed.

Lemma state_to_imported_inj :
  forall s1 s2,
    state_to_imported s1 = state_to_imported s2 ->
    s1 = s2.
Proof.
  intros s1 s2 Heq.
  apply Logic.FunctionalExtensionality.functional_extensionality.
  intro x.
  assert (Heq_x: state_to_imported s1 (to String_string_iso x) = 
                 state_to_imported s2 (to String_string_iso x)).
  { congruence. }
  unfold state_to_imported in Heq_x.
  rewrite (from_to String_string_iso x) in Heq_x.
  apply (Logic.f_equal (from nat_iso)) in Heq_x.
  rewrite !from_to in Heq_x.
  exact Heq_x.
Qed.

(* Equality conversion for Imported.Corelib_Init_Logic_eq *)
Lemma eq_to_imported_eq : forall A (x y : A), x = y -> Imported.Corelib_Init_Logic_eq A x y.
Proof.
  intros. subst. apply Imported.Corelib_Init_Logic_eq_refl.
Qed.

Lemma imported_eq_to_eq : forall A (x y : A), Imported.Corelib_Init_Logic_eq A x y -> x = y.
Proof.
  intros A x y H. destruct H. reflexivity.
Qed.

(* Key lemma: aeval commutes with state_to_imported *)
Lemma aeval_compat : forall st a,
  to nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a) = 
  Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a).
Proof.
  intros st a.
  induction a.
  - (* ANum *) simpl. reflexivity.
  - (* AId *)
    (* Arguments nat_iso: simpl never. *)
    cbn -[nat_iso aexp_to_imported].
    unfold state_to_imported, aexp_to_imported. cbn -[nat_iso String_string_iso]. do 2 f_equal. symmetry.
    (* Set Printing All. Set Printing Universes. *)
    (* Search Logic.eq IsomorphismDefinitions.eq. *)
    apply eq_of_seq. apply (from_to String_string_iso).
  - (* APlus *)
    transitivity (Imported.nat_add (to nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a1)) 
                                    (to nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a2))).
    + apply eq_of_seq.
      assert (H: nat_add_i (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a1)) (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a2)) = Imported.nat_add (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a1)) (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a2))) by apply eq_of_seq, nat_add_i_eq.
      rewrite <- H. apply nat_to_imported_add.
    + replace (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a1)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a1)).
      replace (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a2)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a2)).
      simpl. reflexivity.
  - (* AMinus *)
    transitivity (Imported.nat_sub (to nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a1)) 
                                    (to nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a2))).
    + apply eq_of_seq.
      assert (H: nat_sub_i (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a1)) (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a2)) = Imported.nat_sub (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a1)) (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a2))) by apply eq_of_seq, nat_sub_i_eq.
      rewrite <- H. apply nat_to_imported_sub.
    + replace (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a1)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a1)).
      replace (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a2)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a2)).
      simpl. reflexivity.
  - (* AMult *)
    transitivity (Imported.nat_mul (to nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a1)) 
                                    (to nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a2))).
    + apply eq_of_seq.
      assert (H: nat_mul_i (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a1)) (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a2)) = Imported.nat_mul (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a1)) (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a2))) by apply eq_of_seq, nat_mul_i_eq.
      rewrite <- H. apply nat_to_imported_mul.
    + replace (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a1)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a1)).
      replace (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a2)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a2)).
      simpl. reflexivity.
Qed.

(* Helper: convert bool to mybool *)
Definition bool_to_mybool (b : bool) : Imported.mybool :=
  match b with
  | true => Imported.mybool_mytrue
  | false => Imported.mybool_myfalse
  end.

Lemma beval_compat : forall st b,
  bool_to_mybool (Original.LF_DOT_Imp.LF.Imp.beval st b) = 
  Imported.Original_LF__DOT__Imp_LF_Imp_beval (state_to_imported st) (bexp_to_imported b).
Proof.
  intros st b.
  induction b; try reflexivity.
  - (* BEq *)
    simpl.
    pose proof (aeval_compat st a1) as H1.
    pose proof (aeval_compat st a2) as H2.
    pose proof (beval_aux_eq (state_to_imported st)
(Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BEq
(aexp_to_imported a1) (aexp_to_imported a2))) as Hbeval.
    apply eq_of_seq in Hbeval. unfold imported_Original_LF__DOT__Imp_LF_Imp_beval in Hbeval. rewrite <- Hbeval. simpl.
    pose proof (aeval_aux_eq (state_to_imported st) (aexp_to_imported a1)) as Haeval1.
    pose proof (aeval_aux_eq (state_to_imported st) (aexp_to_imported a2)) as Haeval2.
    apply eq_of_seq in Haeval1, Haeval2.
    unfold imported_Original_LF__DOT__Imp_LF_Imp_aeval in Haeval1.
    replace (aeval_aux (state_to_imported st) (aexp_to_imported a1)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a1)).
    replace (aeval_aux (state_to_imported st) (aexp_to_imported a2)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a2)).
    rewrite <- H1, <- H2.
    pose proof (nat_to_imported_eqb (Original.LF_DOT_Imp.LF.Imp.aeval st a1) (Original.LF_DOT_Imp.LF.Imp.aeval st a2)) as Hnat_eqb_i.
    apply eq_of_seq in Hnat_eqb_i. rewrite <- Hnat_eqb_i.
    reflexivity.
  - (* BNeq *)
    simpl.
    pose proof (aeval_compat st a1) as H1.
    pose proof (aeval_compat st a2) as H2.
    pose proof (beval_aux_eq (state_to_imported st)
(Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNeq
(aexp_to_imported a1) (aexp_to_imported a2))) as Hbeval.
    apply eq_of_seq in Hbeval. unfold imported_Original_LF__DOT__Imp_LF_Imp_beval in Hbeval. rewrite <- Hbeval. simpl.
    pose proof (aeval_aux_eq (state_to_imported st) (aexp_to_imported a1)) as Haeval1.
    pose proof (aeval_aux_eq (state_to_imported st) (aexp_to_imported a2)) as Haeval2.
    apply eq_of_seq in Haeval1, Haeval2.
    unfold imported_Original_LF__DOT__Imp_LF_Imp_aeval in Haeval1.
    replace (aeval_aux (state_to_imported st) (aexp_to_imported a1)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a1)).
    replace (aeval_aux (state_to_imported st) (aexp_to_imported a2)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a2)).
    rewrite <- H1, <- H2.
    pose proof (nat_to_imported_eqb (Original.LF_DOT_Imp.LF.Imp.aeval st a1) (Original.LF_DOT_Imp.LF.Imp.aeval st a2)) as Hnat_eqb_i.
    apply eq_of_seq in Hnat_eqb_i. rewrite <- Hnat_eqb_i.
    pose proof (bool_to_imported_negb (Original.LF_DOT_Imp.LF.Imp.aeval st a1 =? Original.LF_DOT_Imp.LF.Imp.aeval st a2)) as Hnegb_i.
    apply eq_of_seq in Hnegb_i. rewrite <- Hnegb_i.
    reflexivity.
  - (* BLe *)
    simpl.
    pose proof (aeval_compat st a1) as H1.
    pose proof (aeval_compat st a2) as H2.
    pose proof (beval_aux_eq (state_to_imported st) (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BLe (aexp_to_imported a1) (aexp_to_imported a2))) as Hbeval.
    apply eq_of_seq in Hbeval. unfold imported_Original_LF__DOT__Imp_LF_Imp_beval in Hbeval. rewrite <- Hbeval. simpl.
    pose proof (aeval_aux_eq (state_to_imported st) (aexp_to_imported a1)) as Haeval1.
    pose proof (aeval_aux_eq (state_to_imported st) (aexp_to_imported a2)) as Haeval2.
    apply eq_of_seq in Haeval1, Haeval2.
    unfold imported_Original_LF__DOT__Imp_LF_Imp_aeval in Haeval1.
    replace (aeval_aux (state_to_imported st) (aexp_to_imported a1)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a1)).
    replace (aeval_aux (state_to_imported st) (aexp_to_imported a2)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a2)).
    rewrite <- H1, <- H2.
    pose proof (nat_to_imported_leb (Original.LF_DOT_Imp.LF.Imp.aeval st a1) (Original.LF_DOT_Imp.LF.Imp.aeval st a2)) as Hnat_leb_i.
    apply eq_of_seq in Hnat_leb_i. rewrite <- Hnat_leb_i.
    reflexivity.
  - (* BGt *)
    simpl.
    pose proof (aeval_compat st a1) as H1.
    pose proof (aeval_compat st a2) as H2.
    pose proof (beval_aux_eq (state_to_imported st) (Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BGt (aexp_to_imported a1) (aexp_to_imported a2))) as Hbeval.
    apply eq_of_seq in Hbeval. unfold imported_Original_LF__DOT__Imp_LF_Imp_beval in Hbeval. rewrite <- Hbeval. simpl.
    pose proof (aeval_aux_eq (state_to_imported st) (aexp_to_imported a1)) as Haeval1.
    pose proof (aeval_aux_eq (state_to_imported st) (aexp_to_imported a2)) as Haeval2.
    apply eq_of_seq in Haeval1, Haeval2.
    unfold imported_Original_LF__DOT__Imp_LF_Imp_aeval in Haeval1.
    replace (aeval_aux (state_to_imported st) (aexp_to_imported a1)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a1)).
    replace (aeval_aux (state_to_imported st) (aexp_to_imported a2)) with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a2)).
    rewrite <- H1, <- H2.
    pose proof (nat_to_imported_leb (Original.LF_DOT_Imp.LF.Imp.aeval st a1) (Original.LF_DOT_Imp.LF.Imp.aeval st a2)) as Hnat_leb_i.
    apply eq_of_seq in Hnat_leb_i. rewrite <- Hnat_leb_i.
    pose proof (bool_to_imported_negb (Original.LF_DOT_Imp.LF.Imp.aeval st a1 <=? Original.LF_DOT_Imp.LF.Imp.aeval st a2)) as Hnegb_i.
    apply eq_of_seq in Hnegb_i. rewrite <- Hnegb_i.
    reflexivity.
  - (* BNot *)
    simpl.
    pose proof (bool_to_imported_negb (Original.LF_DOT_Imp.LF.Imp.beval st b)) as Hnegb.
    apply eq_of_seq in Hnegb.
    replace (bool_to_mybool (negb (Original.LF_DOT_Imp.LF.Imp.beval st b))) with (negb_i (bool_to_imported (Original.LF_DOT_Imp.LF.Imp.beval st b))).
    replace (bool_to_imported (Original.LF_DOT_Imp.LF.Imp.beval st b)) with (Imported.Original_LF__DOT__Imp_LF_Imp_beval (state_to_imported st) (bexp_to_imported b)).
    reflexivity.
  - (* BAnd *)
    simpl.
    pose proof (bool_to_imported_andb (Original.LF_DOT_Imp.LF.Imp.beval st b1) (Original.LF_DOT_Imp.LF.Imp.beval st b2)) as Handb.
    apply eq_of_seq in Handb.
    replace (bool_to_mybool (Original.LF_DOT_Imp.LF.Imp.beval st b1 && Original.LF_DOT_Imp.LF.Imp.beval st b2)) with (andb_i (bool_to_imported (Original.LF_DOT_Imp.LF.Imp.beval st b1)) (bool_to_imported (Original.LF_DOT_Imp.LF.Imp.beval st b2))).
    replace (bool_to_imported (Original.LF_DOT_Imp.LF.Imp.beval st b1)) with (Imported.Original_LF__DOT__Imp_LF_Imp_beval (state_to_imported st) (bexp_to_imported b1)).
    replace (bool_to_imported (Original.LF_DOT_Imp.LF.Imp.beval st b2)) with (Imported.Original_LF__DOT__Imp_LF_Imp_beval (state_to_imported st) (bexp_to_imported b2)).
    reflexivity.
Qed.

(* t_update commutes with state_to_imported *)
Lemma t_update_compat : forall st x n,
  (fun y' => state_to_imported (Original.LF_DOT_Maps.LF.Maps.t_update st x n) y') =
  (fun y' => Imported.Original_LF__DOT__Maps_LF_Maps_t__update _ (state_to_imported st) (to String_string_iso x) (to nat_iso n) y').
Proof.
  intros st x n.
  apply eq_of_seq. apply functional_extensionality. intros y'.
  unfold state_to_imported, Original.LF_DOT_Maps.LF.Maps.t_update, Imported.Original_LF__DOT__Maps_LF_Maps_t__update.
  (* Need to show String.eqb x (from y') and Imported.String_eqb (to x) y' match *)
  unfold Imported.bool_negb_match_1, Imported.mybool_casesOn, Imported.mybool_recl.
  assert (bool_to_mybool (String.eqb x (from String_string_iso y')) = Imported.String_eqb (String_string_iso x) y'). {
    apply eq_of_seq.
    apply string_eqb_compat.
    - constructor. apply IsomorphismDefinitions.eq_refl.
    - constructor. apply (to_from String_string_iso). }
  rewrite <- H.
  destruct (String.eqb x (from String_string_iso y')); reflexivity.
Qed.

(* Reverse conversion helper: Convert imported (SProp) to SInhabited of original (Prop) *)
Lemma ceval_from_imported_to_sinhabited :
  forall c' st' st'',
    Imported.Original_LF__DOT__Imp_LF_Imp_ceval c' st' st'' ->
    forall c st st_fin,
      c' = com_to_imported c ->
      st' = state_to_imported st ->
      st'' = state_to_imported st_fin ->
      SInhabited (Original.LF_DOT_Imp.LF.Imp.ceval c st st_fin).
Proof.
  fix IH 4.
  intros c' st' st'' H.
  destruct H; intros c_orig st_orig st_fin_orig Heq_c Heq_st1 Heq_st2.
  - (* E_Skip *)
    simpl in Heq_c. destruct c_orig; try discriminate.
    apply sinhabits.
    assert (st_orig = st_fin_orig).
    { apply eq_of_seq. apply functional_extensionality. intro x.
      assert (H_eq: state_to_imported st_orig (to String_string_iso x) =
                    state_to_imported st_fin_orig (to String_string_iso x)).
      { rewrite <- Heq_st1, <- Heq_st2. reflexivity. }
      unfold state_to_imported in H_eq.
      rewrite (from_to String_string_iso x) in H_eq.
      assert (Hinj: st_orig x = st_fin_orig x).
      { apply (Logic.f_equal (from nat_iso)) in H_eq.
        rewrite !from_to in H_eq.
        exact H_eq. }
      apply seq_of_eq. exact Hinj. }
    destruct H. simpl. apply Original.LF_DOT_Imp.LF.Imp.E_Skip.
  - (* E_Asgn *)
    destruct c_orig; try discriminate.
    injection Heq_c as Heq_x Heq_a.
    apply sinhabits.
    match goal with | H : Imported.Corelib_Init_Logic_eq _ _ _ |- _ => rename H into e end.
    apply imported_eq_to_eq in e.
    rewrite Heq_a in e.
    pose proof (t_update_compat st_orig x0 (Original.LF_DOT_Imp.LF.Imp.aeval st_orig a0)) as Ht_update.
    pose proof (fun y' => Logic.f_equal (fun f => f y') Ht_update) as Hpt.
    simpl in Hpt.
    rewrite Heq_st1 in Heq_st2, e.
    rewrite Heq_x in Heq_st2.
    replace -> n with (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st_orig) (aexp_to_imported a0)) in Heq_st2 by (symmetry; exact e).
    assert (Hpt_curried: forall y',
      (Imported.Original_LF__DOT__Maps_LF_Maps_t__update imported_nat
        (state_to_imported st_orig)
        (String_string_iso x0)
        (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st_orig a0))) y' =
      state_to_imported
        (Original.LF_DOT_Maps.LF.Maps.t_update st_orig x0
          (Original.LF_DOT_Imp.LF.Imp.aeval st_orig a0)) y').
    { intro y'.
      pose proof (Hpt y') as H.
      (* change ((fix f (s : String.string) : imported_String_string :=
                match s with
                | String.EmptyString => Imported.String_string_EmptyString
                | String.String c rest => Imported.String_string_String (ascii_to c) (f rest)
                end) x0) with (String_string_iso x0) in H.
      change ((fix f (n : nat) : imported_nat :=
                match n with
                | 0%nat => Imported.nat_O
                | S m => Imported.nat_S (f m)
                end) (Original.LF_DOT_Imp.LF.Imp.aeval st_orig a0)) with (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st_orig a0)) in H. *)
      exact (Logic.eq_sym H). }
    clear Hpt. rename Hpt_curried into Hpt.
    (* change ((fix f (s : String.string) : imported_String_string :=
                match s with
                | String.EmptyString => Imported.String_string_EmptyString
                | String.String c rest => Imported.String_string_String (ascii_to c) (f rest)
                end) x0) with (String_string_iso x0) in Heq_st2. *)
    rewrite aeval_compat in Hpt.
    pattern (Imported.Original_LF__DOT__Maps_LF_Maps_t__update imported_nat (state_to_imported st_orig) (String_string_iso x0) (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st_orig) (aexp_to_imported a0))) at 1 in Hpt.
    rewrite Heq_st2 in Hpt.
    apply Logic.FunctionalExtensionality.functional_extensionality in Hpt.
    apply state_to_imported_inj in Hpt.
    replace st_fin_orig with (Original.LF_DOT_Maps.LF.Maps.t_update st_orig x0 (Original.LF_DOT_Imp.LF.Imp.aeval st_orig a0)).
    apply Original.LF_DOT_Imp.LF.Imp.E_Asgn.
    reflexivity.
  - (* E_Seq *)
    destruct c_orig; try discriminate.
    injection Heq_c as Heq_c1 Heq_c2.
    apply sinhabits.
    pose (st_mid := fun x => from nat_iso (st' (to String_string_iso x))).
    assert (Heq_st_mid: state_to_imported st_mid = st').
    { apply eq_of_seq. apply functional_extensionality. intro x'.
      unfold st_mid, state_to_imported.
      eapply IsoEq.eq_trans.
      - apply to_from.
      - apply f_equal. apply to_from. }
    symmetry in Heq_st_mid.
    specialize (IH c1 st st' H c_orig1 st_orig st_mid Heq_c1 Heq_st1 Heq_st_mid) as IH1.
    specialize (IH c2 st' st'' H0 c_orig2 st_mid st_fin_orig Heq_c2 Heq_st_mid Heq_st2) as IH2.
    eapply Original.LF_DOT_Imp.LF.Imp.E_Seq.
    + apply sinhabitant. exact IH1.
    + apply sinhabitant. exact IH2.
  - (* E_IfTrue *)
    destruct c_orig; try discriminate.
    injection Heq_c as Heq_b Heq_c1 Heq_c2.
    apply sinhabits.
    match goal with | H : Imported.Corelib_Init_Logic_eq _ _ _ |- _ => rename H into Hcond end.
    rename H into Heval.
    apply imported_eq_to_eq in Hcond.
    rewrite Heq_st1 in Hcond.
    rewrite Heq_b in Hcond.
    pose proof (beval_compat st_orig b0) as Hcompat.
    symmetry in Hcompat.
    rewrite Hcompat in Hcond.
    unfold bool_to_mybool in Hcond. destruct (Original.LF_DOT_Imp.LF.Imp.beval st_orig b0) eqn:Eb0; try discriminate.
    specialize (IH c1 st st' Heval c_orig1 st_orig st_fin_orig Heq_c1 Heq_st1 Heq_st2).
    apply Original.LF_DOT_Imp.LF.Imp.E_IfTrue.
    + exact Eb0.
    + apply sinhabitant. exact IH.
  - (* E_IfFalse *)
    destruct c_orig; try discriminate.
    injection Heq_c as Heq_b Heq_c1 Heq_c2.
    apply sinhabits.
    match goal with | H : Imported.Corelib_Init_Logic_eq _ _ _ |- _ => rename H into Hcond end.
    rename H into Heval.
    apply imported_eq_to_eq in Hcond.
    rewrite Heq_st1 in Hcond.
    rewrite Heq_b in Hcond.
    pose proof (beval_compat st_orig b0) as Hcompat.
    symmetry in Hcompat.
    rewrite Hcompat in Hcond.
    unfold bool_to_mybool in Hcond. destruct (Original.LF_DOT_Imp.LF.Imp.beval st_orig b0) eqn:Eb0; try discriminate.
    specialize (IH c2 st st' Heval c_orig2 st_orig st_fin_orig Heq_c2 Heq_st1 Heq_st2).
    apply Original.LF_DOT_Imp.LF.Imp.E_IfFalse.
    + exact Eb0.
    + apply sinhabitant. exact IH.
  - (* E_WhileFalse *)
    destruct c_orig; try discriminate.
    injection Heq_c as Heq_b Heq_c.
    apply sinhabits.
    match goal with | H : Imported.Corelib_Init_Logic_eq _ _ _ |- _ => rename H into Hcond end.
    apply imported_eq_to_eq in Hcond.
    rewrite Heq_st1 in Hcond.
    rewrite Heq_b in Hcond.
    pose proof (beval_compat st_orig b0) as Hcompat.
    symmetry in Hcompat.
    rewrite Hcompat in Hcond.
    unfold bool_to_mybool in Hcond. destruct (Original.LF_DOT_Imp.LF.Imp.beval st_orig b0) eqn:Eb0; try discriminate.
    rewrite Heq_st1 in Heq_st2.
    apply state_to_imported_inj in Heq_st2.
    rewrite <- Heq_st2.
    apply Original.LF_DOT_Imp.LF.Imp.E_WhileFalse.
    exact Eb0.
  - (* E_WhileTrue *)
    destruct c_orig; try discriminate.
    injection Heq_c as Heq_b Heq_c.
    apply sinhabits.
    pose (st_mid := fun x => from nat_iso (st' (to String_string_iso x))).
    assert (Heq_st_mid: state_to_imported st_mid = st').
    { apply eq_of_seq. apply functional_extensionality. intro x'.
      unfold st_mid, state_to_imported.
      eapply IsoEq.eq_trans.
      - apply to_from.
      - apply f_equal. apply to_from. }
    symmetry in Heq_st_mid.
    match goal with | H : Imported.Corelib_Init_Logic_eq _ _ _ |- _ => rename H into Hcond end.
    rename H into Heval.
    apply imported_eq_to_eq in Hcond.
    rewrite Heq_st1 in Hcond.
    rewrite Heq_b in Hcond.
    pose proof (beval_compat st_orig b0) as Hcompat.
    symmetry in Hcompat.
    rewrite Hcompat in Hcond.
    unfold bool_to_mybool in Hcond. destruct (Original.LF_DOT_Imp.LF.Imp.beval st_orig b0) eqn:Eb0; try discriminate.
    specialize (IH c st st' Heval c_orig st_orig st_mid Heq_c Heq_st1 Heq_st_mid) as IH1.
    rename H0 into Heval_while.
    (* Apply IH to the recursive while loop *)
    assert (Heq_while: com_to_imported (Original.LF_DOT_Imp.LF.Imp.CWhile b0 c_orig) =
                       Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b c).
    { simpl. f_equal; [symmetry; exact Heq_b | symmetry; exact Heq_c]. }
    symmetry in Heq_while.
    specialize (IH (Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b c) st' st'' Heval_while
                    (Original.LF_DOT_Imp.LF.Imp.CWhile b0 c_orig) st_mid st_fin_orig
                    Heq_while Heq_st_mid Heq_st2) as IH2.
    eapply Original.LF_DOT_Imp.LF.Imp.E_WhileTrue.
    + exact Eb0.
    + apply sinhabitant. exact IH1.
    + apply sinhabitant. exact IH2.
Qed.

(* Forward conversion *)
Lemma ceval_to_imported :
  forall c st st',
    Original.LF_DOT_Imp.LF.Imp.ceval c st st' ->
    Imported.Original_LF__DOT__Imp_LF_Imp_ceval (com_to_imported c) (state_to_imported st) (state_to_imported st').
Proof.
  fix IH 4.
  intros c st st' H.
  remember c as c0 eqn:Hc.
  destruct H.
  - apply Imported.Original_LF__DOT__Imp_LF_Imp_ceval_E_Skip.
  - rewrite t_update_compat.
    apply Imported.Original_LF__DOT__Imp_LF_Imp_ceval_E_Asgn.
    apply eq_to_imported_eq.
    rewrite <- aeval_compat. f_equal. exact H.
  - eapply Imported.Original_LF__DOT__Imp_LF_Imp_ceval_E_Seq; [apply IH; exact H | apply IH; exact H0].
  - apply Imported.Original_LF__DOT__Imp_LF_Imp_ceval_E_IfTrue.
    + apply eq_to_imported_eq.
      rewrite <- beval_compat.
      replace (Original.LF_DOT_Imp.LF.Imp.beval st b) with true.
      reflexivity.
    + apply IH. exact H0.
  - apply Imported.Original_LF__DOT__Imp_LF_Imp_ceval_E_IfFalse.
    + apply eq_to_imported_eq.
      rewrite <- beval_compat.
      replace (Original.LF_DOT_Imp.LF.Imp.beval st b) with false.
      reflexivity.
    + apply IH. exact H0.
  - apply Imported.Original_LF__DOT__Imp_LF_Imp_ceval_E_WhileFalse.
    apply eq_to_imported_eq.
    rewrite <- beval_compat.
    replace (Original.LF_DOT_Imp.LF.Imp.beval st b) with false.
    reflexivity.
  - eapply Imported.Original_LF__DOT__Imp_LF_Imp_ceval_E_WhileTrue.
    + apply eq_to_imported_eq. rewrite <- beval_compat.
      replace (Original.LF_DOT_Imp.LF.Imp.beval st b) with true.
      reflexivity.
    + apply IH. exact H0.
    + specialize (IH c).
      rewrite <- Hc in IH.
      apply IH.
      exact H1.
Qed.

(* Build the isomorphism using SInhabited *)
Instance Original_LF__DOT__Imp_LF_Imp_ceval_iso : (forall (x1 : Original.LF_DOT_Imp.LF.Imp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_com)
     (_ : @rel_iso Original.LF_DOT_Imp.LF.Imp.com imported_Original_LF__DOT__Imp_LF_Imp_com Original_LF__DOT__Imp_LF_Imp_com_iso x1 x2) (x3 : Original.LF_DOT_Imp.LF.Imp.state)
     (x4 : forall _ : imported_String_string, imported_nat)
     (_ : forall (x5 : String.string) (x6 : imported_String_string) (_ : @rel_iso String.string imported_String_string String_string_iso x5 x6), @rel_iso nat imported_nat nat_iso (x3 x5) (x4 x6))
     (x5 : Original.LF_DOT_Imp.LF.Imp.state) (x6 : forall _ : imported_String_string, imported_nat)
     (_ : forall (x7 : String.string) (x8 : imported_String_string) (_ : @rel_iso String.string imported_String_string String_string_iso x7 x8), @rel_iso nat imported_nat nat_iso (x5 x7) (x6 x8)),
   Iso (Original.LF_DOT_Imp.LF.Imp.ceval x1 x3 x5) (imported_Original_LF__DOT__Imp_LF_Imp_ceval x2 x4 x6)).
Proof.
  intros c c' Hc st1 st1' Hst1 st2 st2' Hst2.
  destruct Hc as [Hc]. simpl in Hc.
  (* c' = com_to_imported c *)
  (* st1' and state_to_imported st1 should be extensionally equal *)
  (* Same for st2' and state_to_imported st2 *)
  
  (* Build the isomorphism directly *)
  unshelve eapply Build_Iso.
  - (* to: ceval c st1 st2 -> imported_ceval c' st1' st2' *)
    intro Heval.
    pose proof (@ceval_to_imported c st1 st2 Heval) as H.
    (* Rewrite using the equalities *)
    assert (Heq_c: com_to_imported c = c') by (apply eq_of_seq; exact Hc).
    assert (Heq_st1: state_to_imported st1 = st1').
    { apply eq_of_seq.
      apply functional_extensionality. intros x'.
      specialize (Hst1 (from String_string_iso x') x' (to_from String_string_iso x')).
      destruct Hst1 as [Hst1']. simpl in Hst1'.
      unfold state_to_imported.
      exact Hst1'. }
    assert (Heq_st2: state_to_imported st2 = st2').
    { apply eq_of_seq.
      apply functional_extensionality. intros x'.
      specialize (Hst2 (from String_string_iso x') x' (to_from String_string_iso x')).
      destruct Hst2 as [Hst2']. simpl in Hst2'.
      unfold state_to_imported.
      exact Hst2'. }
    rewrite <- Heq_c, <- Heq_st1, <- Heq_st2.
    exact H.
  - (* from: imported_ceval c' st1' st2' -> ceval c st1 st2 *)
    intro Heval'.
    assert (Heq_c: c' = com_to_imported c).
    { apply eq_of_seq. symmetry. exact Hc. }
    assert (Heq_st1: st1' = state_to_imported st1).
    { apply eq_of_seq.
      apply functional_extensionality. intros x'.
      specialize (Hst1 (from String_string_iso x') x' (to_from String_string_iso x')).
      destruct Hst1 as [Hst1']. simpl in Hst1'.
      unfold state_to_imported.
      symmetry. exact Hst1'. }
    assert (Heq_st2: st2' = state_to_imported st2).
    { apply eq_of_seq.
      apply functional_extensionality. intros x'.
      specialize (Hst2 (from String_string_iso x') x' (to_from String_string_iso x')).
      destruct Hst2 as [Hst2']. simpl in Hst2'.
      unfold state_to_imported.
      symmetry. exact Hst2'. }
    rewrite Heq_c, Heq_st1, Heq_st2 in Heval'.
    apply sinhabitant.
    eapply ceval_from_imported_to_sinhabited; try reflexivity.
    exact Heval'.
  - (* to_from *)
    intro x.
    (* x : imported_ceval c' st1' st2' which is SProp *)
    (* In SProp, all proofs are equal, so to (from x) = x holds *)
    apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intro x.
    (* x : ceval c st1 st2 which is Prop *)
    (* from (to x) should equal x *)
    (* Both from (to x) and x are proofs of the same Prop, so use proof irrelevance *)
    apply seq_of_eq.
    apply proof_irrelevance.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.ceval := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_ceval := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.ceval Original_LF__DOT__Imp_LF_Imp_ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.ceval Imported.Original_LF__DOT__Imp_LF_Imp_ceval Original_LF__DOT__Imp_LF_Imp_ceval_iso := {}.