From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
#[local] Set Printing Coercions.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__result__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com ->
  (imported_String_string -> imported_nat) -> imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result -> (imported_String_string -> imported_nat) -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval.

(* Helper: rel_iso for String_string_iso from mapped values *)
Lemma string_iso_rel : forall (s : String.string), rel_iso String_string_iso s (String_string_iso s).
Proof.
  intro s. constructor. apply IsomorphismDefinitions.eq_refl.
Defined.

Lemma string_iso_rel_from : forall (s' : imported_String_string), rel_iso String_string_iso (from String_string_iso s') s'.
Proof.
  intro s'. constructor. exact (to_from String_string_iso s').
Defined.

(* Helper: states that are related via the iso must be equal when we know they're the same in one direction *)
Lemma state_imported_eq : forall (st : Original.LF_DOT_Imp.LF.Imp.state) 
  (st1 st2 : imported_String_string -> imported_nat),
  (forall (s1 : String.string) (s2 : imported_String_string), rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st s1) (st1 s2)) ->
  (forall (s1 : String.string) (s2 : imported_String_string), rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st s1) (st2 s2)) ->
  st1 = st2.
Proof.
  intros st st1 st2 H1 H2.
  apply Stdlib.Logic.FunctionalExtensionality.functional_extensionality. intro s.
  pose proof (proj_rel_iso (H1 (from String_string_iso s) s (string_iso_rel_from s))) as e1.
  pose proof (proj_rel_iso (H2 (from String_string_iso s) s (string_iso_rel_from s))) as e2.
  simpl in e1, e2.
  apply eq_of_seq. exact (eq_trans (eq_sym e1) e2).
Defined.

