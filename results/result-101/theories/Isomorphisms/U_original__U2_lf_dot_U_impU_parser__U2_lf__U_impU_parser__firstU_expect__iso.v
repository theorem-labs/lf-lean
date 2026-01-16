From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import String.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parser__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect : forall x : Type,
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
   imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod x (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token))) ->
  imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod x (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect).

(* Helper: bool equality corresponds to mybool equality *)
Lemma bool_eq_mybool_eq : forall b1 b2 : bool,
  Imported.mybool_eq (bool_to_mybool b1) (bool_to_mybool b2) = 
  bool_to_mybool (Bool.eqb b1 b2).
Proof.
  intros [|] [|]; reflexivity.
Defined.

(* Helper: ascii equality corresponds to imported ascii equality *)
Lemma ascii_eq_correct : forall a1 a2 : Ascii.ascii,
  Imported.ascii_eq (ascii_to a1) (ascii_to a2) = 
  bool_to_mybool (Ascii.eqb a1 a2).
Proof.
  intros [b0 b1 b2 b3 b4 b5 b6 b7] [c0 c1 c2 c3 c4 c5 c6 c7].
  unfold ascii_to.
  unfold Imported.ascii_eq.
  unfold Imported.ascii_eq_match_1.
  simpl.
  unfold Ascii.eqb.
  destruct b0; destruct b1; destruct b2; destruct b3;
  destruct b4; destruct b5; destruct b6; destruct b7;
  destruct c0; destruct c1; destruct c2; destruct c3;
  destruct c4; destruct c5; destruct c6; destruct c7;
  reflexivity.
Defined.

(* Helper: mybool_andb_match_1 behaves like bool match - using SProp eq *)
Lemma mybool_andb_match1_spec : forall (A : Type) (b : Imported.mybool) (ft ff : Imported.Unit -> A),
  IsomorphismDefinitions.eq
    (Imported.mybool_andb_match_1 (fun _ => A) b ft ff)
    (match b with
     | Imported.mybool_mytrue => ft Imported.Unit_unit
     | Imported.mybool_myfalse => ff Imported.Unit_unit
     end).
Proof.
  intros. destruct b; apply IsomorphismDefinitions.eq_refl.
Defined.

(* Helper: mystring_eq on EmptyString cases - using SProp eq *)
Lemma mystring_eq_empty_empty : 
  IsomorphismDefinitions.eq
    (Imported.mystring_eq Imported.mystring_EmptyString Imported.mystring_EmptyString)
    Imported.mybool_mytrue.
Proof. apply IsomorphismDefinitions.eq_refl. Defined.

Lemma mystring_eq_empty_string : forall a s,
  IsomorphismDefinitions.eq
    (Imported.mystring_eq Imported.mystring_EmptyString (Imported.mystring_String a s))
    Imported.mybool_myfalse.
Proof. intros. apply IsomorphismDefinitions.eq_refl. Defined.

Lemma mystring_eq_string_empty : forall a s,
  IsomorphismDefinitions.eq
    (Imported.mystring_eq (Imported.mystring_String a s) Imported.mystring_EmptyString)
    Imported.mybool_myfalse.
Proof. intros. apply IsomorphismDefinitions.eq_refl. Defined.

Lemma mystring_eq_string_string : forall a1 s1 a2 s2,
  IsomorphismDefinitions.eq
    (Imported.mystring_eq (Imported.mystring_String a1 s1) (Imported.mystring_String a2 s2))
    (Imported.mybool_andb_match_1 (fun _ => Imported.mybool) (Imported.ascii_eq a1 a2)
      (fun _ => Imported.mystring_eq s1 s2)
      (fun _ => Imported.mybool_myfalse)).
Proof. intros. apply IsomorphismDefinitions.eq_refl. Defined.

(* Helper: string equality corresponds to mystring equality - using SProp eq *)
Lemma string_eq_mystring_eq : forall s1 s2 : String.string,
  IsomorphismDefinitions.eq
    (Imported.mystring_eq (string_to_mystring s1) (string_to_mystring s2))
    (bool_to_mybool (String.eqb s1 s2)).
