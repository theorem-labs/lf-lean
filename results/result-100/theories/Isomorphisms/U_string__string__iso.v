From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso.
(* Print Imported. *)


Definition imported_String_string : Type := Imported.String_string.

(* Convert between String.string and Imported.String_string *)
(* Note: String_string = mystring, so we use mystring constructors *)
Fixpoint string_to (s : String.string) : imported_String_string :=
  match s with
  | String.EmptyString => Imported.mystring_EmptyString
  | String.String c rest => Imported.mystring_String (ascii_to c) (string_to rest)
  end.

Fixpoint string_from (s : imported_String_string) : String.string :=
  match s with
  | Imported.mystring_EmptyString => String.EmptyString
  | Imported.mystring_String c rest => String.String (ascii_from c) (string_from rest)
  end.

Lemma string_to_from : forall s, IsomorphismDefinitions.eq (string_to (string_from s)) s.
Proof.
  fix IH 1.
  intros s. destruct s as [|c rest].
  - simpl. exact IsomorphismDefinitions.eq_refl.
  - simpl. destruct c as [b0 b1 b2 b3 b4 b5 b6 b7].
    destruct b0; destruct b1; destruct b2; destruct b3;
    destruct b4; destruct b5; destruct b6; destruct b7;
    simpl; exact (IsoEq.f_equal (fun r => Imported.mystring_String _ r) (IH rest)).
Qed.

Lemma string_from_to : forall s, IsomorphismDefinitions.eq (string_from (string_to s)) s.
Proof.
  fix IH 1.
  intros s. destruct s as [|c rest].
  - simpl. exact IsomorphismDefinitions.eq_refl.
  - simpl. destruct c as [b0 b1 b2 b3 b4 b5 b6 b7].
    destruct b0; destruct b1; destruct b2; destruct b3;
    destruct b4; destruct b5; destruct b6; destruct b7;
    simpl; exact (IsoEq.f_equal (fun r => String.String _ r) (IH rest)).
Qed.

Instance String_string_iso : Iso String.string imported_String_string :=
  Build_Iso string_to string_from string_to_from string_from_to.

(* Alias for compatibility with proofs using different naming *)
Definition string_to_imported := string_to.
Definition string_to_mystring := string_to.
Definition string_from_imported := string_from.

Instance: KnownConstant String.string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.String_string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor String.string String_string_iso := {}.
Instance: IsoStatementProofBetween String.string Imported.String_string String_string_iso := {}.