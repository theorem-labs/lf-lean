From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)

(* Token is string, which needs to be mapped to mystring *)
(* We need: bool <-> mybool, Ascii.ascii <-> Imported.ascii, string <-> mystring *)

(* bool <-> mybool isomorphism *)
Definition bool_to_mybool (b : Datatypes.bool) : Imported.mybool :=
  match b with
  | true => Imported.mybool_mytrue
  | false => Imported.mybool_myfalse
  end.

Definition mybool_to_bool (b : Imported.mybool) : Datatypes.bool :=
  match b with
  | Imported.mybool_mytrue => true
  | Imported.mybool_myfalse => false
  end.

Instance bool_mybool_iso : Iso Datatypes.bool Imported.mybool.
Proof.
  exists bool_to_mybool mybool_to_bool.
  - intros [|]; apply IsomorphismDefinitions.eq_refl.
  - intros [|]; apply IsomorphismDefinitions.eq_refl.
Defined.

(* Ascii.ascii <-> Imported.ascii isomorphism *)
(* Note: Imported.ascii is now a record with 8 fields *)
Definition ascii_to_imported (a : Ascii.ascii) : Imported.ascii :=
  match a with
  | Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Imported.ascii_Ascii (bool_to_mybool b0) (bool_to_mybool b1) 
                         (bool_to_mybool b2) (bool_to_mybool b3)
                         (bool_to_mybool b4) (bool_to_mybool b5)
                         (bool_to_mybool b6) (bool_to_mybool b7)
  end.

Definition imported_to_ascii (a : Imported.ascii) : Ascii.ascii :=
  Ascii.Ascii (mybool_to_bool (Imported.a____at___U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__expect__iso__hyg85 a))
              (mybool_to_bool (Imported.a____at___U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__expect__iso__hyg87 a))
              (mybool_to_bool (Imported.a____at___U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__expect__iso__hyg89 a))
              (mybool_to_bool (Imported.a____at___U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__expect__iso__hyg91 a))
              (mybool_to_bool (Imported.a____at___U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__expect__iso__hyg93 a))
              (mybool_to_bool (Imported.a____at___U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__expect__iso__hyg95 a))
              (mybool_to_bool (Imported.a____at___U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__expect__iso__hyg97 a))
              (mybool_to_bool (Imported.a____at___U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__expect__iso__hyg99 a)).

Instance ascii_iso : Iso Ascii.ascii Imported.ascii.
Proof.
  exists ascii_to_imported imported_to_ascii.
  - intros a.
    destruct a as [b0 b1 b2 b3 b4 b5 b6 b7].
    simpl.
    destruct b0; destruct b1; destruct b2; destruct b3;
    destruct b4; destruct b5; destruct b6; destruct b7;
    apply IsomorphismDefinitions.eq_refl.
  - intros [b0 b1 b2 b3 b4 b5 b6 b7].
    simpl.
    destruct b0; destruct b1; destruct b2; destruct b3;
    destruct b4; destruct b5; destruct b6; destruct b7;
    apply IsomorphismDefinitions.eq_refl.
Defined.

(* string <-> mystring isomorphism *)
Fixpoint string_to_mystring (s : String.string) : Imported.mystring :=
  match s with
  | String.EmptyString => Imported.mystring_EmptyString
  | String.String a s' => Imported.mystring_String (ascii_to_imported a) (string_to_mystring s')
  end.

Fixpoint mystring_to_string (s : Imported.mystring) : String.string :=
  match s with
  | Imported.mystring_EmptyString => String.EmptyString
  | Imported.mystring_String a s' => String.String (imported_to_ascii a) (mystring_to_string s')
  end.

Instance string_mystring_iso : Iso String.string Imported.mystring.
Proof.
  exists string_to_mystring mystring_to_string.
  - fix IH 1. intros s.
    destruct s as [|a s'].
    + apply IsomorphismDefinitions.eq_refl.
    + simpl.
      apply (IsoEq.f_equal2 Imported.mystring_String).
      * apply (to_from ascii_iso).
      * apply IH.
  - fix IH 1. intros s.
    destruct s as [|a s'].
    + apply IsomorphismDefinitions.eq_refl.
    + simpl.
      apply (IsoEq.f_equal2 String.String).
      * apply (from_to ascii_iso).
      * apply IH.
Defined.

(* Now the token isomorphism *)
Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_token : Type := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token.

(* Since token = string and imported token = mystring, we reuse string_mystring_iso *)
Instance Original_LF__DOT__ImpParser_LF_ImpParser_token_iso : Iso Original.LF_DOT_ImpParser.LF.ImpParser.token imported_Original_LF__DOT__ImpParser_LF_ImpParser_token.
Proof.
  unfold Original.LF_DOT_ImpParser.LF.ImpParser.token.
  unfold imported_Original_LF__DOT__ImpParser_LF_ImpParser_token.
  unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token.
  exact string_mystring_iso.
Defined.

Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.token := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.token Original_LF__DOT__ImpParser_LF_ImpParser_token_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.token Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token Original_LF__DOT__ImpParser_LF_ImpParser_token_iso := {}.