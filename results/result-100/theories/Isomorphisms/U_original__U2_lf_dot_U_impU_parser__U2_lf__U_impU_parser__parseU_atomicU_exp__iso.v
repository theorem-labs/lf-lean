From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import String.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__optionU_e__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__token__iso Isomorphisms.list__iso Isomorphisms.nat__iso Isomorphisms.prod__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__firstU_expect__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__expect__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__many__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parseU_primaryU_exp__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parseU2_aexp__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp : imported_nat ->
  imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod imported_Original_LF__DOT__Imp_LF_Imp_bexp (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp.

Definition BexpResultIso := Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso 
  (prod_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)).

(* Helper to extract parseAtomicExp from bexpParsers *)
Definition get_bexp_atomic_parser (n : Nat) :=
  Imported.bexpParsers_match_4
    (fun _ => Imported.list Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token -> Imported.BexpParseResult)
    (Imported.bexpParsers n)
    (fun parseAtomicExp _ => parseAtomicExp).

(* Helper to extract parseConjunctionExp from bexpParsers *)  
Definition get_bexp_conj_parser (n : Nat) :=
  Imported.bexpParsers_match_4
    (fun _ => Imported.list Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token -> Imported.BexpParseResult)
    (Imported.bexpParsers n)
    (fun _ parseConjunctionExp => parseConjunctionExp).

(* Key lemma: Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp equals get_bexp_atomic_parser *)
Lemma parseAtomicExp_eq_get :
  forall n xs,
    Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp n xs = get_bexp_atomic_parser n xs.
Proof.
  intros n xs.
  reflexivity.
Defined.

(* fold_left BAnd compatibility *)
Lemma fold_left_bexp_compat : forall es e,
  IsomorphismDefinitions.eq
  (Original_LF__DOT__Imp_LF_Imp_bexp_iso (List.fold_left Original.LF_DOT_Imp.LF.Imp.BAnd es e))
  (Imported.fold_left_bexp Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BAnd 
    (list_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso es) 
    (Original_LF__DOT__Imp_LF_Imp_bexp_iso e)).
