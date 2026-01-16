From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__optionU_e__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__token__iso Isomorphisms.list__iso Isomorphisms.nat__iso Isomorphisms.prod__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__firstU_expect__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__expect__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parseU_identifier__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parseU2_aexp__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parseU2_bexp__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand : imported_nat ->
  imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod imported_Original_LF__DOT__Imp_LF_Imp_com (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseSequencedCommand : imported_nat ->
  imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod imported_Original_LF__DOT__Imp_LF_Imp_com (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseSequencedCommand.

Definition ComResultIso := Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso 
  (prod_iso Original_LF__DOT__Imp_LF_Imp_com_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)).

Lemma rel_iso_nat_eq : forall n n', rel_iso nat_iso n n' -> n' = to nat_iso n.
Proof. intros n n' H. destruct H as [Heq]. apply eq_of_seq in Heq. symmetry. exact Heq. Defined.

Definition TokenListIso := list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso.
Definition nat_to_lean_nat (n : nat) : Nat := to nat_iso n.

(* The joint isomorphism record for command parsers *)
Record ComJointIso (n : nat) : Set := {
  com_simple_iso : WrapSProp (forall xs xs', rel_iso TokenListIso xs xs' ->
    rel_iso ComResultIso 
      (Original.LF_DOT_ImpParser.LF.ImpParser.parseSimpleCommand n xs)
      (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand (nat_to_lean_nat n) xs'));
  com_seq_iso : WrapSProp (forall xs xs', rel_iso TokenListIso xs xs' ->
    rel_iso ComResultIso 
      (Original.LF_DOT_ImpParser.LF.ImpParser.parseSequencedCommand n xs)
      (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseSequencedCommand (nat_to_lean_nat n) xs'))
}.

(* Base case for parseSimpleCommand 0 *)
Lemma com_simple_iso_zero : forall xs xs', rel_iso TokenListIso xs xs' ->
  rel_iso ComResultIso 
    (Original.LF_DOT_ImpParser.LF.ImpParser.parseSimpleCommand 0 xs)
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand 0 xs').
Proof.
  intros xs xs' [Hxs]. destruct Hxs. constructor.
  simpl. constructor.
Defined.

(* Base case for parseSequencedCommand 0 *)
Lemma com_seq_iso_zero : forall xs xs', rel_iso TokenListIso xs xs' ->
  rel_iso ComResultIso 
    (Original.LF_DOT_ImpParser.LF.ImpParser.parseSequencedCommand 0 xs)
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseSequencedCommand 0 xs').
Proof.
  intros xs xs' [Hxs]. destruct Hxs. constructor.
  simpl. constructor.
Defined.

Lemma com_joint_iso : forall n, ComJointIso n.
Proof.
  Import Original.LF_DOT_ImpParser.LF.ImpParser Strings.String.
  fix IH 1.
  intro n.
  destruct n as [|n'].
  - (* Base case: n = 0 *)
    constructor; constructor.
    + exact com_simple_iso_zero.
    + exact com_seq_iso_zero.
  - (* Inductive case: n = S n' *)
    destruct (IH n') as [[IHsimple] [IHseq]].
    do 2 constructor; intros xs xs' [Hxs]; destruct Hxs; constructor.
    + (* parseSimpleCommand (S n') *)
      clear IHsimple.
      pose (Imported.parseSimpleCommand_succ (nat_to_lean_nat n') (TokenListIso xs)) as Hred.
      match type of Hred with
      | ?eq _ ?rhs => transitivity rhs
      end.
      2: { destruct Hred. constructor. }
      clear Hred.
      cbn -[list_iso Original_LF__DOT__Imp_LF_Imp_com_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso].
      unfold Imported.comParsers_match_3.
      unfold Imported.Prod_casesOn_inst6.
      unfold Imported.Prod_inst3_recl.
      unfold Imported.comParsers_match_4.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
      unfold Imported.comParsers_match_1.
      unfold Imported.aexpParsers_match_1.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
      pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso "skip" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hexpect].
      destruct expect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect; try now inversion Hexpect.
      * cbn -[list_iso] in Hexpect.
        destruct x.
        inversion Hexpect.
        subst.
        clear Hexpect.
        reflexivity.
      * clear Hexpect.
        unfold Imported.bexpParsers_match_1.
        unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
        unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
        pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseBExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hbexp.
        pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "if" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseBExp n') _ Hbexp xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
        clear Hbexp.
        destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
        -- cbn -[list_iso Original_LF__DOT__Imp_LF_Imp_com_iso] in Hfirst.
           destruct x.
           Opaque list_iso Original_LF__DOT__Imp_LF_Imp_com_iso.
           inversion Hfirst.
           subst.
           clear Hfirst.
           unfold Imported.prod_casesOn.
           unfold Imported.prod_recl.
           unfold Imported.comParsers_match_1.
           unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
           unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
           pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "then" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseSequencedCommand n') _ _ l _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
           destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
           ++ cbn -[list_iso Original_LF__DOT__Imp_LF_Imp_com_iso] in Hfirst.
              destruct x.
              Opaque list_iso Original_LF__DOT__Imp_LF_Imp_com_iso.
              inversion Hfirst.
              subst.
              clear Hfirst.
              unfold Imported.prod_casesOn.
              unfold Imported.prod_recl.
              pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "else" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseSequencedCommand n') _ _ l0 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
              destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
              ** cbn -[list_iso Original_LF__DOT__Imp_LF_Imp_com_iso] in Hfirst.
                 destruct x.
                 inversion Hfirst.
                 subst.
                 clear Hfirst.
                 pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso "end" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) l1 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hexpect].
                 destruct expect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect; try now inversion Hexpect.
                 --- cbn -[list_iso] in Hexpect.
                     destruct x.
                     inversion Hexpect.
                     subst.
                     clear Hexpect.
                     destruct u.
                     reflexivity.
                 --- cbn in Hexpect.
                     inversion Hexpect.
                     subst.
                     clear Hexpect.
                     unfold Imported.letFun.
                     pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseBExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hbexp.
                     pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "while" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseBExp n') _ Hbexp xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                     clear Hbexp.
                     destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                     +++ cbn in Hfirst.
                         destruct x.
                         inversion Hfirst.
                         subst.
                         clear Hfirst.
                         pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "do" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseSequencedCommand n') _ _ l2 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                         destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                         *** cbn in Hfirst.
                             destruct x.
                             inversion Hfirst.
                             subst.
                             clear Hfirst.
                             pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso "end" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) l3 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hexpect].
                             destruct expect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect; try now inversion Hexpect.
                             ---- cbn in Hexpect.
                                  destruct x.
                                  inversion Hexpect.
                                  subst.
                                  clear Hexpect.
                                  reflexivity.
                             ---- clear Hexpect.
                                  unfold Imported.aexpParsers_match_3.
                                  unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                                  unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                                  pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hident].
                                  destruct parseIdentifier, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier; try now inversion Hident.
                                  cbn in Hident.
                                  destruct x.
                                  inversion Hident.
                                  subst.
                                  clear Hident.
                                  unfold Imported.prod_casesOn.
                                  unfold Imported.prod_recl.
                                  unfold Imported.parseSumExp_body_match_1.
                                  unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                                  unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                                  pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                                  pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ":=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Haexp l4 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                                  clear Haexp.
                                  destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                                  cbn in Hfirst.
                                  destruct x.
                                  inversion Hfirst.
                                  subst.
                                  clear Hfirst.
                                  reflexivity.
                         *** clear Hfirst.
                             unfold Imported.aexpParsers_match_3.
                              unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                              unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                              pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hident].
                              destruct parseIdentifier, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier; try now inversion Hident.
                              cbn in Hident.
                              destruct x.
                              inversion Hident.
                              subst.
                              clear Hident.
                              unfold Imported.prod_casesOn.
                              unfold Imported.prod_recl.
                              unfold Imported.parseSumExp_body_match_1.
                              unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                              unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                              pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                              pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ":=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Haexp l3 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                              clear Haexp.
                              destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                              cbn in Hfirst.
                              destruct x.
                              inversion Hfirst.
                              subst.
                              clear Hfirst.
                              reflexivity.
                     +++ clear Hfirst.
                         unfold Imported.aexpParsers_match_3.
                         unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                         unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                         pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hident].
                         destruct parseIdentifier, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier; try now inversion Hident.
                         cbn in Hident.
                         destruct x.
                         inversion Hident.
                         subst.
                         clear Hident.
                         unfold Imported.prod_casesOn.
                          unfold Imported.prod_recl.
                          unfold Imported.parseSumExp_body_match_1.
                          unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                          unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                          pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                          pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ":=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Haexp l2 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                          clear Haexp.
                          destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                          cbn in Hfirst.
                          destruct x.
                          inversion Hfirst.
                          subst.
                          clear Hfirst.
                          reflexivity.
              ** unfold Imported.letFun.
                 clear Hfirst.
                 pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseBExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hbexp.
                 pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "while" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Hbexp xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                 clear Hbexp.
                 destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                 --- cbn in Hfirst.
                     destruct x.
                     inversion Hfirst.
                     subst.
                     clear Hfirst.
                     pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "do" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseSequencedCommand n') _ _ l1 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                     destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                     +++ cbn in Hfirst.
                         destruct x.
                         inversion Hfirst.
                         subst.
                         clear Hfirst.
                         pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso "end" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) l2 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hexpect].
                         destruct expect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect; try now inversion Hexpect.
                         *** cbn in Hexpect.
                             destruct x.
                             inversion Hexpect.
                             subst.
                             clear Hexpect.
                             reflexivity.
                         *** clear Hexpect.
                             unfold Imported.aexpParsers_match_3.
                             unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                             unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                             pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hident].
                             destruct parseIdentifier, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier; try now inversion Hident.
                             cbn in Hident.
                             destruct x.
                             inversion Hident.
                             subst.
                             clear Hident.
                             unfold Imported.prod_casesOn.
                             unfold Imported.prod_recl.
                             unfold Imported.parseSumExp_body_match_1.
                             unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                             unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                             pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                             pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ":=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Haexp l3 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                             clear Haexp.
                             destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                             cbn in Hfirst.
                             destruct x.
                             inversion Hfirst.
                             subst.
                             clear Hfirst.
                             reflexivity.
                     +++ clear Hfirst.
                         unfold Imported.aexpParsers_match_3.
                         unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                         unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                         pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hident].
                         destruct parseIdentifier, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier; try now inversion Hident.
                         cbn in Hident.
                         destruct x.
                         inversion Hident.
                         subst.
                         clear Hident.
                         unfold Imported.prod_casesOn.
                         unfold Imported.prod_recl.
                         unfold Imported.parseSumExp_body_match_1.
                         unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                         unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                         pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                         pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ":=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Haexp l2 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                         clear Haexp.
                         destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                         cbn in Hfirst.
                         destruct x.
                         inversion Hfirst.
                         subst.
                         clear Hfirst.
                         reflexivity.
                 --- clear Hfirst.
                     unfold Imported.aexpParsers_match_3.
                     unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                     unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                     pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hident].
                     destruct parseIdentifier, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier; try now inversion Hident.
                     cbn in Hident.
                     destruct x.
                     inversion Hident.
                     subst.
                     clear Hident.
                     unfold Imported.prod_casesOn.
                     unfold Imported.prod_recl.
                     unfold Imported.parseSumExp_body_match_1.
                     unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                     unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                     pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                     pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ":=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Haexp l1 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                     clear Haexp.
                     destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                     cbn in Hfirst.
                     destruct x.
                     inversion Hfirst.
                     subst.
                     clear Hfirst.
                     reflexivity.
           ++ clear Hfirst.
              unfold Imported.letFun.
              pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseBExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hbexp.
              pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "while" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseBExp n') _ Hbexp xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
              clear Hbexp.
              destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
              ** cbn in Hfirst.
                 destruct x.
                 inversion Hfirst.
                 subst.
                 clear Hfirst.
                 pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "do" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseSequencedCommand n') _ _ l0 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                 destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                 --- cbn in Hfirst.
                     destruct x.
                     inversion Hfirst.
                     subst.
                     clear Hfirst.
                     pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso "end" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) l1 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hexpect].
                     destruct expect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect; try now inversion Hexpect.
                     +++ cbn in Hexpect.
                         destruct x.
                         inversion Hexpect.
                         subst.
                         clear Hexpect.
                         reflexivity.
                     +++ clear Hexpect.
                         unfold Imported.aexpParsers_match_3.
                         unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                         unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                         pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hident].
                         destruct parseIdentifier, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier; try now inversion Hident.
                         cbn in Hident.
                         destruct x.
                         inversion Hident.
                         subst.
                         clear Hident.
                         unfold Imported.prod_casesOn.
                         unfold Imported.prod_recl.
                         unfold Imported.parseSumExp_body_match_1.
                         unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                         unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                         pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                         pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ":=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Haexp l2 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                         clear Haexp.
                         destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                         cbn in Hfirst.
                         destruct x.
                         inversion Hfirst.
                         subst.
                         clear Hfirst.
                         reflexivity.
                 --- clear Hfirst.
                     unfold Imported.aexpParsers_match_3.
                     unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                     unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                     pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hident].
                     destruct parseIdentifier, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier; try now inversion Hident.
                     cbn in Hident.
                     destruct x.
                     inversion Hident.
                     subst.
                     clear Hident.
                     unfold Imported.prod_casesOn.
                     unfold Imported.prod_recl.
                     unfold Imported.parseSumExp_body_match_1.
                     unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                     unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                     pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                     pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ":=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Haexp l1 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                     clear Haexp.
                     destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                     cbn in Hfirst.
                     destruct x.
                     inversion Hfirst.
                     subst.
                     clear Hfirst.
                     reflexivity.
              ** clear Hfirst.
                 unfold Imported.aexpParsers_match_3.
                 unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                 unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                 pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hident].
                 destruct parseIdentifier, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier; try now inversion Hident.
                 cbn in Hident.
                 destruct x.
                 inversion Hident.
                 subst.
                 clear Hident.
                 unfold Imported.prod_casesOn.
                 unfold Imported.prod_recl.
                 unfold Imported.parseSumExp_body_match_1.
                 unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                 unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                 pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                 pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ":=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Haexp l0 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                 clear Haexp.
                 destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                 cbn in Hfirst.
                 destruct x.
                 inversion Hfirst.
                 subst.
                 clear Hfirst.
                 reflexivity.
        -- clear Hfirst.
           unfold Imported.letFun.
           pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseBExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Hbexp.
           pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "while" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseBExp n') _ Hbexp xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
           clear Hbexp.
           destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
           ** cbn in Hfirst.
              destruct x.
              inversion Hfirst.
              subst.
              clear Hfirst.
              unfold Imported.prod_casesOn.
              unfold Imported.prod_recl.
              pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ "do" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseSequencedCommand n') _ _ l _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
              destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
              --- cbn in Hfirst.
                  destruct x.
                  inversion Hfirst.
                  subst.
                  clear Hfirst.
                  pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso "end" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) l0 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hexpect].
                  destruct expect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect; try now inversion Hexpect.
                  +++ cbn in Hexpect.
                      destruct x.
                      inversion Hexpect.
                      subst.
                      clear Hexpect.
                      unfold Imported.prod_casesOn.
                      unfold Imported.prod_recl.
                      reflexivity.
                  +++ clear Hexpect.
                      unfold Imported.aexpParsers_match_3.
                      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                      pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hident].
                      destruct parseIdentifier, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier; try now inversion Hident.
                      cbn in Hident.
                      destruct x.
                      inversion Hident.
                      subst.
                      clear Hident.
                      unfold Imported.prod_casesOn.
                      unfold Imported.prod_recl.
                      unfold Imported.parseSumExp_body_match_1.
                      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                      pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                      pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ":=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Haexp l1 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                      clear Haexp.
                      destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                      cbn in Hfirst.
                      destruct x.
                      inversion Hfirst.
                      subst.
                      clear Hfirst.
                      reflexivity.
              --- clear Hfirst.
                  unfold Imported.aexpParsers_match_3.
                  unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                  unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                  pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hident].
                  destruct parseIdentifier, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier; try now inversion Hident.
                  cbn in Hident.
                  destruct x.
                  inversion Hident.
                  subst.
                  clear Hident.
                  unfold Imported.prod_casesOn.
                  unfold Imported.prod_recl.
                  unfold Imported.parseSumExp_body_match_1.
                  unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
                  unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
                  pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
                  pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ":=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Haexp l0 _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
                  clear Haexp.
                  destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
                  cbn in Hfirst.
                  destruct x.
                  inversion Hfirst.
                  subst.
                  clear Hfirst.
                  reflexivity.
           ** clear Hfirst.
              unfold Imported.aexpParsers_match_3.
              unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
              unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
              pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso xs _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hident].
              destruct parseIdentifier, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier; try now inversion Hident.
              cbn in Hident.
              destruct x.
              inversion Hident.
              subst.
              clear Hident.
              unfold Imported.prod_casesOn.
              unfold Imported.prod_recl.
              unfold Imported.parseSumExp_body_match_1.
              unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
              unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
              pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp_iso n' _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as Haexp.
              pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ":=" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) _ _ Haexp l _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
              clear Haexp.
              destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
              cbn in Hfirst.
              destruct x.
              inversion Hfirst.
              subst.
              clear Hfirst.
              reflexivity.
    + (* parseSequencedCommand (S n') *)
      pose (Imported.parseSequencedCommand_succ (nat_to_lean_nat n') (TokenListIso xs)) as Hred.
      match type of Hred with
      | ?eq _ ?rhs => transitivity rhs
      end.
      2: { destruct Hred. constructor. }
      clear Hred.
      unfold Imported.aexpParsers_match_1.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
      unfold Imported.prod_casesOn.
      unfold Imported.prod_recl.
      cbn -[TokenListIso list_iso Original_LF__DOT__Imp_LF_Imp_com_iso].
      pose proof (IHsimple xs (TokenListIso xs) (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hsimple].
      destruct parseSimpleCommand eqn:HpsOrig, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand eqn:HpsImp; 
      try (now inversion Hsimple);
      try reflexivity.
      cbn -[TokenListIso list_iso Original_LF__DOT__Imp_LF_Imp_com_iso] in Hsimple.
      destruct x.
      Opaque TokenListIso Original_LF__DOT__Imp_LF_Imp_com_iso.
      inversion Hsimple. subst. clear Hsimple.
      unfold Imported.comParsers_match_2.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
      unfold Imported.prod_casesOn.
      unfold Imported.prod_recl.
      unfold Imported.comParsers_match_1.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_casesOn.
      unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_recl.
      pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso _ _ _ ";" _ (Build_rel_iso IsomorphismDefinitions.eq_refl) (parseSequencedCommand n') _ _ l _ (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [Hfirst].
      destruct firstExpect, Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect; try now inversion Hfirst.
      cbn in Hfirst.
      destruct x.
      inversion Hfirst.
      subst.
      clear Hfirst.
      reflexivity.
Defined.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x4 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x3 x4 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso Original_LF__DOT__Imp_LF_Imp_com_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
    (Original.LF_DOT_ImpParser.LF.ImpParser.parseSimpleCommand x1 x3) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand x2 x4).
Proof.
  intros x1 x2 Hnat x3 x4 Hlist.
  apply rel_iso_nat_eq in Hnat. subst x2.
  destruct (com_joint_iso x1) as [[H1] _].
  apply H1.
  exact Hlist.
Defined.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.parseSimpleCommand := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.parseSimpleCommand Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.parseSimpleCommand Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand_iso := {}.
