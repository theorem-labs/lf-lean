From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.bool__iso.

Monomorphic Definition imported_Ascii_ascii : Type := Imported.Ascii_ascii.

Definition ascii_to_imported (c : Ascii.ascii) : imported_Ascii_ascii :=
  match c with
  | Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Imported.Ascii_ascii_Ascii
      (bool_to_imported b0) (bool_to_imported b1)
      (bool_to_imported b2) (bool_to_imported b3)
      (bool_to_imported b4) (bool_to_imported b5)
      (bool_to_imported b6) (bool_to_imported b7)
  end.

Definition imported_to_ascii (c : imported_Ascii_ascii) : Ascii.ascii :=
  match c with
  | Imported.Ascii_ascii_Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Ascii.Ascii
      (imported_to_bool b0) (imported_to_bool b1)
      (imported_to_bool b2) (imported_to_bool b3)
      (imported_to_bool b4) (imported_to_bool b5)
      (imported_to_bool b6) (imported_to_bool b7)
  end.

Lemma ascii_to_from : forall x, IsomorphismDefinitions.eq (ascii_to_imported (imported_to_ascii x)) x.
Proof.
  intros [b0 b1 b2 b3 b4 b5 b6 b7]. simpl.
  repeat (destruct b0; destruct b1; destruct b2; destruct b3; destruct b4; destruct b5; destruct b6; destruct b7; try apply IsomorphismDefinitions.eq_refl).
Qed.

Lemma ascii_from_to : forall x, IsomorphismDefinitions.eq (imported_to_ascii (ascii_to_imported x)) x.
Proof.
  intros [b0 b1 b2 b3 b4 b5 b6 b7]. simpl.
  repeat (destruct b0; destruct b1; destruct b2; destruct b3; destruct b4; destruct b5; destruct b6; destruct b7; try apply IsomorphismDefinitions.eq_refl).
Qed.

Monomorphic Instance Ascii_ascii_iso : Iso Ascii.ascii imported_Ascii_ascii :=
  Build_Iso ascii_to_imported imported_to_ascii ascii_to_from ascii_from_to.
Instance: KnownConstant Ascii.ascii := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Ascii_ascii := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Ascii.ascii Ascii_ascii_iso := {}.
Instance: IsoStatementProofBetween Ascii.ascii Imported.Ascii_ascii Ascii_ascii_iso := {}.