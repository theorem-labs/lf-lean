From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.bool__iso.
(* Print Imported. *)
(*Typeclasses Opaque rel_iso.*) (* for speed *)


Definition imported_Ascii_ascii : Type := Imported.Ascii_ascii.

Definition ascii_to (a : Ascii.ascii) : imported_Ascii_ascii :=
  match a with
  | Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Imported.Ascii_ascii_Ascii (bool_to_imported b0) (bool_to_imported b1) (bool_to_imported b2) (bool_to_imported b3)
                               (bool_to_imported b4) (bool_to_imported b5) (bool_to_imported b6) (bool_to_imported b7)
  end.

Definition ascii_from (a : imported_Ascii_ascii) : Ascii.ascii.
Proof.
  destruct a as [b0 b1 b2 b3 b4 b5 b6 b7].
  exact (Ascii.Ascii (imported_to_bool b0) (imported_to_bool b1) (imported_to_bool b2) (imported_to_bool b3)
                (imported_to_bool b4) (imported_to_bool b5) (imported_to_bool b6) (imported_to_bool b7)).
Defined.

Instance Ascii_ascii_iso : Iso Ascii.ascii imported_Ascii_ascii.
Proof.
  exists ascii_to ascii_from.
  - intros a. destruct a as [b0 b1 b2 b3 b4 b5 b6 b7].
    simpl. unfold ascii_to, ascii_from.
    destruct b0; destruct b1; destruct b2; destruct b3;
    destruct b4; destruct b5; destruct b6; destruct b7;
    apply IsomorphismDefinitions.eq_refl.
  - intros a. destruct a as [b0 b1 b2 b3 b4 b5 b6 b7].
    simpl. unfold ascii_to, ascii_from.
    destruct b0; destruct b1; destruct b2; destruct b3;
    destruct b4; destruct b5; destruct b6; destruct b7;
    apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Ascii.ascii := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Ascii_ascii := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Ascii.ascii Ascii_ascii_iso := {}.
Instance: IsoStatementProofBetween Ascii.ascii Imported.Ascii_ascii Ascii_ascii_iso := {}.
