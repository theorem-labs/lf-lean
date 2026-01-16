From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso *). *) (* for speed *)


Definition imported_String_string : Type := Imported.String_string.

(* Bool isomorphism *)
Definition mybool_to (b : bool) : Imported.mybool :=
  match b with
  | true => Imported.Original_LF__DOT__Basics_LF_Basics_bool_true
  | false => Imported.Original_LF__DOT__Basics_LF_Basics_bool_false
  end.

Definition mybool_from (b : Imported.mybool) : bool :=
  match b with
  | Imported.Original_LF__DOT__Basics_LF_Basics_bool_true => true
  | Imported.Original_LF__DOT__Basics_LF_Basics_bool_false => false
  end.

(* Ascii isomorphism *)
Definition ascii_to (a : Ascii.ascii) : Imported.Ascii_ascii :=
  match a with
  | Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Imported.Ascii_ascii_Ascii (mybool_to b0) (mybool_to b1) (mybool_to b2) (mybool_to b3)
                               (mybool_to b4) (mybool_to b5) (mybool_to b6) (mybool_to b7)
  end.

Definition ascii_from (a : Imported.Ascii_ascii) : Ascii.ascii :=
  match a with
  | Imported.Ascii_ascii_Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Ascii.Ascii (mybool_from b0) (mybool_from b1) (mybool_from b2) (mybool_from b3)
                (mybool_from b4) (mybool_from b5) (mybool_from b6) (mybool_from b7)
  end.

Instance String_string_iso : Iso String.string imported_String_string.
Proof.
  exists (fix f (s : String.string) : imported_String_string :=
            match s with
            | String.EmptyString => Imported.String_string_EmptyString
            | String.String c rest => Imported.String_string_String (ascii_to c) (f rest)
            end)
         (fix g (s : imported_String_string) : String.string :=
            match s with
            | Imported.String_string_EmptyString => String.EmptyString
            | Imported.String_string_String c rest => String.String (ascii_from c) (g rest)
            end).
  - fix IH 1. intros s.
    destruct s as [|c rest].
    + apply IsomorphismDefinitions.eq_refl.
    + simpl.
      apply (IsoEq.f_equal2 Imported.String_string_String).
      * destruct c as [b0 b1 b2 b3 b4 b5 b6 b7].
        simpl. unfold ascii_to, ascii_from.
        destruct b0; destruct b1; destruct b2; destruct b3;
        destruct b4; destruct b5; destruct b6; destruct b7;
        apply IsomorphismDefinitions.eq_refl.
      * apply IH.
  - fix IH 1. intros s.
    destruct s as [|c rest].
    + apply IsomorphismDefinitions.eq_refl.
    + simpl.
      apply (IsoEq.f_equal2 String.String).
      * destruct c as [b0 b1 b2 b3 b4 b5 b6 b7].
        simpl. unfold ascii_to, ascii_from.
        destruct b0; destruct b1; destruct b2; destruct b3;
        destruct b4; destruct b5; destruct b6; destruct b7;
        apply IsomorphismDefinitions.eq_refl.
      * apply IH.
Defined.
Instance: KnownConstant String.string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.String_string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor String.string String_string_iso := {}.
Instance: IsoStatementProofBetween String.string Imported.String_string String_string_iso := {}.