Lemma state_original_eq : forall (st' : imported_String_string -> imported_nat)
  (st1 st2 : Original.LF_DOT_Imp.LF.Imp.state),
  (forall (s1 : String.string) (s2 : imported_String_string), rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st1 s1) (st' s2)) ->
  (forall (s1 : String.string) (s2 : imported_String_string), rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st2 s1) (st' s2)) ->
  st1 = st2.
Proof.
  intros st' st1 st2 H1 H2.
  apply Stdlib.Logic.FunctionalExtensionality.functional_extensionality. intro s.
  pose proof (proj_rel_iso (H1 s (String_string_iso s) (string_iso_rel s))) as e1.
  pose proof (proj_rel_iso (H2 s (String_string_iso s) (string_iso_rel s))) as e2.
  simpl in e1, e2.
  (* nat_to_imported (st1 s) = st' ... and nat_to_imported (st2 s) = st' ... *)
  pose proof (eq_of_seq (eq_trans e1 (eq_sym e2))) as Heq.
  apply (Logic.f_equal imported_to_nat) in Heq.
  pose proof (nat_roundtrip (st1 s)) as r1.
  pose proof (nat_roundtrip (st2 s)) as r2.
  congruence.
Defined.

(* Helper to convert state relation to equality *)
Lemma state_to_imported_eq : forall (st : Original.LF_DOT_Imp.LF.Imp.state) (st' : imported_String_string -> imported_nat),
  (forall (s1 : String.string) (s2 : imported_String_string), rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st s1) (st' s2)) ->
  st' = (fun s => nat_iso (st (from String_string_iso s))).
Proof.
  intros st st' Hrel.
  apply Stdlib.Logic.FunctionalExtensionality.functional_extensionality. intro s.
  pose proof (Hrel (from String_string_iso s) s (string_iso_rel_from s)) as Hnat.
  apply proj_rel_iso in Hnat. simpl in Hnat. apply eq_of_seq in Hnat. symmetry. exact Hnat.
Defined.

(* Forward: prove Original.ceval -> Imported.ceval when isomorphisms hold *)
Lemma ceval_forward : forall c1 c2 st1 st1' r1 r2 st2 st2',
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso c1 c2 ->
  (forall s1 s2, rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st1 s1) (st1' s2)) ->
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso r1 r2 ->
  (forall s1 s2, rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st2 s1) (st2' s2)) ->
  Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval c1 st1 r1 st2 ->
  imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c2 st1' r2 st2'.
Proof.
  intros c1 c2 st1 st1' r1 r2 st2 st2' Hc Hst1 Hr Hst2 Heval.
  destruct Heval. (* E_Skip: c1 = CSkip, r1 = SContinue, st1 = st2 (renamed st) *)
  (* Now we need: ceval c2 st1' r2 st2' *)
  (* From Hc: c2 = com_iso CSkip = imported_CSkip *)
  pose proof (proj_rel_iso Hc) as Hceq. simpl in Hceq.
  (* From Hr: r2 = result_iso SContinue = imported_SContinue *)
  pose proof (proj_rel_iso Hr) as Hreq. simpl in Hreq.
  (* From Hst1, Hst2 with st1=st2=st: st1' = st2' *)
  pose proof (state_imported_eq st st1' st2' Hst1 Hst2) as Hsteq.
  (* Convert to Logic.eq and substitute *)
  apply eq_of_seq in Hceq. apply eq_of_seq in Hreq.
  subst c2 r2. rewrite Hsteq.
  exact (Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_E_Skip st2').
Defined.

(* Backward helper: SInhabited version to handle SProp elimination *)
Lemma ceval_backward_SInh : forall c1 c2 st1 st1' r1 r2 st2 st2',
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso c1 c2 ->
  (forall s1 s2, rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st1 s1) (st1' s2)) ->
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso r1 r2 ->
  (forall s1 s2, rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st2 s1) (st2' s2)) ->
  imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c2 st1' r2 st2' ->
  SInhabited (Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval c1 st1 r1 st2).
Proof.
  intros c1 c2 st1 st1' r1 r2 st2 st2' Hc Hst1 Hr Hst2 Heval.
  destruct Heval. (* E_Skip: c2 = CSkip', r2 = SContinue', st' (st1'=st2') *)
  (* After destruct, st1' and st2' become the same variable (say st') *)
  (* Now we need SInhabited (ceval c1 st1 r1 st2) *)
  (* From Hc: com_iso c1 = CSkip' *)
  pose proof (proj_rel_iso Hc) as Hceq. simpl in Hceq.
  apply eq_of_seq in Hceq.
  (* From Hr: result_iso r1 = SContinue' *)
  pose proof (proj_rel_iso Hr) as Hreq. simpl in Hreq.
  apply eq_of_seq in Hreq.
  (* For states: st1 should equal st2 - now st1' = st2' = st *)
  pose proof (state_original_eq st st1 st2 Hst1 Hst2) as Hsteq.
  (* Derive c1 = CSkip *)
  assert (c1 = Original.LF_DOT_Imp.LF.Imp.BreakImp.CSkip) as Hc1eq.
  { destruct c1; simpl in Hceq; try discriminate; reflexivity. }
  (* Derive r1 = SContinue *)
  assert (r1 = Original.LF_DOT_Imp.LF.Imp.BreakImp.SContinue) as Hr1eq.
  { destruct r1; simpl in Hreq; try discriminate; reflexivity. }
  subst c1 r1.
  rewrite Hsteq.
  (* E_Skip st2 : ceval CSkip st2 SContinue st2 *)
  (* We need SInhabited (ceval CSkip st2 SContinue st2) *)
  exact (sinhabits (Original.LF_DOT_Imp.LF.Imp.BreakImp.E_Skip st2)).
Defined.

(* Backward: convert SInhabited proof to actual proof *)
Lemma ceval_backward : forall c1 c2 st1 st1' r1 r2 st2 st2',
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso c1 c2 ->
  (forall s1 s2, rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st1 s1) (st1' s2)) ->
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso r1 r2 ->
  (forall s1 s2, rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st2 s1) (st2' s2)) ->
  imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c2 st1' r2 st2' ->
  Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval c1 st1 r1 st2.
Proof.
  intros. apply sinhabitant. eapply ceval_backward_SInh; eassumption.
Defined.

Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso : forall (c1 : Original.LF_DOT_Imp.LF.Imp.BreakImp.com) (c2 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso c1 c2 ->
  forall (st1 : Original.LF_DOT_Imp.LF.Imp.state) (st1' : imported_String_string -> imported_nat),
  (forall (s1 : String.string) (s2 : imported_String_string), rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st1 s1) (st1' s2)) ->
  forall (r1 : Original.LF_DOT_Imp.LF.Imp.BreakImp.result) (r2 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result),
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso r1 r2 ->
  forall (st2 : Original.LF_DOT_Imp.LF.Imp.state) (st2' : imported_String_string -> imported_nat),
  (forall (s1 : String.string) (s2 : imported_String_string), rel_iso String_string_iso s1 s2 -> rel_iso nat_iso (st2 s1) (st2' s2)) ->
  Iso (Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval c1 st1 r1 st2) (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c2 st1' r2 st2').
Proof.
  intros c1 c2 Hc st1 st1' Hst1 r1 r2 Hr st2 st2' Hst2.
  unshelve eapply (@Build_Iso _ _
    (fun H => @ceval_forward c1 c2 st1 st1' r1 r2 st2 st2' Hc Hst1 Hr Hst2 H)
    (fun H => @ceval_backward c1 c2 st1 st1' r1 r2 st2 st2' Hc Hst1 Hr Hst2 H)
    _ _).
  - (* to_from: for all x : Imported.ceval (SProp), to (from x) = x *)
    intro x. apply IsomorphismDefinitions.eq_refl.
  - (* from_to: for all x : Original.ceval (Prop), from (to x) = x *)
    intro x. apply seq_of_peq_t. apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso := {}.
