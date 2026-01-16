From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import FunctionalExtensionality Arith Wf_nat.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aeval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__beval__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso.

Definition imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 : (imported_String_string -> imported_nat) -> imported_Original_LF__DOT__Imp_LF_Imp_com -> imported_nat -> imported_String_string -> imported_nat := Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2.

Definition state_to_imported (st : Original.LF_DOT_Imp.LF.Imp.state) : imported_String_string -> imported_nat :=
  fun s => to nat_iso (st (from String_string_iso s)).

(* Auxiliary ceval_step2 function that matches the imported structure *)
Fixpoint ceval_step2_aux (st : imported_String_string -> imported_nat) 
                        (c : imported_Original_LF__DOT__Imp_LF_Imp_com) 
                        (i : imported_nat) 
                        : imported_String_string -> imported_nat :=
  match i with
  | Imported.nat_O => imported_Original_LF__DOT__Imp_LF_Imp_empty__st
  | Imported.nat_S i' =>
    match c with
    | Imported.Original_LF__DOT__Imp_LF_Imp_com_CSkip => st
    | Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn x a =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update st x (aeval_aux st a)
    | Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq c1 c2 =>
        let st' := ceval_step2_aux st c1 i' in
        ceval_step2_aux st' c2 i'
    | Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf b c1 c2 =>
        match beval_aux st b with
        | Imported.mybool_mytrue => ceval_step2_aux st c1 i'
        | Imported.mybool_myfalse => ceval_step2_aux st c2 i'
        end
    | Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b c1 =>
        match beval_aux st b with
        | Imported.mybool_mytrue => 
            let st' := ceval_step2_aux st c1 i' in
            ceval_step2_aux st' (Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b c1) i'
        | Imported.mybool_myfalse => st
        end
    end
  end.

Lemma state_ext : forall (f g : imported_String_string -> imported_nat),
  (forall x, IsomorphismDefinitions.eq (f x) (g x)) ->
  IsomorphismDefinitions.eq f g.
Proof.
  intros f g H.
  apply seq_of_eq.
  apply functional_extensionality.
  intro x. apply eq_of_seq. apply H.
Qed.

Lemma state_to_imported_rel : forall (st : Original.LF_DOT_Imp.LF.Imp.state),
  forall (x : String.string) (x' : imported_String_string),
  rel_iso String_string_iso x x' -> rel_iso nat_iso (st x) (state_to_imported st x').
Proof.
  intros st x x' Hx.
  destruct Hx as [Hx].
  unfold state_to_imported.
  constructor.
  apply f_equal.
  apply (f_equal st).
  pose proof (from_to String_string_iso x) as Hft.
  apply eq_of_seq in Hx.
  rewrite <- Hx.
  apply eq_sym.
  exact Hft.
Qed.