Proof.
  fix IH 1.
  intros [|a1 s1] [|a2 s2].
  - apply mystring_eq_empty_empty.
  - apply mystring_eq_empty_string.
  - apply mystring_eq_string_empty.
  - simpl string_to_mystring.
    eapply eq_trans.
    + apply (mystring_eq_string_string (ascii_to a1) (string_to_mystring s1) (ascii_to a2) (string_to_mystring s2)).
    + eapply eq_trans.
      * apply mybool_andb_match1_spec.
      * unfold String.eqb. fold (String.eqb s1 s2).
        pose proof (ascii_eq_correct a1 a2) as Ha.
        destruct (Ascii.eqb a1 a2) eqn:Heq.
        -- simpl.
           assert (Imported.ascii_eq (ascii_to a1) (ascii_to a2) = Imported.mybool_mytrue) as Ha'.
           { exact Ha. }
           rewrite Ha'.
           simpl.
           apply IH.
        -- simpl.
           assert (Imported.ascii_eq (ascii_to a1) (ascii_to a2) = Imported.mybool_myfalse) as Ha'.
           { exact Ha. }
           rewrite Ha'.
           simpl.
           apply IsomorphismDefinitions.eq_refl.
Defined.

(* Lemma: mystring_append on EmptyString *)
Lemma mystring_append_empty : forall s,
  IsomorphismDefinitions.eq (Imported.mystring_append Imported.mystring_EmptyString s) s.
Proof. intros. apply IsomorphismDefinitions.eq_refl. Defined.

Lemma mystring_append_string : forall a s1 s2,
  IsomorphismDefinitions.eq 
    (Imported.mystring_append (Imported.mystring_String a s1) s2)
    (Imported.mystring_String a (Imported.mystring_append s1 s2)).
Proof. intros. apply IsomorphismDefinitions.eq_refl. Defined.

(* Lemma: string_to_mystring distributes over append *)
Lemma string_to_mystring_append : forall s1 s2,
  IsomorphismDefinitions.eq 
    (string_to_mystring (String.append s1 s2))
    (Imported.mystring_append (string_to_mystring s1) (string_to_mystring s2)).
Proof.
  fix IH 1.
  intros [|a1 s1] s2.
  - simpl. apply mystring_append_empty.
  - simpl String.append. simpl string_to_mystring.
    eapply eq_trans.
    + apply IsoEq.f_equal. apply IH.
    + apply eq_sym. apply mystring_append_string.
Defined.

(* Verify that expected_prefix matches "expected '" *)
Definition rocq_expected_prefix : String.string := "expected '"%string.
Definition rocq_expected_suffix : String.string := "'."%string.

Lemma expected_prefix_correct :
  IsomorphismDefinitions.eq (string_to_mystring rocq_expected_prefix) Imported.expected_prefix.
Proof. apply IsomorphismDefinitions.eq_refl. Defined.

Lemma expected_suffix_correct :
  IsomorphismDefinitions.eq (string_to_mystring rocq_expected_suffix) Imported.expected_suffix.
Proof. apply IsomorphismDefinitions.eq_refl. Defined.

(* Error message correspondence *)
Lemma error_msg_related : forall t,
  IsomorphismDefinitions.eq
    (string_to_mystring (String.append (String.append rocq_expected_prefix t) rocq_expected_suffix))
    (Imported.make_error_msg (string_to_mystring t)).
Proof.
  intros t.
  unfold Imported.make_error_msg.
  eapply eq_trans.
  { apply string_to_mystring_append. }
  apply IsoEq.f_equal2.
  - eapply eq_trans.
    { apply string_to_mystring_append. }
    apply IsoEq.f_equal2.
    + apply expected_prefix_correct.
    + apply IsomorphismDefinitions.eq_refl.
  - apply expected_suffix_correct.
Defined.

