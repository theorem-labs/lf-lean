From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import String.
Open Scope string_scope.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__optionU_e__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__token__iso Isomorphisms.U_string__string__iso Isomorphisms.list__iso Isomorphisms.prod__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__isU_lowerU_alpha__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__list____of____string__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod imported_String_string (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier.

(* String constant equivalences *)
Lemma expected_identifier_eq : IsomorphismDefinitions.eq (string_to_imported "Expected identifier") Imported.expected_identifier.
Proof. vm_compute. exact IsomorphismDefinitions.eq_refl. Defined.

Lemma str_illegal_prefix_eq : IsomorphismDefinitions.eq (string_to_imported "Illegal identifier:'") Imported.str_illegal_prefix.
Proof. vm_compute. exact IsomorphismDefinitions.eq_refl. Defined.

Lemma str_quote_eq : IsomorphismDefinitions.eq (string_to_imported "'") Imported.str_quote.
Proof. vm_compute. exact IsomorphismDefinitions.eq_refl. Defined.

(* String append compatibility *)
Lemma string_append_compat : forall (s1 s2 : String.string),
  IsomorphismDefinitions.eq (string_to_imported (String.append s1 s2))
    (Imported.mystring_append (string_to_imported s1) (string_to_imported s2)).
Proof.
  fix IH 1.
  intros [| c s1'] s2.
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply (IsoEq.f_equal (Imported.mystring_String _)). apply IH.
Defined.

(* The original uses ("Illegal identifier:'" ++ s) ++ "'" which is left-associative *)
Lemma illegal_identifier_msg_eq : forall (s : String.string),
  IsomorphismDefinitions.eq (string_to_imported (String.append (String.append "Illegal identifier:'" s) "'"))
    (Imported.illegal_identifier_msg (string_to_imported s)).
Proof.
  intros s.
  unfold Imported.illegal_identifier_msg.
  (* LHS: string_to_imported (("Illegal identifier:'" ++ s) ++ "'") *)
  (* RHS: mystring_append (mystring_append str_illegal_prefix (string_to_imported s)) str_quote *)
  eapply IsoEq.eq_trans.
  - apply string_append_compat.
  - apply (IsoEq.f_equal2 Imported.mystring_append).
    + eapply IsoEq.eq_trans.
      * apply string_append_compat.
      * apply (IsoEq.f_equal2 Imported.mystring_append).
        -- exact str_illegal_prefix_eq.
        -- apply IsomorphismDefinitions.eq_refl.
    + exact str_quote_eq.
Defined.

(* Helper: forallb isLowerAlpha compatibility *)
Lemma forallb_isLowerAlpha_compat : forall (xs : list Ascii.ascii),
  IsomorphismDefinitions.eq
    (bool_to_imported (List.forallb Original.LF_DOT_ImpParser.LF.ImpParser.isLowerAlpha xs))
    (Imported.forallb _ Imported.isLowerAlpha ((list_iso Ascii_ascii_iso).(to) xs)).
Proof.
  fix IH 1.
  intros [| x xs'].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    destruct x as [b0 b1 b2 b3 b4 b5 b6 b7].
    destruct b0; destruct b1; destruct b2; destruct b3;
    destruct b4; destruct b5; destruct b6; destruct b7;
    simpl; try apply IsomorphismDefinitions.eq_refl;
    try apply IH.
Defined.

(* Helper: list_of_string compatibility *)
Lemma list_of_string_compat : forall (s : String.string),
  IsomorphismDefinitions.eq
    ((list_iso Ascii_ascii_iso).(to) (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string s))
    (Imported.list_of_string (string_to_imported s)).
Proof.
  fix IH 1.
  intros [| c s'].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply (IsoEq.f_equal2 (Imported.list_cons _)).
    + apply IsomorphismDefinitions.eq_refl.
    + apply IH.
Defined.

(* Combined: forallb isLowerAlpha (list_of_string s) compatibility *)
Lemma forallb_isLowerAlpha_list_of_string_compat : forall (s : String.string),
  IsomorphismDefinitions.eq
    (bool_to_imported (List.forallb Original.LF_DOT_ImpParser.LF.ImpParser.isLowerAlpha (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string s)))
    (Imported.forallb _ Imported.isLowerAlpha (Imported.list_of_string (string_to_imported s))).
Proof.
  intros s.
  eapply IsoEq.eq_trans.
  - apply forallb_isLowerAlpha_compat.
  - apply (IsoEq.f_equal (fun l => Imported.forallb _ Imported.isLowerAlpha l)).
    apply list_of_string_compat.
Defined.

(* Main compatibility lemma *)
Lemma parseIdentifier_compat : forall (xs : list Original.LF_DOT_ImpParser.LF.ImpParser.token),
  IsomorphismDefinitions.eq
    ((Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso String_string_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso))).(to)
      (Original.LF_DOT_ImpParser.LF.ImpParser.parseIdentifier xs))
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier ((list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso).(to) xs)).
Proof.
  intros [| x xs'].
  - (* nil case *)
    simpl. unfold imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier.
    apply (IsoEq.f_equal (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_NoneE _)).
    exact expected_identifier_eq.
  - (* cons x xs' case *)
    simpl. unfold imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier.
    (* Need to match on forallb result *)
    set (rocq_result := List.forallb Original.LF_DOT_ImpParser.LF.ImpParser.isLowerAlpha
           (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x)).
    set (lean_result := Imported.forallb _ Imported.isLowerAlpha 
           (Imported.list_of_string (string_to_imported x))).
    assert (Hcompat : IsomorphismDefinitions.eq (bool_to_imported rocq_result) lean_result).
    { unfold rocq_result, lean_result. apply forallb_isLowerAlpha_list_of_string_compat. }
    destruct rocq_result eqn:Hrocq.
    + (* true case - returns SomeE *)
      simpl.
      simpl in Hcompat.
      refine (eq_srect (fun b => IsomorphismDefinitions.eq _ (Imported.mybool_andb_match_1 _ b _ _)) _ Hcompat).
      simpl.
      apply IsomorphismDefinitions.eq_refl.
    + (* false case - returns NoneE with error message *)
      simpl.
      simpl in Hcompat.
      refine (eq_srect (fun b => IsomorphismDefinitions.eq _ (Imported.mybool_andb_match_1 _ b _ _)) _ Hcompat).
      simpl.
      apply (IsoEq.f_equal (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_NoneE _)).
      exact (illegal_identifier_msg_eq x).
Defined.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso : forall (x1 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x2 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x1 x2 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso String_string_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
    (Original.LF_DOT_ImpParser.LF.ImpParser.parseIdentifier x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier x2).
Proof.
  intros x1 x2 Hiso.
  pose proof (proj_rel_iso Hiso) as Hiso'. simpl in Hiso'.
  apply (eq_srect
    (fun x2' => rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso String_string_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
      (Original.LF_DOT_ImpParser.LF.ImpParser.parseIdentifier x1)
      (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier x2'))
    (parseIdentifier_compat x1) Hiso').
Defined.

Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.parseIdentifier := {}.
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier := {}.
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.parseIdentifier Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.parseIdentifier Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso := {}.
