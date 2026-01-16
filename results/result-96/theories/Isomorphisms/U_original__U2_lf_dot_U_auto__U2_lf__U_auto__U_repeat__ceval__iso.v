From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(*Typeclasses Opaque rel_iso.*) (* for speed *)
From Stdlib Require Import Arith.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aeval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__beval__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso.
From IsomorphismChecker Require Export Isomorphisms.bool__iso.

Definition imported_Original_LF__DOT__Auto_LF_Auto_Repeat_ceval : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com -> (imported_String_string -> imported_nat) -> (imported_String_string -> imported_nat) -> SProp := Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval.

Lemma rel_iso_to_eq : forall (A B : Type) (i : Iso A B) (x : A) (y : B),
  rel_iso i x y -> to i x = y.
Proof. intros. destruct H as [H]. destruct H. reflexivity. Qed.

Lemma seq_to_eq : forall (A : Type) (x y : A), IsomorphismDefinitions.eq x y -> x = y.
Proof. intros A x y H. destruct H. reflexivity. Qed.

Lemma Imported_Corelib_Init_Logic_eq_to_eq : forall (A : Type) (a b : A), Imported.Corelib_Init_Logic_eq A a b -> a = b.
Proof. intros A a b H. destruct H. reflexivity. Qed.

Definition state_to_imported (st : Original.LF_DOT_Imp.LF.Imp.state) : imported_String_string -> imported_nat :=
  fun s => to nat_iso (st (from String_string_iso s)).

Lemma state_rel : forall (st : Original.LF_DOT_Imp.LF.Imp.state)
    (x : String.string) (x' : imported_String_string),
  rel_iso String_string_iso x x' -> rel_iso nat_iso (st x) (state_to_imported st x').
Proof.
  intros st x x' Hxx'. destruct Hxx' as [Hxx']. unfold state_to_imported. constructor.
  pose proof (from_to String_string_iso x) as Hft.
  apply (eq_trans (IsoEq.f_equal (fun y => nat_iso (st y)) (eq_sym Hft))).
  do 3 apply IsoEq.f_equal.
  exact Hxx'.
Defined.

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
Defined.

(* aeval isomorphism gives us the translation we need *)
Lemma aeval_compat :
  forall (st : Original.LF_DOT_Imp.LF.Imp.state) (a : Original.LF_DOT_Imp.LF.Imp.aexp),
    to nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st a) =
    Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st) (aexp_to_imported a).
Proof.
  intros st a.
  pose proof (@Original_LF__DOT__Imp_LF_Imp_aeval_iso st (state_to_imported st) (state_rel st) a (aexp_to_imported a) IsomorphismDefinitions.eq_refl) as Haeval.
  destruct Haeval as [Haeval].
  apply eq_of_seq in Haeval.
  exact Haeval.
Defined.

Lemma beval_translate_true : forall (st : Original.LF_DOT_Imp.LF.Imp.state)
  (b : Original.LF_DOT_Imp.LF.Imp.bexp),
  Original.LF_DOT_Imp.LF.Imp.beval st b = true ->
  IsomorphismDefinitions.eq
    (Imported.Original_LF__DOT__Imp_LF_Imp_beval (state_to_imported st) (bexp_to_imported b))
    Imported.mybool_mytrue.
Proof.
  intros st b Hb.
  pose proof (@Original_LF__DOT__Imp_LF_Imp_beval_iso st (state_to_imported st) (state_rel st)
               b (bexp_to_imported b) IsomorphismDefinitions.eq_refl) as H.
  destruct H as [H]. simpl in H. rewrite Hb in H.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_beval in H.
  apply eq_sym. exact H.
Defined.

Lemma beval_translate_false : forall (st : Original.LF_DOT_Imp.LF.Imp.state)
  (b : Original.LF_DOT_Imp.LF.Imp.bexp),
  Original.LF_DOT_Imp.LF.Imp.beval st b = false ->
  IsomorphismDefinitions.eq
    (Imported.Original_LF__DOT__Imp_LF_Imp_beval (state_to_imported st) (bexp_to_imported b))
    Imported.mybool_myfalse.
