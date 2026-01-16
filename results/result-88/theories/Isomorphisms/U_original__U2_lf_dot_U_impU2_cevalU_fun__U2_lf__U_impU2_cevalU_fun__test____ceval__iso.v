From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso Isomorphisms.option__iso Isomorphisms.prod__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU2_cevalU_fun__U2_lf__U_impU2_cevalU_fun__ceval____step__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_z__iso.

Definition imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval : (imported_String_string -> imported_nat) -> imported_Original_LF__DOT__Imp_LF_Imp_com -> imported_option (imported_prod (imported_prod imported_nat imported_nat) imported_nat) := Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval.

(* Helper lemmas *)
Lemma nat500_iso : rel_iso nat_iso 500%nat Imported.nat500.
Proof. constructor. simpl. apply IsomorphismDefinitions.eq_refl. Qed.

Lemma X_iso : rel_iso String_string_iso Original.LF_DOT_Imp.LF.Imp.X Imported.Original_LF__DOT__Imp_LF_Imp_X.
Proof. constructor. simpl. apply IsomorphismDefinitions.eq_refl. Qed.

Lemma Y_iso : rel_iso String_string_iso Original.LF_DOT_Imp.LF.Imp.Y Imported.Original_LF__DOT__Imp_LF_Imp_Y.
Proof. constructor. simpl. apply IsomorphismDefinitions.eq_refl. Qed.

Lemma Z_iso : rel_iso String_string_iso Original.LF_DOT_Imp.LF.Imp.Z Imported.Original_LF__DOT__Imp_LF_Imp_Z.
Proof. constructor. simpl. apply IsomorphismDefinitions.eq_refl. Qed.

Instance Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat),
  (forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.com) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x3 x4 ->
  rel_iso (option_iso (prod_iso (prod_iso nat_iso nat_iso) nat_iso)) (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.test_ceval x1 x3)
    (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval x2 x4).
Proof.
  intros x1 x2 Hstate x3 x4 Hcom.
  unfold Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.test_ceval.
  unfold imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval.
  unfold Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval.
  pose proof (Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso x1 x2 Hstate Hcom nat500_iso) as Hceval.
  destruct (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step x1 x3 500%nat) as [st|] eqn:Heq.
  - (* Some case *)
    destruct Hceval as [Hceval]. simpl in Hceval.
    apply eq_of_seq in Hceval. unfold option_to_imported in Hceval.
    unfold Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval_match_1.
    unfold Imported.option_casesOn.
    constructor. simpl. unfold option_to_imported.
    apply seq_of_eq. simpl. symmetry.
    pattern (Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step x2 x4 Imported.nat500).
    rewrite <- Hceval. simpl.
    pose proof X_iso as HX. pose proof Y_iso as HY. pose proof Z_iso as HZ.
    destruct HX as [HX]. destruct HY as [HY]. destruct HZ as [HZ].
    apply eq_of_seq in HX. apply eq_of_seq in HY. apply eq_of_seq in HZ.
    repeat f_equal; try (rewrite HX; reflexivity); try (rewrite HY; reflexivity); try (rewrite HZ; reflexivity).
  - (* None case *)
    destruct Hceval as [Hceval]. simpl in Hceval.
    apply eq_of_seq in Hceval. unfold option_to_imported in Hceval.
    unfold Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval_match_1.
    unfold Imported.option_casesOn.
    constructor. simpl. unfold option_to_imported.
    pattern (Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step x2 x4 Imported.nat500).
    rewrite <- Hceval. simpl.
    apply IsomorphismDefinitions.eq_refl.
Qed.

Instance: KnownConstant Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.test_ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.test_ceval Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.test_ceval Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval_iso := {}.