Lemma state_rel_to_eq : forall (st : Original.LF_DOT_Imp.LF.Imp.state) (st' : imported_String_string -> imported_nat),
  (forall (x : String.string) (x' : imported_String_string), rel_iso String_string_iso x x' -> rel_iso nat_iso (st x) (st' x')) ->
  (forall x, IsomorphismDefinitions.eq (state_to_imported st x) (st' x)).
Proof.
  intros st st' H x.
  unfold state_to_imported.
  specialize (H (from String_string_iso x) x).
  pose proof (to_from String_string_iso x) as Htf.
  assert (Hri : rel_iso String_string_iso (from String_string_iso x) x) by (constructor; exact Htf).
  specialize (H Hri).
  destruct H as [H].
  exact H.
Qed.

(* Prove ceval_step2_aux equals imported *)
Lemma ceval_step2_aux_eq : forall i st c,
  IsomorphismDefinitions.eq (ceval_step2_aux st c i) (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 st c i).
Proof.
  intros i st c.
  generalize dependent i.
  generalize dependent st.
  induction c; intros st i.
  - (* CSkip *)
    destruct i; apply seq_of_eq; reflexivity.
  - (* CAsgn *)
    match goal with | [ s0 : Imported.String_string, a0 : Imported.Original_LF__DOT__Imp_LF_Imp_aexp |- _ ] => rename s0 into str; rename a0 into aexpr end.
    destruct i as [|i'].
    + apply seq_of_eq. reflexivity.
    + simpl.
      apply seq_of_eq.
      change (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 st (Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn str aexpr) (Imported.nat_S i'))
        with (imported_Original_LF__DOT__Maps_LF_Maps_t__update st str (imported_Original_LF__DOT__Imp_LF_Imp_aeval st aexpr)).
      f_equal.
      apply eq_of_seq. apply (aeval_aux_eq st aexpr).
  - (* CSeq c1 c2 *)
    destruct i as [|i'].
    + apply seq_of_eq. reflexivity.
    + simpl.
      change (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 st (Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq c1 c2) (Imported.nat_S i'))
        with (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 
                (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 st c1 i') 
                c2 i').
      pose proof (IHc1 st i') as IHc1'.
      apply eq_of_seq in IHc1'.
      pose proof (IHc2 (ceval_step2_aux st c1 i') i') as IHc2'.
      apply (eq_trans IHc2').
      rewrite IHc1'.
      apply IsomorphismDefinitions.eq_refl.
  - (* CIf b c1 c2 *)
    match goal with | [ b0 : Imported.Original_LF__DOT__Imp_LF_Imp_bexp |- _ ] => rename b0 into bexpr end.
    destruct i as [|i'].
    + apply seq_of_eq. reflexivity.
    + simpl.
      change (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 st (Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf bexpr c1 c2) (Imported.nat_S i'))
        with (match imported_Original_LF__DOT__Imp_LF_Imp_beval st bexpr with
              | Imported.mybool_mytrue => imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 st c1 i'
              | Imported.mybool_myfalse => imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 st c2 i'
              end).
      pose proof (beval_aux_eq st bexpr) as Hb.
      apply eq_of_seq in Hb.
      rewrite <- Hb.
      destruct (beval_aux st bexpr).
      * apply (IHc1 st i').
      * apply (IHc2 st i').
  - (* CWhile b c *)
    match goal with | [ b0 : Imported.Original_LF__DOT__Imp_LF_Imp_bexp |- _ ] => rename b0 into bexpr end.
    generalize dependent st.
    induction i as [|i' IHi]; intros st.
    + apply seq_of_eq. reflexivity.
    + simpl.
      change (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 st (Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile bexpr c) (Imported.nat_S i'))
        with (match imported_Original_LF__DOT__Imp_LF_Imp_beval st bexpr with
              | Imported.mybool_mytrue => imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 
                    (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 st c i') 
                    (Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile bexpr c) i'
              | Imported.mybool_myfalse => st
              end).
      pose proof (beval_aux_eq st bexpr) as Hb.
      apply eq_of_seq in Hb.
      rewrite <- Hb.
      destruct (beval_aux st bexpr).
      * pose proof (IHc st i') as IHc'.
        apply eq_of_seq in IHc'.
        pose proof (IHi (ceval_step2_aux st c i')) as IHwhile.
        apply (eq_trans IHwhile).
        rewrite IHc'.
        apply IsomorphismDefinitions.eq_refl.
      * apply IsomorphismDefinitions.eq_refl.
Qed.

(* Core isomorphism lemma - induction on i *)
Lemma ceval_step2_iso_core : forall (i : nat) (st : Original.LF_DOT_Imp.LF.Imp.state)
  (c : Original.LF_DOT_Imp.LF.Imp.com),
  IsomorphismDefinitions.eq 
    (state_to_imported (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step2 st c i))
    (ceval_step2_aux (state_to_imported st) (com_to_imported c) (to nat_iso i)).
Proof.
  intro i. induction i as [|i' IHi].
  - (* i = 0 *)
    intros st c. simpl.
    apply state_ext. intro y. unfold state_to_imported, imported_Original_LF__DOT__Imp_LF_Imp_empty__st.
    apply IsomorphismDefinitions.eq_refl.
  - (* i = S i' *)
    intros st c.
    destruct c as [| x a | c1 c2 | b c1 c2 | b c1].
    + (* CSkip *)
      simpl.
      apply state_ext. intro y. unfold state_to_imported. apply IsomorphismDefinitions.eq_refl.
    + (* CAsgn *)
      simpl.
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
      destruct (String.eqb x (from String_string_iso y)) eqn:E.
      * assert (Imported.String_eqb (to String_string_iso x) y = Imported.mybool_mytrue) as E'.
        { apply eq_of_seq. apply (eq_trans (eq_sym Hfinal)). simpl. exact IsomorphismDefinitions.eq_refl. }
        unfold Imported.bool_negb_match_1, Imported.mybool_casesOn, Imported.mybool_recl.
        simpl in E'.
        rewrite E'.
        exact Haeval.
      * assert (Imported.String_eqb (to String_string_iso x) y = Imported.mybool_myfalse) as E'.
        { apply eq_of_seq. apply (eq_trans (eq_sym Hfinal)). simpl. exact IsomorphismDefinitions.eq_refl. }
        simpl in E'.
        rewrite E'.
        unfold Imported.bool_negb_match_1, Imported.mybool_casesOn. simpl.
        unfold state_to_imported.
        apply IsomorphismDefinitions.eq_refl.
    + (* CSeq *)
      simpl.
      set (st1 := Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step2 st c1 i').
      (* Goal: state_to_imported (ceval_step2 st1 c2 i') = ceval_step2_aux (ceval_step2_aux st' c1' i') c2' i' *)
      (* where st' = state_to_imported st, c1' = com_to_imported c1, etc. *)
      (* IHi st1 c2 : state_to_imported (ceval_step2 st1 c2 i') = ceval_step2_aux (state_to_imported st1) c2' i' *)
      (* IHi st c1 : state_to_imported st1 = ceval_step2_aux st' c1' i' *)
      apply (eq_trans (IHi st1 c2)).
      apply (f_equal (fun st_mid => ceval_step2_aux st_mid (com_to_imported c2) (to nat_iso i'))).
      apply IHi.
    + (* CIf b c1 c2 *)
      simpl.
      pose proof (beval_iso_core st (state_to_imported st) (state_to_imported_rel st) b) as Hb.
      apply eq_of_seq in Hb.
      destruct (Original.LF_DOT_Imp.LF.Imp.beval st b) eqn:Eb;
      destruct (beval_aux (state_to_imported st) (bexp_to_imported b)) eqn:Eb';
      simpl in Hb.
      * (* true / mytrue *) apply (IHi st c1).
      * (* true / myfalse - contradiction *) congruence.
      * (* false / mytrue - contradiction *) congruence.
      * (* false / myfalse *) apply (IHi st c2).
    + (* CWhile b c1 *)
      simpl.
      pose proof (beval_iso_core st (state_to_imported st) (state_to_imported_rel st) b) as Hb.
      apply eq_of_seq in Hb.
      destruct (Original.LF_DOT_Imp.LF.Imp.beval st b) eqn:Eb;
      destruct (beval_aux (state_to_imported st) (bexp_to_imported b)) eqn:Eb';
      simpl in Hb.
      * (* true / mytrue *)
        set (st1 := Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step2 st c1 i').
        apply (eq_trans (IHi st1 (Original.LF_DOT_Imp.LF.Imp.CWhile b c1))).
        apply (f_equal (fun st_mid => ceval_step2_aux st_mid (com_to_imported (Original.LF_DOT_Imp.LF.Imp.CWhile b c1)) (to nat_iso i'))).
        apply IHi.
      * (* true / myfalse - contradiction *) congruence.
      * (* false / mytrue - contradiction *) congruence.
      * (* false / myfalse *)
        apply state_ext. intro y. apply IsomorphismDefinitions.eq_refl.
Qed.

Instance Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat),
  (forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.com) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x3 x4 ->
  forall (x5 : nat) (x6 : imported_nat),
  rel_iso nat_iso x5 x6 ->
  forall (x7 : String.string) (x8 : imported_String_string),
  rel_iso String_string_iso x7 x8 ->
  rel_iso nat_iso (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step2 x1 x3 x5 x7) (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 x2 x4 x6 x8).
Proof.
  intros st st' Hst c c' Hc i i' Hi s s' Hs.
  destruct Hc as [Hc].
  destruct Hi as [Hi].
  destruct Hs as [Hs].
  constructor.
  apply eq_of_seq in Hc.
  apply eq_of_seq in Hi.
  apply eq_of_seq in Hs.
  (* state_to_imported (ceval_step2 st c i) s' = nat_iso (ceval_step2 st c i (from s')) *)
  (* And from s' = from (to s) = s, so this equals nat_iso (ceval_step2 st c i s) *)
  assert (Hlhs : to nat_iso (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step2 st c i s) = 
                 state_to_imported (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step2 st c i) s').
  { unfold state_to_imported.
    rewrite <- Hs.
    f_equal. f_equal.
    apply eq_of_seq. apply eq_sym. apply (from_to String_string_iso s). }
  apply (eq_trans (seq_of_eq Hlhs)).
  (* Now apply the core lemma *)
  pose proof (ceval_step2_iso_core i st c) as Hcore.
  apply (eq_trans (f_equal (fun st_f => st_f s') Hcore)).
  (* Connect state_to_imported st to st' *)
  assert (Hst_eq : state_to_imported st = st').
  { apply functional_extensionality. intro x.
    unfold state_to_imported.
    assert (Hri : rel_iso String_string_iso (from String_string_iso x) x) by (constructor; exact (to_from String_string_iso x)).
    specialize (Hst (from String_string_iso x) x Hri).
    destruct Hst as [Hst].
    apply eq_of_seq in Hst.
    exact Hst. }
  apply (eq_trans (f_equal (fun st_f => st_f s') (f_equal (fun st0 => ceval_step2_aux st0 (com_to_imported c) (to nat_iso i)) (seq_of_eq Hst_eq)))).
  (* Now use aux eq *)
  pose proof (ceval_step2_aux_eq (to nat_iso i) st' (com_to_imported c)) as Haux.
  apply (eq_trans (f_equal (fun st_f => st_f s') Haux)).
  (* Finally, substitute c' and i' *)
  apply (f_equal2 (fun c0 i0 => imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 st' c0 i0 s') (seq_of_eq Hc) (seq_of_eq Hi)).
Defined.

Instance: KnownConstant Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step2 := {}.
Instance: KnownConstant Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step2 Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step2 Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2 Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step2_iso := {}.