Proof.
  intros st b Hb.
  pose proof (@Original_LF__DOT__Imp_LF_Imp_beval_iso st (state_to_imported st) (state_rel st)
               b (bexp_to_imported b) IsomorphismDefinitions.eq_refl) as H.
  destruct H as [H]. simpl in H. rewrite Hb in H.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_beval in H.
  apply eq_sym. exact H.
Defined.

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
Defined.

Lemma t_update_translate : forall (st : Original.LF_DOT_Imp.LF.Imp.state)
  (x : String.string) (n : nat),
  state_to_imported (Original.LF_DOT_Maps.LF.Maps.t_update st x n) =
  Imported.Original_LF__DOT__Maps_LF_Maps_t__update Imported.nat (state_to_imported st)
    (to String_string_iso x) (to nat_iso n).
Proof.
  intros st x n.
  apply seq_to_eq. apply functional_extensionality.
  intros s.
  unfold state_to_imported.
  unfold Original.LF_DOT_Maps.LF.Maps.t_update.
  unfold Imported.Original_LF__DOT__Maps_LF_Maps_t__update.
  destruct (String.eqb x (from String_string_iso s)) eqn:E.
  - (* Equal case *)
    apply String.eqb_eq in E.
    rewrite E. 
    replace (String_string_iso (from String_string_iso s)) with s by
    ( symmetry;
      apply eq_of_seq;
      apply (to_from String_string_iso) ).
    replace (Imported.String_eqb s s) with Imported.mybool_mytrue.
    + reflexivity.
    + pose proof (to_from String_string_iso s) as Htf.
      apply eq_of_seq in Htf.
      rewrite <- Htf.
      pose proof (string_eqb_compat_core (from String_string_iso s) (from String_string_iso s)) as Hcompat.
      apply eq_of_seq in Hcompat.
      rewrite String.eqb_refl in Hcompat.
      exact Hcompat.
  - (* Not equal case *)
    apply String.eqb_neq in E.
    (* Show Imported.String_eqb (to String_string_iso x) s = Imported.mybool_myfalse *)
    replace (Imported.String_eqb (String_string_iso x) s) with Imported.mybool_myfalse.
    + simpl. reflexivity.
    + symmetry.
      pose proof (to_from String_string_iso s) as Htf.
      apply eq_of_seq in Htf.
      rewrite <- Htf.
      pose proof (string_eqb_compat_core x (from String_string_iso s)) as Hcompat.
      apply eq_of_seq in Hcompat.
      assert (Hneq: String.eqb x (from String_string_iso s) = false).
      { apply String.eqb_neq. exact E. }
      rewrite Hneq in Hcompat.
      symmetry.
      exact Hcompat.
Defined.

(* Forward direction: Original ceval -> Imported ceval *)
Lemma ceval_to_imported : forall (cmd : Original.LF_DOT_Auto.LF.Auto.Repeat.com)
  (sta stb : Original.LF_DOT_Imp.LF.Imp.state),
  Original.LF_DOT_Auto.LF.Auto.Repeat.ceval cmd sta stb ->
  Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval 
    (com_to_imported cmd)
    (state_to_imported sta)
    (state_to_imported stb).
