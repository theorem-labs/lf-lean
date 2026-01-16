From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import String Ascii.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)

(* Helper to convert standard equality to SProp equality *)
Lemma prop_to_sprop_eq : forall {A : Type} (a b : A), a = b -> IsomorphismDefinitions.eq a b.
Proof. intros A a b H. subst b. exact IsomorphismDefinitions.eq_refl. Qed.

(* bool <-> Stdlib_bool isomorphism *)
Definition bool_to_impbool (b : bool) : Imported.Stdlib_bool :=
  match b with
  | true => Imported.Stdlib_bool_true
  | false => Imported.Stdlib_bool_false
  end.

Definition impbool_to_bool (m : Imported.Stdlib_bool) : bool :=
  match m with
  | Imported.Stdlib_bool_true => true
  | Imported.Stdlib_bool_false => false
  end.

Lemma bool_impbool_roundtrip1 : forall b, impbool_to_bool (bool_to_impbool b) = b.
Proof. destruct b; reflexivity. Qed.

Lemma bool_impbool_roundtrip2 : forall m, bool_to_impbool (impbool_to_bool m) = m.
Proof. destruct m; reflexivity. Qed.

(* ascii <-> Ascii_ascii isomorphism *)
Definition ascii_to_myascii (a : Ascii.ascii) : Imported.Ascii_ascii :=
  match a with
  | Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
      Imported.Ascii_ascii_Ascii 
        (bool_to_impbool b0) (bool_to_impbool b1)
        (bool_to_impbool b2) (bool_to_impbool b3)
        (bool_to_impbool b4) (bool_to_impbool b5)
        (bool_to_impbool b6) (bool_to_impbool b7)
  end.

Definition myascii_to_ascii (m : Imported.Ascii_ascii) : Ascii.ascii :=
  Ascii.Ascii
    (impbool_to_bool (Imported.a____at___Solution__hyg624 m))
    (impbool_to_bool (Imported.a____at___Solution__hyg626 m))
    (impbool_to_bool (Imported.a____at___Solution__hyg628 m))
    (impbool_to_bool (Imported.a____at___Solution__hyg630 m))
    (impbool_to_bool (Imported.a____at___Solution__hyg632 m))
    (impbool_to_bool (Imported.a____at___Solution__hyg634 m))
    (impbool_to_bool (Imported.a____at___Solution__hyg636 m))
    (impbool_to_bool (Imported.a____at___Solution__hyg638 m)).

Lemma ascii_myascii_roundtrip1 : forall a, myascii_to_ascii (ascii_to_myascii a) = a.
Proof.
  destruct a as [b0 b1 b2 b3 b4 b5 b6 b7].
  unfold ascii_to_myascii, myascii_to_ascii. simpl.
  f_equal; apply bool_impbool_roundtrip1.
Qed.

Lemma ascii_myascii_roundtrip2 : forall m, ascii_to_myascii (myascii_to_ascii m) = m.
Proof.
  destruct m.
  unfold ascii_to_myascii, myascii_to_ascii. simpl.
  f_equal; apply bool_impbool_roundtrip2.
Qed.

(* string <-> String_string isomorphism *)
Definition imported_String_string : Type := Imported.String_string.

Fixpoint string_to_imported (s : string) : Imported.String_string :=
  match s with
  | EmptyString => Imported.String_string_EmptyString
  | String c rest => Imported.String_string_String (ascii_to_myascii c) (string_to_imported rest)
  end.

Fixpoint imported_to_string (m : Imported.String_string) : string :=
  match m with
  | Imported.String_string_EmptyString => EmptyString
  | Imported.String_string_String c rest => String (myascii_to_ascii c) (imported_to_string rest)
  end.

Lemma string_roundtrip1 : forall s, imported_to_string (string_to_imported s) = s.
Proof.
  fix IH 1. intros s. destruct s.
  - reflexivity.
  - simpl. f_equal. apply ascii_myascii_roundtrip1. apply IH.
Qed.

Lemma string_roundtrip2 : forall m, string_to_imported (imported_to_string m) = m.
Proof.
  fix IH 1. intros m. destruct m.
  - reflexivity.
  - simpl. f_equal. apply ascii_myascii_roundtrip2. apply IH.
Qed.

Instance String_string_iso : Iso String.string imported_String_string.
Proof.
  exists string_to_imported imported_to_string.
  - intro m. apply prop_to_sprop_eq. apply string_roundtrip2.
  - intro s. apply prop_to_sprop_eq. apply string_roundtrip1.
Defined.

Instance: KnownConstant String.string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.String_string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor String.string String_string_iso := {}.
Instance: IsoStatementProofBetween String.string Imported.String_string String_string_iso := {}.