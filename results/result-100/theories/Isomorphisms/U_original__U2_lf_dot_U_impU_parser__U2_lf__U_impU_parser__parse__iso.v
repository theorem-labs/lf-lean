From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import List String.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__optionU_e__iso Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_parse : imported_String_string -> imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE imported_Original_LF__DOT__Imp_LF_Imp_com := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parse.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__tokenize__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__bignumber__iso.
From IsomorphismChecker Require Export Isomorphisms.nat__iso.
From IsomorphismChecker Require Export Isomorphisms.list__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parseU_simpleU_command__iso.

(* tokens isomorphism *)
Lemma tokens_iso : forall s,
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)
    (Original.LF_DOT_ImpParser.LF.ImpParser.tokenize s)
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize (String_string_iso.(to) s)).
Proof.
  intros s.
  apply (@Original_LF__DOT__ImpParser_LF_ImpParser_tokenize_iso s _ (Build_rel_iso IsomorphismDefinitions.eq_refl)).
Qed.

(* Helper: parseSequencedCommand applied to bignumber gives isomorphic results *)
Lemma parseSeqCmd_bignumber_iso : forall toks toks',
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) toks toks' ->
  rel_iso ComResultIso
    (Original.LF_DOT_ImpParser.LF.ImpParser.parseSequencedCommand Original.LF_DOT_ImpParser.LF.ImpParser.bignumber toks)
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseSequencedCommand 
       (nat_iso.(to) Original.LF_DOT_ImpParser.LF.ImpParser.bignumber) toks').
Proof.
  intros toks toks' Htoks.
  destruct (com_joint_iso Original.LF_DOT_ImpParser.LF.ImpParser.bignumber) as [_ [Hseq]].
  apply Hseq. exact Htoks.
Qed.

(* Key: bignumber conversion *)
Lemma bignumber_eq : nat_iso.(to) Original.LF_DOT_ImpParser.LF.ImpParser.bignumber = Imported.Original_LF__DOT__ImpParser_LF_ImpParser_bignumber.
Proof. reflexivity. Qed.

(* Helper: parseSequencedCommand with converted bignumber equals direct call *)
Lemma parseSeqCmd_eq : forall toks',
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseSequencedCommand 
       (nat_iso.(to) Original.LF_DOT_ImpParser.LF.ImpParser.bignumber) toks' =
  Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseSequencedCommand
       Imported.Original_LF__DOT__ImpParser_LF_ImpParser_bignumber toks'.
Proof. reflexivity. Qed.

(* Main compatibility lemma *)
Lemma parse_compat : forall (x1 : String.string),
  IsomorphismDefinitions.eq
    ((Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso Original_LF__DOT__Imp_LF_Imp_com_iso).(to)
       (Original.LF_DOT_ImpParser.LF.ImpParser.parse x1))
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parse ((String_string_iso).(to) x1)).
Proof.
  intros x1.
  unfold Original.LF_DOT_ImpParser.LF.ImpParser.parse.
  unfold imported_Original_LF__DOT__ImpParser_LF_ImpParser_parse.
  unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parse.
  
  pose proof (parseSeqCmd_bignumber_iso (tokens_iso x1)) as [Hparse_eq].
  
  set (orig_res := Original.LF_DOT_ImpParser.LF.ImpParser.parseSequencedCommand 
    Original.LF_DOT_ImpParser.LF.ImpParser.bignumber
    (Original.LF_DOT_ImpParser.LF.ImpParser.tokenize x1)) in *.
  
  (* Align bignumber versions *)
  rewrite parseSeqCmd_eq in Hparse_eq.
  
  (* Use eq_srect to substitute *)
  refine (eq_srect (fun res' => IsomorphismDefinitions.eq _ 
    (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parse_match_1 
      (fun _ => Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE Imported.Original_LF__DOT__Imp_LF_Imp_com)
      res'
      (fun c => Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_SomeE _ c)
      (fun _ t _ => Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_NoneE _
          (Imported.mystring_append Imported.str_trailing_tokens t))
      (fun msg => Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_NoneE _ msg)))
    _ Hparse_eq).
  
  destruct orig_res as [[c toks] | err].
  - destruct toks as [| tok rest].
    + simpl. apply IsomorphismDefinitions.eq_refl.
    + simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply IsomorphismDefinitions.eq_refl.
Qed.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_parse_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso Original_LF__DOT__Imp_LF_Imp_com_iso) (Original.LF_DOT_ImpParser.LF.ImpParser.parse x1)
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parse x2).
Proof.
  intros x1 x2 Hs.
  constructor.
  destruct Hs as [Hs].
  eapply IsoEq.eq_trans.
  - apply parse_compat.
  - apply IsoEq.f_equal. exact Hs.
Defined.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.parse := {}.
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parse := {}.
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.parse Original_LF__DOT__ImpParser_LF_ImpParser_parse_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.parse Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parse Original_LF__DOT__ImpParser_LF_ImpParser_parse_iso := {}.
