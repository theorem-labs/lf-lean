From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__optionU_e__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__token__iso Isomorphisms.list__iso Isomorphisms.nat__iso Isomorphisms.prod__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__firstU_expect__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__expect__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__many__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parseU_identifier__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parseU_number__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp : imported_nat ->
  imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod imported_Original_LF__DOT__Imp_LF_Imp_aexp (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp.

Lemma rel_iso_nat_eq : forall x1 x2, rel_iso nat_iso x1 x2 -> x2 = nat_to_lean_nat x1.
Proof.
  intros x1 x2 H.
  destruct H as [H].
  (* unfold rel_iso in H. unfold nat_iso in H. simpl in H. *)
  apply eq_of_seq in H. symmetry. exact H.
Defined.

Definition AexpResultIso := Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso 
  (prod_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)).

Definition TokenListIso := list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso.

Record ParsersIso (n : nat) : Set := {
  primary_iso : WrapSProp (forall xs xs', rel_iso TokenListIso xs xs' ->
    rel_iso AexpResultIso (Original.LF_DOT_ImpParser.LF.ImpParser.parsePrimaryExp n xs)
                          (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp (nat_to_lean_nat n) xs'));
  product_iso : WrapSProp (forall xs xs', rel_iso TokenListIso xs xs' ->
    rel_iso AexpResultIso (Original.LF_DOT_ImpParser.LF.ImpParser.parseProductExp n xs)
                          (Imported.parseProductExp (nat_to_lean_nat n) xs'));
  sum_iso : WrapSProp (forall xs xs', rel_iso TokenListIso xs xs' ->
    rel_iso AexpResultIso (Original.LF_DOT_ImpParser.LF.ImpParser.parseSumExp n xs)
                          (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp (nat_to_lean_nat n) xs'))
}.

Definition bool_aexp_iso := prod_iso bool_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso.
Definition list_bool_aexp_iso := list_iso bool_aexp_iso.
Definition bool_aexp_result_iso := Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso
  (prod_iso bool_aexp_iso TokenListIso).

Lemma fold_left_aexp_compat : forall es e rest',
  IsomorphismDefinitions.eq
    (AexpResultIso (Original.LF_DOT_ImpParser.LF.ImpParser.SomeE
        (List.fold_left Original.LF_DOT_Imp.LF.Imp.AMult es e, rest')))
    (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_SomeE _
        (Imported.prod_mk _ _
              (Imported.fold_left_aexp Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMult (list_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso es) (Original_LF__DOT__Imp_LF_Imp_aexp_iso e))
          (TokenListIso rest'))).
Proof.
  intros es.
  induction es as [|a es' IHes].
  - intros. simpl. apply IsomorphismDefinitions.eq_refl.
  - intros. simpl. apply IHes.
Defined.

Lemma fold_left_sum_compat : forall es e,
  IsomorphismDefinitions.eq
  (Original_LF__DOT__Imp_LF_Imp_aexp_iso (List.fold_left (fun e0 term => match term with
                                           | (true, e') => Original.LF_DOT_Imp.LF.Imp.APlus e0 e'
                                           | (false, e') => Original.LF_DOT_Imp.LF.Imp.AMinus e0 e'
                                           end) es e))
  (Imported.fold_left_pair (fun e0 term => 
    match term with
    | Imported.prod_mk _ _ Imported.mybool_mytrue e' => Imported.Original_LF__DOT__Imp_LF_Imp_aexp_APlus e0 e'
    | Imported.prod_mk _ _ Imported.mybool_myfalse e' => Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMinus e0 e'
    end) (list_bool_aexp_iso es) (Original_LF__DOT__Imp_LF_Imp_aexp_iso e)).
Proof.
  induction es as [|[b a] es' IHes].
  - intro e. reflexivity.
  - intro e. simpl. destruct b; apply IHes.
Defined.

Definition try_or_sum_parser n := fun xs0 : list Original.LF_DOT_ImpParser.LF.ImpParser.token =>
  match Original.LF_DOT_ImpParser.LF.ImpParser.firstExpect 
          (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString)
          (Original.LF_DOT_ImpParser.LF.ImpParser.parseProductExp n) xs0 with
  | Original.LF_DOT_ImpParser.LF.ImpParser.SomeE (e', rest') =>
      Original.LF_DOT_ImpParser.LF.ImpParser.SomeE ((true, e'), rest')
  | Original.LF_DOT_ImpParser.LF.ImpParser.NoneE _ =>
      match Original.LF_DOT_ImpParser.LF.ImpParser.firstExpect 
              (String.String (Ascii.Ascii true false true true false true false false) String.EmptyString)
              (Original.LF_DOT_ImpParser.LF.ImpParser.parseProductExp n) xs0 with
      | Original.LF_DOT_ImpParser.LF.ImpParser.SomeE (e', rest') =>
          Original.LF_DOT_ImpParser.LF.ImpParser.SomeE ((false, e'), rest')
      | Original.LF_DOT_ImpParser.LF.ImpParser.NoneE msg =>
          Original.LF_DOT_ImpParser.LF.ImpParser.NoneE msg
      end
  end.

Definition imported_try_or_sum_parser Pproduct := fun xs2 : Imported.list Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token =>
  match Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect 
          Imported.Original_LF__DOT__Imp_LF_Imp_aexp
          Imported.str_plus
          (Pproduct) xs2 with
  | Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_SomeE _ (Imported.prod_mk _ _ e' rest') =>
      Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_SomeE _ 
        (Imported.prod_mk _ _ (Imported.prod_mk _ _ Imported.mybool_mytrue e') rest')
  | Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_NoneE _ _ =>
      match Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect
              Imported.Original_LF__DOT__Imp_LF_Imp_aexp
              Imported.str_minus
              Pproduct xs2 with
      | Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_SomeE _ (Imported.prod_mk _ _ e' rest') =>
          Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_SomeE _
            (Imported.prod_mk _ _ (Imported.prod_mk _ _ Imported.mybool_myfalse e') rest')
      | Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_NoneE _ msg =>
          Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_NoneE _ msg
      end
  end.

Lemma try_or_sum_parser_compat : forall n xs (Pproduct : Imported.list Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token -> Imported.AexpParseResult),
  (forall xs' xs'',
    rel_iso TokenListIso xs' xs'' ->
    rel_iso AexpResultIso (Original.LF_DOT_ImpParser.LF.ImpParser.parseProductExp n xs') (Pproduct xs'')) ->
  IsomorphismDefinitions.eq
    (bool_aexp_result_iso (try_or_sum_parser n xs))
    (imported_try_or_sum_parser Pproduct (TokenListIso xs)).
Proof.
  intros n xs Pproduct IH_product.
  Import Original.LF_DOT_ImpParser.LF.ImpParser Strings.String.
  unfold try_or_sum_parser.
  unfold imported_try_or_sum_parser.
  pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "+" Imported.str_plus (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseProductExp n) _ IH_product xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hfirst.
  destruct Hfirst as [Hfirst].
  destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
  - cbn -[list_iso] in Hfirst.
    destruct x.
    inversion Hfirst.
    subst.
    clear Hfirst.
    reflexivity.
  - clear Hfirst.
    pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "-" Imported.str_minus (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseProductExp n) _ IH_product xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hfirst.
    destruct Hfirst as [Hfirst].
    destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
    cbn -[list_iso] in Hfirst.
    destruct x.
    inversion Hfirst.
    subst.
    clear Hfirst.
    reflexivity.
Defined.

(* The proof that original parsers relate to aux functions *)
(* Use fix to construct the proof by strong recursion on n *)
Definition parsers_joint_iso : forall n, ParsersIso n.
Proof.
  Import Original.LF_DOT_ImpParser.LF.ImpParser Strings.String.
  fix IHn 1.
  intro n; destruct n as [| n'].
  - (* Base case: n = 0 - all three return NoneE "Too many recursive calls" *)
    constructor; apply wrap_sprop; intros xs xs' Hlist; constructor; reflexivity.
  - (* Inductive case: n = S n' *)
    destruct (IHn n') as [IH_primary IH_product IH_sum].
    constructor; apply wrap_sprop; intros xs xs' Hlist.
    + (* parsePrimaryExp (S n') *)
      destruct Hlist as [Hlist]. destruct Hlist.
      constructor.
      apply unwrap_sprop in IH_sum.
      pose (Imported.parsePrimaryExp_succ (nat_to_lean_nat n') (TokenListIso xs)).
      match type of e with
      | ?eq _ ?rhs => transitivity rhs
      end.
      2: { destruct e. constructor. }
      clear e.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp in IH_primary.
      unfold Imported.parseProductExp in IH_product.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp in IH_sum.
      destruct Imported.aexpParsers as [Pprimary [Pproduct Psum]].
      unfold Imported.aexpParsers_match_5 in *.
      unfold Imported.Prod_casesOn_inst6 in *.
      unfold Imported.Prod_inst3_recl in *.
      unfold Imported.aexpParsers_match_3 in *.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn in *.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl in *.
      cbn [parsePrimaryExp].
      pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs (TokenListIso xs) (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hident.
      destruct Hident as [Hident].
      destruct parseIdentifier, Imported.parseIdentifier; try now inversion Hident.
      * cbn -[list_iso] in Hident.
        destruct x.
        Opaque list_iso.
        inversion Hident.
        subst.
        clear Hident.
        reflexivity.
      * inversion Hident. subst. clear Hident.
        unfold Imported.aexpParsers_match_2.
        unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
        unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
        pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseNumber_iso xs (TokenListIso xs) (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hnumber.
        destruct Hnumber as [Hnumber].
        destruct parseNumber, Imported.parseNumber; try now inversion Hnumber.
        -- cbn in Hnumber.
           destruct x.
           inversion Hnumber.
           subst.
           clear Hnumber.
           reflexivity.
        -- inversion Hnumber. subst. clear Hnumber.
           unfold Imported.parseSumExp_body_match_1.
           unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
           unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
           pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "(" Imported.str_lparen (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseSumExp n') Psum _ xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hfirst.
           destruct Hfirst as [Hfirst].
           destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
           cbn in Hfirst.
           destruct x.
           inversion Hfirst.
           subst.
           clear Hfirst.
           unfold Imported.prod_casesOn.
           unfold Imported.prod_recl.
           unfold Imported.aexpParsers_match_1.
           unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
           unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
           pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso ")" Imported.str_rparen (Build_rel_iso IsomorphismDefinitions.eq_refl) l _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hexpect.
           destruct Hexpect as [Hexpect].
           destruct expect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect; try now inversion Hexpect.
           cbn in Hexpect.
           destruct x.
           inversion Hexpect.
           subst.
           clear Hexpect.
           reflexivity.
    + (* parseProductExp (S n') *)
      destruct Hlist as [Hlist]. destruct Hlist.
      constructor.
      apply unwrap_sprop in IH_primary.
      clear IH_product IH_sum.
      pose proof (Imported.parseProductExp_eq_succ (nat_to_lean_nat n') (TokenListIso xs)) as Hred.
      match type of Hred with
      | ?eq _ ?rhs => transitivity rhs
      end.
      2: { destruct Hred. constructor. }
      clear Hred.
      unfold Imported.aexpParsers_match_5.
      unfold Imported.Prod_casesOn_inst6.
      unfold Imported.Prod_inst3_recl.
      unfold Imported.parseSumExp_body_match_4.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
      cbn [parseProductExp].
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp in IH_primary.
      unfold Imported.aexpParsers_match_5 in IH_primary.
      unfold Imported.Prod_casesOn_inst6 in IH_primary.
      unfold Imported.Prod_inst3_recl in IH_primary.
      pose proof (IH_primary xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as IH1.
      destruct IH1 as [IH1].
      destruct Imported.aexpParsers as [Pprimary [Pproduct Psum]].
      destruct parsePrimaryExp, Pprimary; try now inversion IH1.
      cbn in IH1.
      destruct x.
      inversion IH1.
      subst.
      clear IH1.
      unfold Imported.prod_casesOn.
      unfold Imported.prod_recl.
      unfold Imported.aexpParsers_match_4.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
      assert (Hfirst_pre: forall l l', rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) l l' -> rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso))) (parsePrimaryExp n' l) (Pprimary l')). {
        intros ls ls' Hpre.
        destruct Hpre as [Hpre]. destruct Hpre.
        pose proof (IH_primary ls _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as IH2.
        unfold AexpResultIso in IH2.
        exact IH2.
      }
      pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "*" Imported.str_star (Build_rel_iso IsomorphismDefinitions.eq_refl) (parsePrimaryExp n') Pprimary Hfirst_pre) as Hfirst.
      clear Hfirst_pre.
      pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_many_iso _ _ _ (firstExpect "*" (parsePrimaryExp n')) _ Hfirst n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl) l _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hmany.
      clear Hfirst.
      destruct Hmany as [Hmany].
      destruct many, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many; try now inversion Hmany.
      cbn in Hmany.
      destruct x.
      inversion Hmany.
      subst.
      clear Hmany.
      unfold Imported.prod_casesOn.
      unfold Imported.prod_recl.
      pose proof (fold_left_aexp_compat l0 a l1) as Hfold.
      apply (eq_trans Hfold).
      reflexivity.
    + (* parseSumExp (S n') *)
      destruct Hlist as [Hlist]. destruct Hlist.
      constructor.
      apply unwrap_sprop in IH_product.
      clear IH_primary IH_sum.
      pose proof (Imported.parseSumExp_eq_succ (nat_to_lean_nat n') (TokenListIso xs)) as Hred.
      match type of Hred with
      | ?eq _ ?rhs => transitivity rhs
      end.
      2: { destruct Hred. constructor. }
      clear Hred.
      unfold Imported.aexpParsers_match_5.
      unfold Imported.Prod_casesOn_inst6.
      unfold Imported.Prod_inst3_recl.
      unfold Imported.parseSumExp_body_match_4.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
      cbn. 
      unfold Imported.parseProductExp in IH_product.
      unfold Imported.aexpParsers_match_5 in IH_product.
      unfold Imported.Prod_casesOn_inst6 in IH_product.
      unfold Imported.Prod_inst3_recl in IH_product.
      destruct Imported.aexpParsers as [Pprimary [Pproduct Psum]].
      pose proof (IH_product xs (TokenListIso xs) (Build_rel_iso IsomorphismDefinitions.eq_refl)) as IH1.
      destruct IH1 as [IH1].
      destruct parseProductExp, Pproduct; try now inversion IH1.
      cbn in IH1.
      destruct x.
      inversion IH1.
      subst.
      clear IH1.
      unfold Imported.prod_casesOn.
      unfold Imported.prod_recl.
      unfold Imported.parseSumExp_body_match_3.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
      match goal with
      | [ |- _ match ' _ <- many ?res _ _;; _ with _ => _ end _ ] =>
        replace res with (try_or_sum_parser n')
      end.
      2: {
        apply Logic.FunctionalExtensionality.functional_extensionality.
        intro ls.
        unfold try_or_sum_parser.
        destruct (firstExpect "+" (parseProductExp n') ls).
        - destruct x. reflexivity.
        - destruct (firstExpect "-" (parseProductExp n') ls); reflexivity.
      }
      match goal with
      | [ |- _ _ match _ _ ?res _ _ with _ => _ end ] =>
        replace res with (imported_try_or_sum_parser Pproduct)
      end.
      2: {
        apply Logic.FunctionalExtensionality.functional_extensionality.
        intro ls.
        unfold Imported.parseSumExp_body_match_1.
        unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
        unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
        unfold imported_try_or_sum_parser.
        destruct (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Imported.Original_LF__DOT__Imp_LF_Imp_aexp Imported.str_plus Pproduct ls).
        - reflexivity.
        - destruct (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Imported.Original_LF__DOT__Imp_LF_Imp_aexp Imported.str_minus Pproduct ls); reflexivity.
      }
      assert (Hmany_pre: (forall l l', rel_iso (TokenListIso) l l' -> rel_iso bool_aexp_result_iso (try_or_sum_parser n' l) (imported_try_or_sum_parser Pproduct l'))). {
        intros ls ls' Hpre.
        destruct Hpre as [Hpre]. destruct Hpre.
        pose proof (try_or_sum_parser_compat n' ls Pproduct IH_product) as Hparser.
        constructor.
        exact Hparser.
      }
      pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_many_iso _ _ _ (try_or_sum_parser n') (imported_try_or_sum_parser Pproduct) Hmany_pre n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl) l _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hmany.
      destruct Hmany as [Hmany].
      destruct many, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many; try now inversion Hmany.
      cbn in Hmany.
      destruct x.
      inversion Hmany.
      subst.
      clear Hmany.
      unfold Imported.prod_casesOn.
      unfold Imported.prod_recl.
      apply f_equal.
      apply f_equal2; try reflexivity.
      pose proof (fold_left_sum_compat l0 a) as Hfold.
      apply (eq_trans Hfold).
      reflexivity.
Defined.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x4 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x3 x4 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
    (Original.LF_DOT_ImpParser.LF.ImpParser.parsePrimaryExp x1 x3) (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp x2 x4).
Proof.
  intros x1 x2 Hnat x3 x4 Hlist.
  apply rel_iso_nat_eq in Hnat. subst x2.
  destruct (parsers_joint_iso x1) as [H1 _ _].
  apply (unwrap_sprop H1). exact Hlist.
Defined.

Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.parsePrimaryExp := {}.
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp := {}.
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.parsePrimaryExp Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.parsePrimaryExp Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp_iso := {}.