Proof.
  induction es as [|a es' IHes].
  - intro e. reflexivity.
  - intro e. simpl. apply IHes.
Defined.

Definition imported_parser :=
  Imported.list Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  Imported.BexpParseResult.

(* The joint isomorphism record for bexp parsers *)
Record BexpJointIso (n : nat) : Set := {
  bexp_atomic_iso : WrapSProp (forall xs xs', rel_iso TokenListIso xs xs' ->
    rel_iso BexpResultIso 
      (Original.LF_DOT_ImpParser.LF.ImpParser.parseAtomicExp n xs)
      (Imported.fst2 imported_parser _ (Imported.bexpParsers (nat_to_lean_nat n)) xs'));
  bexp_conj_iso : WrapSProp (forall xs xs', rel_iso TokenListIso xs xs' ->
    rel_iso BexpResultIso 
      (Original.LF_DOT_ImpParser.LF.ImpParser.parseConjunctionExp n xs)
      (Imported.snd2 imported_parser _ (Imported.bexpParsers (nat_to_lean_nat n)) xs'))
}.

(* Base case helper for atomic exp *)
Lemma bexp_atomic_iso_zero : forall xs xs', rel_iso TokenListIso xs xs' ->
  rel_iso BexpResultIso 
    (Original.LF_DOT_ImpParser.LF.ImpParser.parseAtomicExp 0 xs)
    (get_bexp_atomic_parser 0 xs').
Proof.
  intros xs xs' Hxs.
  destruct Hxs as [Hxs].
  constructor.
  cbn -[Imported.too_many_recursive_calls].
  unfold get_bexp_atomic_parser.
  cbn -[Imported.too_many_recursive_calls].
  reflexivity.
Defined.

(* Base case helper for conj exp *)  
Lemma bexp_conj_iso_zero : forall xs xs', rel_iso TokenListIso xs xs' ->
  rel_iso BexpResultIso 
    (Original.LF_DOT_ImpParser.LF.ImpParser.parseConjunctionExp 0 xs)
    (get_bexp_conj_parser 0 xs').
Proof.
  intros xs xs' Hxs.
  destruct Hxs as [Hxs].
  constructor.
  cbn -[Imported.too_many_recursive_calls].
  unfold get_bexp_conj_parser.
  cbn -[Imported.too_many_recursive_calls].
  reflexivity.
Defined.

(* Prove by strong induction - we use fix to handle the mutual recursion *)
Lemma bexp_joint_iso : forall n, BexpJointIso n.
Proof.
  Import Original.LF_DOT_ImpParser.LF.ImpParser Strings.String.
  fix IH 1.
  intro n.
  destruct n as [|n'].
  - (* Base case: n = 0 *)
    constructor; constructor.
    + exact bexp_atomic_iso_zero.
    + exact bexp_conj_iso_zero.
  - (* Inductive case: n = S n' *)
    destruct (IH n') as [[IHatomic] [IHconj]].
    do 2 constructor; intros xs xs' [Hxs]; destruct Hxs; constructor.
    + (* parseAtomicExp (S n') *)
      pose (Imported.parseAtomicExp_bexp_succ (nat_to_lean_nat n') (TokenListIso xs)) as Hred.
      match type of Hred with
      | ?eq _ ?rhs => transitivity rhs
      end.
      2: { destruct Hred. constructor. }
      clear Hred.
      unfold Imported.bexpParsers_match_4.
      unfold Imported.Prod_casesOn_inst6.
      unfold Imported.Prod_inst3_recl.
      unfold Imported.aexpParsers_match_1.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
      cbn -[list_iso].
      pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso "true" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hexpect].
      destruct expect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect; try now inversion Hexpect.
      * cbn -[list_iso] in Hexpect.
        destruct x.
        Opaque list_iso.
        inversion Hexpect.
        subst.
        clear Hexpect.
        reflexivity.
      * clear Hexpect.
        pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso "false" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hexpect].
        destruct expect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect; try now inversion Hexpect.
        -- cbn -[list_iso] in Hexpect.
           destruct x.
           Opaque list_iso.
           inversion Hexpect.
           subst.
           clear Hexpect.
           reflexivity.
        -- clear Hexpect.
           unfold Imported.bexpParsers_match_1.
           unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
           unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
           destruct Imported.bexpParsers as [Patomic Pconj].
           cbn in IHatomic, IHconj.
           pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "~" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseAtomicExp n') _ _ xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
           destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
           ++ cbn in Hfirst.
              destruct x.
              inversion Hfirst.
              subst.
              clear Hfirst.
              reflexivity.
           ++ clear Hfirst.
              pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "(" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseConjunctionExp n') _ _ xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
              destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
              ** cbn in Hfirst.
                 destruct x.
                 inversion Hfirst.
                 subst.
                 clear Hfirst.
                 unfold Imported.prod_casesOn.
                 unfold Imported.prod_recl.
                 pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso ")" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) l _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hexpect].
                 destruct expect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect; try now inversion Hexpect.
                 --- cbn in Hexpect.
                     destruct x.
                     inversion Hexpect.
                     subst.
                     clear Hexpect.
                     reflexivity.
                 --- clear Hexpect.
                     unfold Imported.parseSumExp_body_match_4.
                     unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                     unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                     pose (parsers_joint_iso n') as Hjoint.
                     destruct Hjoint as [_ [Hproduct] _].
                     specialize (Hproduct xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hproduct].
                     destruct parseProductExp, Imported.parseProductExp; try now inversion Hproduct.
                     +++ cbn in Hproduct.
                         destruct x.
                         inversion Hproduct.
                         subst.
                         clear Hproduct.
                         unfold Imported.prod_casesOn.
                         unfold Imported.prod_recl.
                         unfold Imported.parseSumExp_body_match_1.
                         unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                         unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                         pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                         pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseAExp n') _ _ l0 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                         clear Haexp.
                         destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                         *** cbn in Hfirst.
                             destruct x.
                             inversion Hfirst.
                             subst.
                             clear Hfirst.
                             reflexivity.
                         *** clear Hfirst.
                             pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                             pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "<=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseAExp n') _ _ l0 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                             clear Haexp.
                             destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                             cbn in Hfirst.
                             destruct x.
                             inversion Hfirst.
                             subst.
                             clear Hfirst.
                             reflexivity.
              ** clear Hfirst.
                 unfold Imported.parseSumExp_body_match_4.
                 unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                 unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                 pose (parsers_joint_iso n') as Hjoint.
                 destruct Hjoint as [_ [Hproduct] _].
                 specialize (Hproduct xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hproduct].
                 destruct parseProductExp, Imported.parseProductExp; try now inversion Hproduct.
                 cbn in Hproduct.
                 destruct x.
                 inversion Hproduct.
                 subst.
                 clear Hproduct.
                 unfold Imported.prod_casesOn.
                 unfold Imported.prod_recl.
                 unfold Imported.parseSumExp_body_match_1.
                 unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                 unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                 pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                 pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseAExp n') _ Haexp l _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                 clear Haexp.
                 destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                 --- cbn in Hfirst.
                     destruct x.
                     inversion Hfirst.
                     subst.
                     clear Hfirst.
                     reflexivity.
                 --- clear Hfirst.
                     pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                     pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "<=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseAExp n') _ _ l _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                     clear Haexp.
                     destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                     cbn in Hfirst.
                     destruct x.
                     inversion Hfirst.
                     subst.
                     clear Hfirst.
                     reflexivity.
    + (* parseConjunctionExp (S n') *)
      pose (Imported.parseConjunctionExp_succ (nat_to_lean_nat n') (TokenListIso xs)) as Hred.
      match type of Hred with
      | ?eq _ ?rhs => transitivity rhs
      end.
      2: { destruct Hred. constructor. }
      clear Hred.
      unfold Imported.bexpParsers_match_4.
      unfold Imported.Prod_casesOn_inst6.
      unfold Imported.Prod_inst3_recl.
      unfold Imported.bexpParsers_match_3.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
      cbn -[Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp].
      clear IHconj.
      destruct Imported.bexpParsers as [Patomic Pconj].
      cbn in IHatomic.
      pose proof (IHatomic xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hatomic].
      destruct parseAtomicExp, Patomic; try now inversion Hatomic.
      cbn in Hatomic.
      destruct x.
      inversion Hatomic.
      subst.
      clear Hatomic.
      unfold Imported.prod_casesOn.
      unfold Imported.prod_recl.
      unfold Imported.bexpParsers_match_2.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
      pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "&&" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseAtomicExp n') _ IHatomic) as Hfirst.
      pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_many_iso _ _ _ _ _ Hfirst n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl) l _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hmany].
      clear Hfirst.
      destruct many, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many; try now inversion Hmany.
      * cbn in Hmany.
        destruct x.
        inversion Hmany.
        subst.
        clear Hmany.
        unfold Imported.prod_casesOn.
        unfold Imported.prod_recl.
        pose proof (fold_left_bexp_compat l0 b) as Hfold.
        apply eq_of_seq in Hfold.
        replace (Imported.fold_left_bexp Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BAnd (to (list_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso) l0) (bexp_to_imported b)) with (to Original_LF__DOT__Imp_LF_Imp_bexp_iso (List.fold_left Original.LF_DOT_Imp.LF.Imp.BAnd l0 b)).
        reflexivity.
Defined.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x4 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x3 x4 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
    (Original.LF_DOT_ImpParser.LF.ImpParser.parseAtomicExp x1 x3) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp x2 x4).
Proof.
  intros x1 x2 Hnat x3 x4 Hlist.
  apply rel_iso_nat_eq in Hnat. subst x2.
  destruct (bexp_joint_iso x1) as [H1 _].
  destruct H1 as [H1].
  rewrite parseAtomicExp_eq_get.
  apply H1.
  exact Hlist.
Defined.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.parseAtomicExp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.parseAtomicExp Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.parseAtomicExp Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp_iso := {}.