Proof.
  fix IH 4.
  intros c sta stb H.
  destruct H as [st | st a n x Heq | c1 c2 st st' st'' H1 H2 | st st' b c1 c2 Hb H1 
                | st st' b c1 c2 Hb H1 | b st c Hb | st st' st'' b c Hb H1 H2
                | st st' b c H1 Hb | st st' st'' b c H1 Hb H2].
  - (* E_Skip *)
    simpl. apply Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_E_Skip.
  - (* E_Asgn *)
    simpl. rewrite t_update_translate.
    apply Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_E_Asgn.
    pose proof (aeval_compat st a) as Ha.
    rewrite Heq in Ha.
    rewrite Ha.
    reflexivity.
  - (* E_Seq *)
    simpl.
    apply (Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_E_Seq _ _ _ _ _ (IH _ _ _ H1) (IH _ _ _ H2)).
  - (* E_IfTrue *)
    simpl.
    apply Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_E_IfTrue.
    + pose proof (beval_translate_true st b Hb) as Hb'.
      apply eq_of_seq in Hb'.
      rewrite Hb'.
      reflexivity.
    + apply IH.
      exact H1.
  - (* E_IfFalse *)
    simpl.
    apply Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_E_IfFalse.
    + pose proof (beval_translate_false st b Hb) as Hb'.
      apply eq_of_seq in Hb'.
      rewrite Hb'.
      reflexivity.
    + apply IH.
      exact H1.
  - (* E_WhileFalse *)
    simpl.
    apply Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_E_WhileFalse.
    pose proof (beval_translate_false st b Hb) as Hb'.
    apply eq_of_seq in Hb'.
    rewrite Hb'.
    reflexivity.
  - (* E_WhileTrue *)
    simpl.
    eapply Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_E_WhileTrue.
    + pose proof (beval_translate_true st b Hb) as Hb'.
      apply eq_of_seq in Hb'.
      rewrite Hb'.
      reflexivity.
    + apply IH.
      exact H1.
    + apply (IH (Original.LF_DOT_Auto.LF.Auto.Repeat.CWhile b c) st' st'' H2).
  - (* E_RepeatEnd *)
    simpl.
    apply Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_E_RepeatEnd.
    + apply IH. exact H1.
    + pose proof (beval_translate_true st' b Hb) as Hb'.
      apply eq_of_seq in Hb'.
      rewrite Hb'.
      reflexivity.
  - (* E_RepeatLoop *)
    simpl.
    eapply Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_E_RepeatLoop.
    + apply IH. exact H1.
    + pose proof (beval_translate_false st' b Hb) as Hb'.
      apply eq_of_seq in Hb'.
      rewrite Hb'.
      reflexivity.
    + apply (IH (Original.LF_DOT_Auto.LF.Auto.Repeat.CRepeat c b) st' st'' H2).
Defined.

(* Backward direction: Imported ceval -> SInhabited (Original ceval) *)
Lemma ceval_from_imported :
  forall c' st' st'',
    Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval c' st' st'' ->
    forall c st st_fin,
      c' = com_to_imported c ->
      st' = state_to_imported st ->
      st'' = state_to_imported st_fin ->
      SInhabited (Original.LF_DOT_Auto.LF.Auto.Repeat.ceval c st st_fin).
Proof.
  fix IH 4.
  intros c st' st'' H.
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
    destruct H. simpl. apply Original.LF_DOT_Auto.LF.Auto.Repeat.E_Skip.
  - (* E_Asgn *)
    destruct c_orig; try discriminate.
    injection Heq_c as Heq_x Heq_a.
    apply sinhabits.
    match goal with H : Imported.Corelib_Init_Logic_eq _ _ _ |- _ => rename H into e end.
    apply Imported_Corelib_Init_Logic_eq_to_eq in e.
    rewrite Heq_a in e.
    pose proof (t_update_translate st_orig x0 (Original.LF_DOT_Imp.LF.Imp.aeval st_orig a0)) as Ht_update.
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
                | 0%nat => Imported.natO
                | S m => Imported.natS (f m)
                end) (Original.LF_DOT_Imp.LF.Imp.aeval st_orig a0)) with (nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval st_orig a0)) in H. *)
      exact (Logic.eq_sym H). }
    clear Hpt. rename Hpt_curried into Hpt.
    (* change ((fix f (s : String.string) : imported_String_string :=
                match s with
                | String.EmptyString => Imported.String_string_EmptyString
                | String.String c rest => Imported.String_string_String (ascii_to c) (f rest)
                end) x0) with (String_string_iso x0) in Heq_st2. *)
    pose proof (aeval_compat st_orig a0) as Haeval.
    rewrite Haeval in Hpt.
    pattern (Imported.Original_LF__DOT__Maps_LF_Maps_t__update imported_nat (state_to_imported st_orig) (String_string_iso x0) (Imported.Original_LF__DOT__Imp_LF_Imp_aeval (state_to_imported st_orig) (aexp_to_imported a0))) at 1 in Hpt.
    rewrite Heq_st2 in Hpt.
    apply Logic.FunctionalExtensionality.functional_extensionality in Hpt.
    apply state_to_imported_inj in Hpt.
    replace st_fin_orig with (Original.LF_DOT_Maps.LF.Maps.t_update st_orig x0 (Original.LF_DOT_Imp.LF.Imp.aeval st_orig a0)).
    apply Original.LF_DOT_Auto.LF.Auto.Repeat.E_Asgn.
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
    eapply Original.LF_DOT_Auto.LF.Auto.Repeat.E_Seq.
    + apply sinhabitant. exact IH1.
    + apply sinhabitant. exact IH2.
  - (* E_IfTrue *)
    destruct c_orig; try discriminate.
    injection Heq_c as Heq_b Heq_c1 Heq_c2.
    apply sinhabits.
    match goal with H : Imported.Corelib_Init_Logic_eq _ _ _ |- _ => rename H into Hcond end.
    rename H into Heval.
    apply Imported_Corelib_Init_Logic_eq_to_eq in Hcond.
    rewrite Heq_st1 in Hcond.
    rewrite Heq_b in Hcond.
    (* pose proof (Original_LF__DOT__Imp_LF_Imp_beval_iso) as Hbeval.
    destruct Hbeval as [Hbeval]. *)
    (* apply beval_compat in Hcond. *)
    pose proof (beval_compat st_orig b0) as Hcompat.
    symmetry in Hcompat.
    rewrite Hcompat in Hcond.
    unfold bool_to_mybool in Hcond.
    destruct (Original.LF_DOT_Imp.LF.Imp.beval st_orig b0) eqn:Eb0; try discriminate.
    specialize (IH c1 st st' Heval c_orig1 st_orig st_fin_orig Heq_c1 Heq_st1 Heq_st2).
    apply Original.LF_DOT_Auto.LF.Auto.Repeat.E_IfTrue.
    + exact Eb0.
    + apply sinhabitant. exact IH.
  - (* E_IfFalse *)
    destruct c_orig; try discriminate.
    injection Heq_c as Heq_b Heq_c1 Heq_c2.
    apply sinhabits.
    match goal with H : Imported.Corelib_Init_Logic_eq _ _ _ |- _ => rename H into Hcond end.
    rename H into Heval.
    apply Imported_Corelib_Init_Logic_eq_to_eq in Hcond.
    rewrite Heq_st1 in Hcond.
    rewrite Heq_b in Hcond.
    pose proof (beval_compat st_orig b0) as Hcompat.
    symmetry in Hcompat.
    rewrite Hcompat in Hcond.
    unfold bool_to_mybool in Hcond. destruct (Original.LF_DOT_Imp.LF.Imp.beval st_orig b0) eqn:Eb0; try discriminate.
    specialize (IH c2 st st' Heval c_orig2 st_orig st_fin_orig Heq_c2 Heq_st1 Heq_st2).
    apply Original.LF_DOT_Auto.LF.Auto.Repeat.E_IfFalse.
    + exact Eb0.
    + apply sinhabitant. exact IH.
  - (* E_WhileFalse *)
    destruct c_orig; try discriminate.
    injection Heq_c as Heq_b Heq_c.
    apply sinhabits.
    match goal with H : Imported.Corelib_Init_Logic_eq _ _ _ |- _ => rename H into Hcond end.
    apply Imported_Corelib_Init_Logic_eq_to_eq in Hcond.
    rewrite Heq_st1 in Hcond.
    rewrite Heq_b in Hcond.
    pose proof (beval_compat st_orig b0) as Hcompat.
    symmetry in Hcompat.
    rewrite Hcompat in Hcond.
    unfold bool_to_mybool in Hcond. destruct (Original.LF_DOT_Imp.LF.Imp.beval st_orig b0) eqn:Eb0; try discriminate.
    rewrite Heq_st1 in Heq_st2.
    apply state_to_imported_inj in Heq_st2.
    rewrite <- Heq_st2.
    apply Original.LF_DOT_Auto.LF.Auto.Repeat.E_WhileFalse.
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
    match goal with H : Imported.Corelib_Init_Logic_eq _ _ _ |- _ => rename H into Hcond end.
    rename H into Heval.
    apply Imported_Corelib_Init_Logic_eq_to_eq in Hcond.
    rewrite Heq_st1 in Hcond.
    rewrite Heq_b in Hcond.
    pose proof (beval_compat st_orig b0) as Hcompat.
    symmetry in Hcompat.
    rewrite Hcompat in Hcond.
    unfold bool_to_mybool in Hcond. destruct (Original.LF_DOT_Imp.LF.Imp.beval st_orig b0) eqn:Eb0; try discriminate.
    specialize (IH c st st' Heval c_orig st_orig st_mid Heq_c Heq_st1 Heq_st_mid) as IH1.
    rename H0 into Heval_while.
    assert (Heq_while: com_to_imported (Original.LF_DOT_Auto.LF.Auto.Repeat.CWhile b0 c_orig) =
                       Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CWhile b c).
    { simpl. f_equal; [symmetry; exact Heq_b | symmetry; exact Heq_c]. }
    symmetry in Heq_while.
    specialize (IH (Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CWhile b c) st' st'' Heval_while
                    (Original.LF_DOT_Auto.LF.Auto.Repeat.CWhile b0 c_orig) st_mid st_fin_orig
                    Heq_while Heq_st_mid Heq_st2) as IH2.
    eapply Original.LF_DOT_Auto.LF.Auto.Repeat.E_WhileTrue.
    + exact Eb0.
    + apply sinhabitant. exact IH1.
    + apply sinhabitant. exact IH2.
  - (* E_RepeatEnd *)
    destruct c_orig; try discriminate.
    injection Heq_c as Heq_c Heq_b.
    apply sinhabits.
    match goal with H : Imported.Corelib_Init_Logic_eq _ _ _ |- _ => rename H into Hcond end.
    pose (st_mid := fun x => from nat_iso (st' (to String_string_iso x))).
    assert (Heq_st_mid: state_to_imported st_mid = st').
    { apply eq_of_seq. apply functional_extensionality. intro x'.
      unfold st_mid, state_to_imported.
      eapply IsoEq.eq_trans.
      - apply to_from.
      - apply f_equal. apply to_from. }
    symmetry in Heq_st_mid.
    specialize (IH c st st' H c_orig st_orig st_mid Heq_c Heq_st1 Heq_st_mid).
    apply Imported_Corelib_Init_Logic_eq_to_eq in Hcond.
    rewrite Heq_st_mid in Hcond.
    rewrite Heq_b in Hcond.
    pose proof (beval_compat st_mid b0) as Hcompat.
    symmetry in Hcompat.
    rewrite Hcompat in Hcond.
    unfold bool_to_mybool in Hcond. destruct (Original.LF_DOT_Imp.LF.Imp.beval st_mid b0) eqn:Eb0; try discriminate.
    rewrite Heq_st_mid in Heq_st2.
    apply state_to_imported_inj in Heq_st2.
    rewrite <- Heq_st2.
    apply Original.LF_DOT_Auto.LF.Auto.Repeat.E_RepeatEnd.
    + apply sinhabitant. exact IH.
    + exact Eb0.
  - (* E_RepeatLoop *)
    destruct c_orig; try discriminate.
    injection Heq_c as Heq_c Heq_b.
    apply sinhabits.
    match goal with H : Imported.Corelib_Init_Logic_eq _ _ _ |- _ => rename H into Hcond end.
    pose (st_mid := fun x => from nat_iso (st' (to String_string_iso x))).
    assert (Heq_st_mid: state_to_imported st_mid = st').
    { apply eq_of_seq. apply functional_extensionality. intro x'.
      unfold st_mid, state_to_imported.
      eapply IsoEq.eq_trans.
      - apply to_from.
      - apply f_equal. apply to_from. }
    symmetry in Heq_st_mid.
    specialize (IH c st st' H c_orig st_orig st_mid Heq_c Heq_st1 Heq_st_mid) as IH1.
    apply Imported_Corelib_Init_Logic_eq_to_eq in Hcond.
    rewrite Heq_st_mid in Hcond.
    rewrite Heq_b in Hcond.
    pose proof (beval_compat st_mid b0) as Hcompat.
    symmetry in Hcompat.
    rewrite Hcompat in Hcond.
    unfold bool_to_mybool in Hcond. destruct (Original.LF_DOT_Imp.LF.Imp.beval st_mid b0) eqn:Eb0; try discriminate.
    rewrite Heq_c in H0.
    rewrite Heq_b in H0.
    rewrite Heq_st2 in H0.
    rewrite Heq_st_mid in H0.
    eapply Original.LF_DOT_Auto.LF.Auto.Repeat.E_RepeatLoop.
    + apply sinhabitant. exact IH1.
    + exact Eb0.
    + apply sinhabitant.
      apply (IH _ _ _ H0 (Original.LF_DOT_Auto.LF.Auto.Repeat.CRepeat c_orig b0) st_mid st_fin_orig).
      * simpl. reflexivity.
      * reflexivity.
      * reflexivity.
Defined.

(* State relation lemma *)
Lemma state_rel_to_eq : forall (st1 : Original.LF_DOT_Imp.LF.Imp.state) 
                               (st2 : imported_String_string -> imported_nat),
  (forall (x : String.string) (x' : imported_String_string), 
   rel_iso String_string_iso x x' -> rel_iso nat_iso (st1 x) (st2 x')) ->
  st2 = state_to_imported st1.
Proof.
  intros st1 st2 Hrel.
  apply seq_to_eq.
  apply functional_extensionality. intros s.
  unfold state_to_imported.
  pose proof (Hrel (from String_string_iso s) s) as H.
  assert (Hrel_s : rel_iso String_string_iso (from String_string_iso s) s).
  { constructor. apply (to_from String_string_iso). }
  specialize (H Hrel_s).
  destruct H as [H].
  apply eq_sym. exact H.
Defined.

Instance Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_iso : (forall (x1 : Original.LF_DOT_Auto.LF.Auto.Repeat.com) (x2 : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com)
     (_ : @rel_iso Original.LF_DOT_Auto.LF.Auto.Repeat.com imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso x1 x2)
     (x3 : Original.LF_DOT_Imp.LF.Imp.state) (x4 : forall _ : imported_String_string, imported_nat)
     (_ : forall (x5 : String.string) (x6 : imported_String_string) (_ : @rel_iso String.string imported_String_string String_string_iso x5 x6), @rel_iso nat imported_nat nat_iso (x3 x5) (x4 x6))
     (x5 : Original.LF_DOT_Imp.LF.Imp.state) (x6 : forall _ : imported_String_string, imported_nat)
     (_ : forall (x7 : String.string) (x8 : imported_String_string) (_ : @rel_iso String.string imported_String_string String_string_iso x7 x8), @rel_iso nat imported_nat nat_iso (x5 x7) (x6 x8)),
   Iso (Original.LF_DOT_Auto.LF.Auto.Repeat.ceval x1 x3 x5) (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_ceval x2 x4 x6)).
Proof.
  intros c1 c2 Hc st1 st2 Hst st1' st2' Hst'.
  unfold imported_Original_LF__DOT__Auto_LF_Auto_Repeat_ceval.
  apply rel_iso_to_eq in Hc.
  pose proof (state_rel_to_eq st1 st2 Hst) as Hst_eq.
  pose proof (state_rel_to_eq st1' st2' Hst') as Hst'_eq.
  rewrite <- Hc. rewrite Hst_eq. rewrite Hst'_eq.
  unshelve eapply Build_Iso.
  - (* to: Prop -> SProp *)
    intro Heval. exact (@ceval_to_imported c1 st1 st1' Heval).
  - (* from: SProp -> Prop *)
    intro H. apply sinhabitant.
    eapply ceval_from_imported; try reflexivity.
    exact H.
  - (* to_from: SProp proof irrelevance *)
    intro H. apply IsomorphismDefinitions.eq_refl.
  - (* from_to: uses proof irrelevance for Prop *)
    intro H.
    apply seq_of_eq.
    apply Logic.ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.Repeat.ceval := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.Repeat.ceval Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.Repeat.ceval Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_iso := {}.
