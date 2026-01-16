From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso Isomorphisms.option__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aeval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__beval__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso.

Definition imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step : (imported_String_string -> imported_nat) -> imported_Original_LF__DOT__Imp_LF_Imp_com -> imported_nat -> imported_option (imported_String_string -> imported_nat) := Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step.

Definition state_to_imported (st : Original.LF_DOT_Imp.LF.Imp.state) : imported_String_string -> imported_nat :=
  fun s => to nat_iso (st (from String_string_iso s)).

Definition option_state_to_imported (o : option Original.LF_DOT_Imp.LF.Imp.state) : imported_option (imported_String_string -> imported_nat) :=
  match o with
  | Some st => Imported.option_Some _ (state_to_imported st)
  | None => Imported.option_None _
  end.

(* Auxiliary ceval_step function that matches the imported structure *)
Fixpoint ceval_step_aux (st : imported_String_string -> imported_nat) 
                        (c : imported_Original_LF__DOT__Imp_LF_Imp_com) 
                        (i : imported_nat) 
                        : imported_option (imported_String_string -> imported_nat) :=
  match i with
  | Imported.nat_O => Imported.option_None _
  | Imported.nat_S i' =>
    match c with
    | Imported.Original_LF__DOT__Imp_LF_Imp_com_CSkip => 
        Imported.option_Some _ st
    | Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn x a =>
        Imported.option_Some _ (imported_Original_LF__DOT__Maps_LF_Maps_t__update st x (imported_Original_LF__DOT__Imp_LF_Imp_aeval st a))
    | Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq c1 c2 =>
        match ceval_step_aux st c1 i' with
        | Imported.option_Some _ st' => ceval_step_aux st' c2 i'
        | Imported.option_None _ => Imported.option_None _
        end
    | Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf b c1 c2 =>
        match imported_Original_LF__DOT__Imp_LF_Imp_beval st b with
        | Imported.mybool_mytrue => ceval_step_aux st c1 i'
        | Imported.mybool_myfalse => ceval_step_aux st c2 i'
        end
    | Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b c1 =>
        match imported_Original_LF__DOT__Imp_LF_Imp_beval st b with
        | Imported.mybool_mytrue =>
            match ceval_step_aux st c1 i' with
            | Imported.option_Some _ st' => ceval_step_aux st' c i'
            | Imported.option_None _ => Imported.option_None _
            end
        | Imported.mybool_myfalse => Imported.option_Some _ st
        end
    end
  end.

Lemma option_match_transport : forall (A B : Type) (f : A -> B) (default : B) 
                                       (o1 o2 : imported_option A),
  IsomorphismDefinitions.eq o1 o2 ->
  IsomorphismDefinitions.eq 
    (match o1 with Imported.option_Some _ x => f x | Imported.option_None _ => default end)
    (match o2 with Imported.option_Some _ x => f x | Imported.option_None _ => default end).
Proof.
  intros. apply (f_equal (fun o => match o with Imported.option_Some _ x => f x | Imported.option_None _ => default end) H).
Qed.

(* Lemma option_state_match_eq : forall (o1 o2 : imported_option imported_Original_LF__DOT__Imp_LF_Imp_state)
    (f1 f2 : imported_Original_LF__DOT__Imp_LF_Imp_state -> imported_option imported_Original_LF__DOT__Imp_LF_Imp_state)
    (n : imported_option imported_Original_LF__DOT__Imp_LF_Imp_state),
  IsomorphismDefinitions.eq o1 o2 ->
  (forall st, IsomorphismDefinitions.eq (f1 st) (f2 st)) ->
  IsomorphismDefinitions.eq
    (match o1 with Imported.option_Some _ st => f1 st | Imported.option_None _ => n end)
    (match o2 with Imported.option_Some _ st => f2 st | Imported.option_None _ => n end).
Proof.
  intros o1 o2 f1 f2 n Ho Hf.
  (* Convert SProp eq to Prop eq, then use standard destruct *)
  pose proof (eq_of_seq (proj_rel_iso Ho)) as Ho'.
  destruct Ho'.
  destruct o1 as [|a1].
  - (* None *)
    apply IsomorphismDefinitions.eq_refl.
  - (* Some a1 *)
    apply Hf.
Qed. *)

(* Lemma mybool_match_eq : forall (b : Imported.mybool)
    (t1 t2 f1 f2 : imported_option imported_Original_LF__DOT__Imp_LF_Imp_state),
  IsomorphismDefinitions.eq t1 t2 ->
  IsomorphismDefinitions.eq f1 f2 ->
  IsomorphismDefinitions.eq
    (match b with Imported.mybool_mytrue => t1 | Imported.mybool_myfalse => f1 end)
    (match b with Imported.mybool_mytrue => t2 | Imported.mybool_myfalse => f2 end).
Proof.
  intros b t1 t2 f1 f2 Ht Hf.
  destruct b.
  - exact Ht.
  - exact Hf.
Qed. *)

