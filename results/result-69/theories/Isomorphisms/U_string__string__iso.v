From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From Stdlib Require Import Ascii String.
From IsomorphismChecker Require Original Imported.


Definition imported_String_string : Type := Imported.String_string.

(* Bool isomorphism *)
Definition bool_to_imported (b : Datatypes.bool) : Imported.Stdlib_bool :=
  match b with
  | true => Imported.Stdlib_bool_true
  | false => Imported.Stdlib_bool_false
  end.

Definition bool_from_imported (b : Imported.Stdlib_bool) : Datatypes.bool :=
  match b with
  | Imported.Stdlib_bool_true => true
  | Imported.Stdlib_bool_false => false
  end.

Lemma bool_to_from : forall b, bool_to_imported (bool_from_imported b) = b.
Proof. destruct b; reflexivity. Defined.

Lemma bool_from_to : forall b, bool_from_imported (bool_to_imported b) = b.
Proof. destruct b; reflexivity. Defined.

(* Ascii isomorphism *)
Definition ascii_to_imported (a : Ascii.ascii) : Imported.Ascii_ascii :=
  match a with
  | Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Imported.Ascii_ascii_Ascii (bool_to_imported b0) (bool_to_imported b1) 
                      (bool_to_imported b2) (bool_to_imported b3)
                      (bool_to_imported b4) (bool_to_imported b5)
                      (bool_to_imported b6) (bool_to_imported b7)
  end.

Definition ascii_from_imported (a : Imported.Ascii_ascii) : Ascii.ascii :=
  match a with
  | Imported.Ascii_ascii_Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Ascii.Ascii (bool_from_imported b0) (bool_from_imported b1)
                (bool_from_imported b2) (bool_from_imported b3)
                (bool_from_imported b4) (bool_from_imported b5)
                (bool_from_imported b6) (bool_from_imported b7)
  end.

(* Helper lemma for Ascii_ascii_Ascii with explicit Logic.eq *)
Lemma ascii_mk_eq : forall b0 b1 b2 b3 b4 b5 b6 b7 b0' b1' b2' b3' b4' b5' b6' b7' : Imported.Stdlib_bool,
  @Logic.eq _ b0 b0' -> @Logic.eq _ b1 b1' -> @Logic.eq _ b2 b2' -> @Logic.eq _ b3 b3' ->
  @Logic.eq _ b4 b4' -> @Logic.eq _ b5 b5' -> @Logic.eq _ b6 b6' -> @Logic.eq _ b7 b7' ->
  @Logic.eq _ (Imported.Ascii_ascii_Ascii b0 b1 b2 b3 b4 b5 b6 b7) (Imported.Ascii_ascii_Ascii b0' b1' b2' b3' b4' b5' b6' b7').
Proof.
  intros b0 b1 b2 b3 b4 b5 b6 b7 b0' b1' b2' b3' b4' b5' b6' b7'.
  intros H0 H1 H2 H3 H4 H5 H6 H7.
  destruct H0. destruct H1. destruct H2. destruct H3.
  destruct H4. destruct H5. destruct H6. destruct H7.
  reflexivity.
Defined.

Lemma ascii_to_from : forall a, ascii_to_imported (ascii_from_imported a) = a.
Proof.
  intro a.
  unfold ascii_to_imported, ascii_from_imported. simpl.
  apply ascii_mk_eq; apply bool_to_from.
Defined.

(* Helper lemma for Ascii with explicit Logic.eq *)
Lemma coq_ascii_eq : forall b0 b1 b2 b3 b4 b5 b6 b7 b0' b1' b2' b3' b4' b5' b6' b7' : Datatypes.bool,
  @Logic.eq _ b0 b0' -> @Logic.eq _ b1 b1' -> @Logic.eq _ b2 b2' -> @Logic.eq _ b3 b3' ->
  @Logic.eq _ b4 b4' -> @Logic.eq _ b5 b5' -> @Logic.eq _ b6 b6' -> @Logic.eq _ b7 b7' ->
  @Logic.eq _ (Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7) (Ascii.Ascii b0' b1' b2' b3' b4' b5' b6' b7').
Proof.
  intros.
  destruct H. destruct H0. destruct H1. destruct H2.
  destruct H3. destruct H4. destruct H5. destruct H6.
  reflexivity.
Defined.

Lemma ascii_from_to : forall a, ascii_from_imported (ascii_to_imported a) = a.
Proof.
  destruct a.
  unfold ascii_from_imported, ascii_to_imported. simpl.
  apply coq_ascii_eq; apply bool_from_to.
Defined.

(* String isomorphism *)
Fixpoint string_to_imported (s : Strings.String.string) : Imported.String_string :=
  match s with
  | Strings.String.EmptyString => Imported.String_string_EmptyString
  | Strings.String.String a s' => Imported.String_string_String (ascii_to_imported a) (string_to_imported s')
  end.

Fixpoint string_from_imported (s : Imported.String_string) : Strings.String.string :=
  match s with
  | Imported.String_string_EmptyString => Strings.String.EmptyString
  | Imported.String_string_String a s' => Strings.String.String (ascii_from_imported a) (string_from_imported s')
  end.

(* Helper lemma for Imported.String_string_String *)
Lemma imported_string_eq : forall (a a' : Imported.Ascii_ascii) s s',
  @Logic.eq _ a a' -> @Logic.eq _ s s' ->
  @Logic.eq _ (Imported.String_string_String a s) (Imported.String_string_String a' s').
Proof.
  intros. destruct H. destruct H0. reflexivity.
Defined.

(* Helper lemma for Coq string *)
Lemma coq_string_eq : forall a a' s s',
  @Logic.eq _ a a' -> @Logic.eq _ s s' ->
  @Logic.eq _ (Strings.String.String a s) (Strings.String.String a' s').
Proof.
  intros. destruct H. destruct H0. reflexivity.
Defined.

Lemma string_to_from : forall s, string_to_imported (string_from_imported s) = s.
Proof.
  fix IH 1.
  destruct s as [|a s'].
  - reflexivity.
  - simpl. apply imported_string_eq.
    + apply ascii_to_from.
    + apply IH.
Defined.

Lemma string_from_to : forall s, string_from_imported (string_to_imported s) = s.
Proof.
  fix IH 1.
  destruct s as [|a s'].
  - reflexivity.
  - simpl. apply coq_string_eq.
    + apply ascii_from_to.
    + apply IH.
Defined.

(* Convert from Logic.eq to IsomorphismDefinitions.eq *)
Lemma logic_eq_to_iso_eq : forall (A : Type) (x y : A), @Logic.eq A x y -> IsomorphismDefinitions.eq x y.
Proof.
  intros A x y H. destruct H. apply IsomorphismDefinitions.eq_refl.
Defined.

Instance String_string_iso : Iso String.string imported_String_string := {|
  to := string_to_imported;
  from := string_from_imported;
  to_from := fun x => logic_eq_to_iso_eq (string_to_from x);
  from_to := fun x => logic_eq_to_iso_eq (string_from_to x);
|}.

Instance: KnownConstant String.string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.String_string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor String.string String_string_iso := {}.
Instance: IsoStatementProofBetween String.string Imported.String_string String_string_iso := {}.
