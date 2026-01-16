From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.bool__iso.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_Ascii_ascii : Type := Imported.Ascii_ascii.

Definition ascii_to_imported (a : Ascii.ascii) : imported_Ascii_ascii :=
  match a with
  | Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Imported.Ascii_ascii_Ascii 
      (to bool_iso b0) (to bool_iso b1) (to bool_iso b2) (to bool_iso b3)
      (to bool_iso b4) (to bool_iso b5) (to bool_iso b6) (to bool_iso b7)
  end.

Definition imported_to_ascii (a : imported_Ascii_ascii) : Ascii.ascii :=
  match a with
  | Imported.Ascii_ascii_Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Ascii.Ascii 
      (from bool_iso b0) (from bool_iso b1) (from bool_iso b2) (from bool_iso b3)
      (from bool_iso b4) (from bool_iso b5) (from bool_iso b6) (from bool_iso b7)
  end.

Lemma mybool_to_from : forall b : Imported.mybool,
  IsomorphismDefinitions.eq (to bool_iso (from bool_iso b)) b.
Proof.
  intro b. destruct b; apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma mybool_from_to : forall b : bool,
  IsomorphismDefinitions.eq (from bool_iso (to bool_iso b)) b.
Proof.
  intro b. destruct b; apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma ascii_to_from : forall a : imported_Ascii_ascii,
  IsomorphismDefinitions.eq (ascii_to_imported (imported_to_ascii a)) a.
Proof.
  intro a. destruct a as [b0 b1 b2 b3 b4 b5 b6 b7]. simpl.
  destruct b0; destruct b1; destruct b2; destruct b3;
  destruct b4; destruct b5; destruct b6; destruct b7;
  apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma ascii_from_to : forall a : Ascii.ascii,
  IsomorphismDefinitions.eq (imported_to_ascii (ascii_to_imported a)) a.
Proof.
  intro a. destruct a as [b0 b1 b2 b3 b4 b5 b6 b7]. simpl.
  destruct b0; destruct b1; destruct b2; destruct b3;
  destruct b4; destruct b5; destruct b6; destruct b7;
  apply IsomorphismDefinitions.eq_refl.
Qed.

Instance Ascii_ascii_iso : Iso Ascii.ascii imported_Ascii_ascii :=
  Build_Iso ascii_to_imported imported_to_ascii ascii_to_from ascii_from_to.

Instance: KnownConstant Ascii.ascii := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Ascii_ascii := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Ascii.ascii Ascii_ascii_iso := {}.
Instance: IsoStatementProofBetween Ascii.ascii Imported.Ascii_ascii Ascii_ascii_iso := {}.