Lemma ceval_step_aux_eq : forall i st c,
  IsomorphismDefinitions.eq (ceval_step_aux st c i) (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st c i).
Proof.
  intros i st c.
  generalize dependent i.
  generalize dependent st.
  induction c; intros st i.
  - (* CSkip *)
    destruct i; simpl; reflexivity.
  - (* CAsgn *)
    destruct i; simpl; reflexivity.
  - (* CSeq c1 c2 *)
    destruct i.
    + reflexivity.
    + simpl.
      (* Change RHS to unfolded form - they're convertible *)
      change (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st (Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq c1 c2) (Imported.nat_S i))
        with (match imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st c1 i with
              | Imported.option_Some _ st' => imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st' c2 i
              | Imported.option_None _ => Imported.option_None _
              end).
      destruct (ceval_step_aux st c1 i) eqn:Ec1.
      * specialize (IHc1 st i).
        apply eq_of_seq in IHc1.
        rewrite <- IHc1.
        rewrite Ec1.
        reflexivity.
      * match goal with 
        | [ st0 : imported_String_string -> imported_nat |- _ ] => 
          rename st0 into st'; specialize (IHc2 st' i)
        end.
        apply eq_of_seq in IHc2.
        rewrite IHc2.
        specialize (IHc1 st i).
        apply eq_of_seq in IHc1.
        rewrite <- IHc1.
        rewrite Ec1.
        reflexivity.
  - (* CIf b c1 c2 *)
    match goal with | [ b0 : Imported.Original_LF__DOT__Imp_LF_Imp_bexp |- _ ] => rename b0 into b end.
    destruct i.
    + reflexivity.
    + simpl.
      (* Change RHS to unfolded form - they're convertible *)
      change (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st (Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf b c1 c2) (Imported.nat_S i))
        with (match imported_Original_LF__DOT__Imp_LF_Imp_beval st b with
              | Imported.mybool_mytrue => imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st c1 i
              | Imported.mybool_myfalse => imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st c2 i
              end).
      destruct (imported_Original_LF__DOT__Imp_LF_Imp_beval st b) eqn:Eb.
      * specialize (IHc1 st i).
        exact IHc1.
      * specialize (IHc2 st i).
        exact IHc2.
  - (* CWhile *)
    match goal with | [ b0 : Imported.Original_LF__DOT__Imp_LF_Imp_bexp |- _ ] => rename b0 into b end.
    generalize dependent st.
    induction i as [|i' IHi]; intros st.
    + reflexivity.
    + simpl.
      (* Change RHS to unfolded form *)
      change (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st (Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b c) (Imported.nat_S i'))
        with (match imported_Original_LF__DOT__Imp_LF_Imp_beval st b with
              | Imported.mybool_mytrue =>
                  match imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st c i' with
                  | Imported.option_Some _ st' => imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st' (Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b c) i'
                  | Imported.option_None _ => Imported.option_None _
                  end
              | Imported.mybool_myfalse => Imported.option_Some _ st
              end).
      destruct (imported_Original_LF__DOT__Imp_LF_Imp_beval st b).
      * specialize (IHc st i').
        apply eq_of_seq in IHc.
        rewrite IHc.
        destruct (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st c i').
        -- reflexivity.
        -- match goal with | [ st0 : imported_String_string -> imported_nat |- _ ] => rename st0 into st' end.
        apply IHi.
      * reflexivity.
Qed.

Lemma state_rel_to_eq : forall (st : Original.LF_DOT_Imp.LF.Imp.state) (st' : imported_String_string -> imported_nat),
  (forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (st x3) (st' x4)) ->
  forall x : imported_String_string, IsomorphismDefinitions.eq (state_to_imported st x) (st' x).
Proof.
  intros st st' Hst x.
  unfold state_to_imported.
  specialize (Hst (from String_string_iso x) x).
  assert (Hrel : rel_iso String_string_iso (from String_string_iso x) x).
  { constructor. apply (to_from String_string_iso). }
  specialize (Hst Hrel).
  pose proof (proj_rel_iso Hst) as Hst'. simpl in Hst'.
  exact Hst'.
Qed.

Lemma state_ext : forall (st1 st2 : imported_String_string -> imported_nat),
  (forall x, IsomorphismDefinitions.eq (st1 x) (st2 x)) ->
  IsomorphismDefinitions.eq st1 st2.
Proof.
  intros st1 st2 H.
  apply IsoEq.functional_extensionality_dep. exact H.
Qed.

Lemma state_to_imported_rel : forall (st : Original.LF_DOT_Imp.LF.Imp.state),
  forall (x : String.string) (x' : imported_String_string),
  rel_iso String_string_iso x x' -> rel_iso nat_iso (st x) (state_to_imported st x').
Proof.
  intros st x x' Hx.
  pose proof (proj_rel_iso Hx) as Hx'. simpl in Hx'.
  unfold state_to_imported.
  constructor; simpl.
  apply f_equal.
  apply (f_equal st).
  pose proof (from_to String_string_iso x) as Hft.
  apply eq_of_seq in Hx'.
  rewrite <- Hx'.
  apply eq_sym.
  exact Hft.
Qed.

(* Core isomorphism lemma - this relates the original ceval_step to ceval_step_aux
   via state_to_imported. The proof requires relating all the sub-operations
   (aeval, beval, t_update) which are proven in their respective iso files. *)
Lemma ceval_step_iso_core : forall (i : nat) (st : Original.LF_DOT_Imp.LF.Imp.state) (st' : imported_String_string -> imported_nat),
  (forall x, IsomorphismDefinitions.eq (state_to_imported st x) (st' x)) ->
  forall (c : Original.LF_DOT_Imp.LF.Imp.com),
  IsomorphismDefinitions.eq (option_state_to_imported (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step st c i))
                            (ceval_step_aux st' (com_to_imported c) (to nat_iso i)).
Proof.
  fix IH 5.
  intros i st st' Hst c.
  apply functional_extensionality in Hst.
  apply eq_of_seq in Hst.
  rewrite <- Hst.
  destruct c as [| x a | c1 c2 | b c1 c2 | b c1].
  - (* CSkip *)
    destruct i; reflexivity.
  - (* CAsgn *)
    destruct i.
    + reflexivity.
    + simpl.
      apply f_equal.
      apply state_ext. intros y.
      unfold state_to_imported at 1.
      unfold Original.LF_DOT_Maps.LF.Maps.t_update.
      unfold imported_Original_LF__DOT__Maps_LF_Maps_t__update.
      unfold Imported.Original_LF__DOT__Maps_LF_Maps_t__update.
      pose proof (string_eqb_compat_core x (from String_string_iso y)) as Heqb.
      pose proof (to_from String_string_iso y) as Htf.
      pose proof (f_equal (Imported.String_eqb (to String_string_iso x)) Htf) as Heqb2.
      pose proof (eq_trans Heqb Heqb2) as Hfinal.
      pose proof (aeval_iso_core st (state_to_imported st) (state_to_imported_rel st) a) as Haeval.
      pose proof (aeval_aux_eq (state_to_imported st) (aexp_to_imported a)) as Haeval_eq.
      destruct (String.eqb x (from String_string_iso y)) eqn:E.
      * assert (Imported.String_eqb (to String_string_iso x) y = Imported.mybool_mytrue) as E'.
        { apply eq_of_seq. apply (eq_trans (eq_sym Hfinal)). simpl. exact IsomorphismDefinitions.eq_refl. }
        unfold Imported.bool_negb_match_1, Imported.mybool_casesOn, Imported.mybool_recl.
        simpl in E'.
        rewrite E'.
        apply (eq_trans Haeval).
        exact Haeval_eq.
      * assert (Imported.String_eqb (to String_string_iso x) y = Imported.mybool_myfalse) as E'.
        { apply eq_of_seq. apply (eq_trans (eq_sym Hfinal)). simpl. exact IsomorphismDefinitions.eq_refl. }
        simpl in E'.
        rewrite E'.
        unfold Imported.bool_negb_match_1, Imported.mybool_casesOn. simpl.
        unfold state_to_imported.
        apply IsomorphismDefinitions.eq_refl.
  - (* CSeq c1 c2 *)
    destruct i.
    + reflexivity.
    + simpl.
      destruct (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step st c1 i) as [st1|] eqn:Ec1.
      * (* Some st1 *)
        specialize (IH i st (state_to_imported st) (fun x => IsomorphismDefinitions.eq_refl) c1) as IH1.
        apply eq_of_seq in IH1.
        rewrite Ec1 in IH1.
        simpl in IH1.
        rewrite <- IH1.
        apply (IH i st1 (state_to_imported st1) (fun x => IsomorphismDefinitions.eq_refl) c2).
      * (* None *)
        specialize (IH i st (state_to_imported st) (fun x => IsomorphismDefinitions.eq_refl) c1) as IH1.
        apply eq_of_seq in IH1.
        rewrite Ec1 in IH1.
        simpl in IH1.
        rewrite <- IH1.
        reflexivity.
  - (* CIf b c1 c2 *)
    destruct i.
    + reflexivity.
    + simpl.
      pose proof (beval_iso_core st (state_to_imported st) (state_to_imported_rel st) b) as Hb.
      pose proof (beval_aux_eq (state_to_imported st) (bexp_to_imported b)) as Hb'.
      apply eq_of_seq in Hb'.
      destruct (Original.LF_DOT_Imp.LF.Imp.beval st b) eqn:Eb.
      * (* true *)
        simpl in Hb.
        assert (imported_Original_LF__DOT__Imp_LF_Imp_beval (state_to_imported st) (bexp_to_imported b) = Imported.mybool_mytrue) as Eb'.
        { rewrite <- Hb'.
          apply eq_of_seq.
          apply eq_sym.
          exact Hb. }
        rewrite Eb'.
        simpl.
        apply (IH i st (state_to_imported st) (fun x => IsomorphismDefinitions.eq_refl) c1).
      * (* false *)
        simpl in Hb.
        assert (imported_Original_LF__DOT__Imp_LF_Imp_beval (state_to_imported st) (bexp_to_imported b) = Imported.mybool_myfalse) as Eb'.
        { rewrite <- Hb'.
          apply eq_of_seq.
          apply eq_sym.
          exact Hb. }
        rewrite Eb'.
        simpl.
        apply (IH i st (state_to_imported st) (fun x => IsomorphismDefinitions.eq_refl) c2).
  - (* CWhile b c1 *)
    revert st st' Hst.
    induction i as [|i' IHi]; intros st st' Hst.
    + reflexivity.
    + simpl.
      pose proof (beval_iso_core st (state_to_imported st) (state_to_imported_rel st) b) as Hb.
      pose proof (beval_aux_eq (state_to_imported st) (bexp_to_imported b)) as Hb'.
      apply eq_of_seq in Hb'.
      destruct (Original.LF_DOT_Imp.LF.Imp.beval st b) eqn:Eb.
      * (* true *)
        simpl in Hb.
        assert (imported_Original_LF__DOT__Imp_LF_Imp_beval (state_to_imported st) (bexp_to_imported b) = Imported.mybool_mytrue) as Eb'.
        { rewrite <- Hb'.
          apply eq_of_seq.
          apply eq_sym.
          exact Hb. }
        rewrite Eb'.
        simpl.
        destruct (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step st c1 i') as [st1|] eqn:Ec1.
        -- (* Some st1 *)
           specialize (IH i' st (state_to_imported st) (fun x => IsomorphismDefinitions.eq_refl) c1) as IHc.
           apply eq_of_seq in IHc.
           rewrite Ec1 in IHc.
           simpl in IHc.
           rewrite <- IHc.
           (* Now use IHi with st1 *)
           apply (IHi st1 (state_to_imported st1)).
           reflexivity.
        -- (* None *)
           specialize (IH i' st (state_to_imported st) (fun x => IsomorphismDefinitions.eq_refl) c1) as IHc.
           apply eq_of_seq in IHc.
           rewrite Ec1 in IHc.
           simpl in IHc.
           rewrite <- IHc.
           reflexivity.
      * (* false *)
        simpl in Hb.
        assert (imported_Original_LF__DOT__Imp_LF_Imp_beval (state_to_imported st) (bexp_to_imported b) = Imported.mybool_myfalse) as Eb'.
        { rewrite <- Hb'.
          apply eq_of_seq.
          apply eq_sym.
          exact Hb. }
        rewrite Eb'.
        simpl. reflexivity.
Qed.

Instance Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat),
  (forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.com) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x3 x4 ->
  forall (x5 : nat) (x6 : imported_nat),
  rel_iso nat_iso x5 x6 ->
  rel_iso (option_iso (IsoArrow String_string_iso nat_iso)) (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step x1 x3 x5)
    (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step x2 x4 x6).
Proof.
  intros st st' Hst c c' Hc i i' Hi.
  pose proof (proj_rel_iso Hc) as Hc_eq; simpl in Hc_eq.
  pose proof (proj_rel_iso Hi) as Hi_eq; simpl in Hi_eq.
  constructor; simpl.
  apply (eq_trans (ceval_step_iso_core i st st' (state_rel_to_eq st st' Hst) c)).
  apply (eq_trans (f_equal2 (fun c0 i0 => ceval_step_aux st' c0 i0) Hc Hi)).
  apply (ceval_step_aux_eq i' st' c').
Defined.

Instance: KnownConstant Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step := {}.
Instance: KnownConstant Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step := {}.
Instance: IsoStatementProofFor Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso := {}.
