From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.bool__iso.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)

(* Imported.String_string = Imported.Coqstring *)
Definition imported_String_string : Type := Imported.String_string.

(* We need to convert between String.string and Imported.Coqstring *)
(* First we need to convert Ascii.ascii <-> Imported.Coqascii *)

Definition ascii_to_coqascii (a : Ascii.ascii) : Imported.Coqascii :=
  match a with
  | Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Imported.Coqascii_Ascii
      (bool_to_coqbool b0) (bool_to_coqbool b1) (bool_to_coqbool b2) (bool_to_coqbool b3)
      (bool_to_coqbool b4) (bool_to_coqbool b5) (bool_to_coqbool b6) (bool_to_coqbool b7)
  end.

Definition coqascii_to_ascii (a : Imported.Coqascii) : Ascii.ascii :=
  match a with
  | Imported.Coqascii_Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Ascii.Ascii
      (coqbool_to_bool b0) (coqbool_to_bool b1) (coqbool_to_bool b2) (coqbool_to_bool b3)
      (coqbool_to_bool b4) (coqbool_to_bool b5) (coqbool_to_bool b6) (coqbool_to_bool b7)
  end.

Fixpoint string_to_coqstring (s : String.string) : Imported.Coqstring :=
  match s with
  | String.EmptyString => Imported.Coqstring_EmptyString
  | String.String c rest => Imported.Coqstring_String (ascii_to_coqascii c) (string_to_coqstring rest)
  end.

Fixpoint coqstring_to_string (s : Imported.Coqstring) : String.string :=
  match s with
  | Imported.Coqstring_EmptyString => String.EmptyString
  | Imported.Coqstring_String c rest => String.String (coqascii_to_ascii c) (coqstring_to_string rest)
  end.

(* Prove roundtrip lemmas in SProp using IsomorphismDefinitions.eq *)
Lemma ascii_roundtrip1 : forall a, coqascii_to_ascii (ascii_to_coqascii a) = a.
Proof.
  destruct a as [b0 b1 b2 b3 b4 b5 b6 b7].
  simpl.
  destruct b0, b1, b2, b3, b4, b5, b6, b7; reflexivity.
Qed.

Lemma ascii_roundtrip2 : forall a, ascii_to_coqascii (coqascii_to_ascii a) = a.
Proof.
  destruct a as [b0 b1 b2 b3 b4 b5 b6 b7].
  simpl.
  destruct b0, b1, b2, b3, b4, b5, b6, b7; reflexivity.
Qed.

Lemma string_roundtrip1 : forall s : String.string, coqstring_to_string (string_to_coqstring s) = s.
Proof.
  intro s. induction s as [| c rest IH].
  - reflexivity.
  - simpl. 
    change (String.String (coqascii_to_ascii (ascii_to_coqascii c)) (coqstring_to_string (string_to_coqstring rest)) = String.String c rest).
    f_equal.
    + apply ascii_roundtrip1.
    + apply IH.
Defined.

Lemma string_roundtrip2 : forall s : Imported.Coqstring, string_to_coqstring (coqstring_to_string s) = s.
Proof.
  intro s. induction s as [| c rest IH].
  - reflexivity.
  - simpl.
    change (Imported.Coqstring_String (ascii_to_coqascii (coqascii_to_ascii c)) (string_to_coqstring (coqstring_to_string rest)) = Imported.Coqstring_String c rest).
    f_equal.
    + apply ascii_roundtrip2.
    + apply IH.
Defined.

(* Now prove the SProp version *)
Lemma string_roundtrip1_sprop : forall s, IsomorphismDefinitions.eq (coqstring_to_string (string_to_coqstring s)) s.
Proof.
  intro s.
  rewrite string_roundtrip1.
  apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma string_roundtrip2_sprop : forall s, IsomorphismDefinitions.eq (string_to_coqstring (coqstring_to_string s)) s.
Proof.
  intro s.
  rewrite string_roundtrip2.
  apply IsomorphismDefinitions.eq_refl.
Qed.

Instance String_string_iso : Iso String.string imported_String_string :=
  {| to := string_to_coqstring;
     from := coqstring_to_string;
     to_from := string_roundtrip2_sprop;
     from_to := string_roundtrip1_sprop
  |}.

Instance: KnownConstant String.string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.String_string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor String.string String_string_iso := {}.
Instance: IsoStatementProofBetween String.string Imported.String_string String_string_iso := {}.