(* Helper to reduce the imported firstExpect when xs' = to xs *)
Lemma firstExpect_related : forall x1 x2 (hx : Iso x1 x2)
  (t : Original.LF_DOT_ImpParser.LF.ImpParser.token)
  (p : Original.LF_DOT_ImpParser.LF.ImpParser.parser x1)
  (p' : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
        imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod x2 (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)))
  (Hp : forall (x7 : Datatypes.list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x8 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
   rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x7 x8 ->
   rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso hx (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso))) (p x7) (p' x8))
  (xs : Datatypes.list Original.LF_DOT_ImpParser.LF.ImpParser.token),
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso hx (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
    (Original.LF_DOT_ImpParser.LF.ImpParser.firstExpect t p xs) 
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect 
       (Original_LF__DOT__ImpParser_LF_ImpParser_token_iso t)
       p'
       (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso xs)).
Proof.
  intros x1 x2 hx t p p' Hp xs.
  destruct xs as [|x xs_tail].
  - (* xs = nil *)
    unfold Original.LF_DOT_ImpParser.LF.ImpParser.firstExpect.
    unfold imported_Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect.
    unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect.
    simpl.
    constructor. simpl.
    apply IsoEq.f_equal.
    apply error_msg_related.
  - (* xs = x :: xs_tail *)
    unfold Original.LF_DOT_ImpParser.LF.ImpParser.firstExpect.
    unfold imported_Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect.
    unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect.
    simpl.
    destruct (String.string_dec x t) as [Heq_str | Hneq_str].
    + (* x = t *)
      destruct Heq_str.
      assert (H1 : Imported.mystring_eq (string_to_mystring x) (string_to_mystring x) = Imported.mybool_mytrue).
      { pose proof (eq_of_seq (string_eq_mystring_eq x x)) as H.
        rewrite String.eqb_refl in H. exact H. }
      rewrite H1. simpl.
      apply Hp.
      constructor. apply IsomorphismDefinitions.eq_refl.
    + (* x <> t *)
      assert (H1 : Imported.mystring_eq (string_to_mystring x) (string_to_mystring t) = Imported.mybool_myfalse).
      { pose proof (eq_of_seq (string_eq_mystring_eq x t)) as H.
        destruct (String.eqb x t) eqn:Eqb.
        - apply String.eqb_eq in Eqb. contradiction.
        - exact H. }
      rewrite H1. simpl.
      constructor. simpl.
      apply IsoEq.f_equal.
      apply error_msg_related.
Defined.

(* Now prove the main isomorphism *)
Instance Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_ImpParser.LF.ImpParser.token) (x4 : imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso x3 x4 ->
  forall (x5 : Original.LF_DOT_ImpParser.LF.ImpParser.parser x1)
    (x6 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
          imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod x2 (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token))),
  (forall (x7 : Datatypes.list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x8 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
   rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x7 x8 ->
   rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso hx (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso))) (x5 x7) (x6 x8)) ->
  forall (x7 : Datatypes.list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x8 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x7 x8 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso hx (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
    (Original.LF_DOT_ImpParser.LF.ImpParser.firstExpect x3 x5 x7) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect x4 x6 x8).
Proof.
  intros x1 x2 hx t t' Ht p p' Hp xs xs' Hxs.
  pose proof (proj_rel_iso Ht) as Ht'. pose proof (proj_rel_iso Hxs) as Hxs'.
  constructor.
  eapply eq_trans.
  { apply (proj_rel_iso (@firstExpect_related x1 x2 hx t p p' (fun xs0 xs0' Hxs0 => Hp xs0 xs0' Hxs0) xs)). }
  unfold imported_Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect.
  apply (IsoEq.f_equal3 (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect x2)).
  - exact Ht'.
  - apply IsomorphismDefinitions.eq_refl.
  - exact Hxs'.
Defined.

Instance: KnownConstant (@Original.LF_DOT_ImpParser.LF.ImpParser.firstExpect) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_ImpParser.LF.ImpParser.firstExpect) Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_ImpParser.LF.ImpParser.firstExpect) (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect) Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect_iso := {}.