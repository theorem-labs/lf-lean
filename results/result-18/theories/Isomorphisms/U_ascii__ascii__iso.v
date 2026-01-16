From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.bool__iso.

Monomorphic Definition imported_Ascii_ascii : Type := Imported.Ascii_ascii.

(* Convert bool to mybool *)
Definition bool_to_mybool (b : bool) : Imported.mybool :=
  match b with
  | true => Imported.mybool_mytrue
  | false => Imported.mybool_myfalse
  end.

(* Convert mybool to bool *)
Definition mybool_to_bool (b : Imported.mybool) : bool :=
  match b with
  | Imported.mybool_mytrue => true
  | Imported.mybool_myfalse => false
  end.

(* Round trip lemmas *)
Lemma mybool_round_trip : forall b : Imported.mybool, bool_to_mybool (mybool_to_bool b) = b.
Proof.
  intros []; reflexivity.
Defined.

Lemma bool_round_trip : forall b : bool, mybool_to_bool (bool_to_mybool b) = b.
Proof.
  intros []; reflexivity.
Defined.

(* Conversion functions for ascii *)
Definition ascii_to_imported (a : Ascii.ascii) : imported_Ascii_ascii :=
  match a with
  | Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Imported.Ascii_ascii_Ascii
      (bool_to_mybool b0)
      (bool_to_mybool b1)
      (bool_to_mybool b2)
      (bool_to_mybool b3)
      (bool_to_mybool b4)
      (bool_to_mybool b5)
      (bool_to_mybool b6)
      (bool_to_mybool b7)
  end.

Definition imported_to_ascii (a : imported_Ascii_ascii) : Ascii.ascii :=
  Ascii.Ascii
    (mybool_to_bool (Imported.a____at___Solution__hyg846 a))
    (mybool_to_bool (Imported.a____at___Solution__hyg848 a))
    (mybool_to_bool (Imported.a____at___Solution__hyg850 a))
    (mybool_to_bool (Imported.a____at___Solution__hyg852 a))
    (mybool_to_bool (Imported.a____at___Solution__hyg854 a))
    (mybool_to_bool (Imported.a____at___Solution__hyg856 a))
    (mybool_to_bool (Imported.a____at___Solution__hyg858 a))
    (mybool_to_bool (Imported.a____at___Solution__hyg860 a)).

Lemma ascii_round_trip : forall a : Ascii.ascii, imported_to_ascii (ascii_to_imported a) = a.
Proof.
  intros [b0 b1 b2 b3 b4 b5 b6 b7].
  unfold imported_to_ascii, ascii_to_imported. simpl.
  destruct b0, b1, b2, b3, b4, b5, b6, b7; reflexivity.
Defined.

Lemma imported_ascii_round_trip : forall a : imported_Ascii_ascii, ascii_to_imported (imported_to_ascii a) = a.
Proof.
  intros a.
  unfold ascii_to_imported, imported_to_ascii. simpl.
  destruct a as [b0 b1 b2 b3 b4 b5 b6 b7].
  simpl. destruct b0, b1, b2, b3, b4, b5, b6, b7; reflexivity.
Defined.

Monomorphic Instance Ascii_ascii_iso : Iso Ascii.ascii imported_Ascii_ascii.
Proof.
  refine {|
    to := ascii_to_imported;
    from := imported_to_ascii;
    to_from := _;
    from_to := _
  |}.
  - intro a. 
    apply (match imported_ascii_round_trip a in (_ = y) return IsomorphismDefinitions.eq (ascii_to_imported (imported_to_ascii a)) y with
           | Logic.eq_refl => IsomorphismDefinitions.eq_refl
           end).
  - intro a.
    apply (match ascii_round_trip a in (_ = y) return IsomorphismDefinitions.eq (imported_to_ascii (ascii_to_imported a)) y with
           | Logic.eq_refl => IsomorphismDefinitions.eq_refl
           end).
Defined.

Instance: KnownConstant Ascii.ascii := {}.
Instance: KnownConstant Imported.Ascii_ascii := {}.
Instance: IsoStatementProofFor Ascii.ascii Ascii_ascii_iso := {}.
Instance: IsoStatementProofBetween Ascii.ascii Imported.Ascii_ascii Ascii_ascii_iso := {}.
