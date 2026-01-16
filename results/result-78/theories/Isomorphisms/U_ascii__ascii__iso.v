From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.bool__iso.

Definition imported_Ascii_ascii : Type := Imported.Coqascii.

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

Lemma ascii_roundtrip1 : forall a, coqascii_to_ascii (ascii_to_coqascii a) = a.
Proof.
  intro a. destruct a as [b0 b1 b2 b3 b4 b5 b6 b7].
  simpl.
  destruct b0, b1, b2, b3, b4, b5, b6, b7; reflexivity.
Qed.

Lemma ascii_roundtrip2 : forall a, ascii_to_coqascii (coqascii_to_ascii a) = a.
Proof.
  intro a. destruct a as [b0 b1 b2 b3 b4 b5 b6 b7].
  simpl.
  destruct b0, b1, b2, b3, b4, b5, b6, b7; reflexivity.
Qed.

Lemma ascii_roundtrip1_sprop : forall a, IsomorphismDefinitions.eq (coqascii_to_ascii (ascii_to_coqascii a)) a.
Proof.
  intro a. rewrite ascii_roundtrip1. apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma ascii_roundtrip2_sprop : forall a, IsomorphismDefinitions.eq (ascii_to_coqascii (coqascii_to_ascii a)) a.
Proof.
  intro a. rewrite ascii_roundtrip2. apply IsomorphismDefinitions.eq_refl.
Qed.

Instance Ascii_ascii_iso : Iso Ascii.ascii imported_Ascii_ascii :=
  {| to := ascii_to_coqascii;
     from := coqascii_to_ascii;
     to_from := ascii_roundtrip2_sprop;
     from_to := ascii_roundtrip1_sprop
  |}.

Instance: KnownConstant Ascii.ascii := {}.
Instance: KnownConstant Imported.Coqascii := {}.
Instance: IsoStatementProofFor Ascii.ascii Ascii_ascii_iso := {}.
Instance: IsoStatementProofBetween Ascii.ascii Imported.Coqascii Ascii_ascii_iso := {}.
