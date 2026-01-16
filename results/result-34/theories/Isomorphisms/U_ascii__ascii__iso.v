From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)

Definition imported_Ascii_ascii : Type := Imported.Ascii_ascii.

(* Convert from Stdlib bool to Imported Stdlib_bool *)
Definition stdlib_bool_to_imported (b : bool) : Imported.Stdlib_bool :=
  match b with
  | true => Imported.Stdlib_bool_true
  | false => Imported.Stdlib_bool_false
  end.

Definition imported_to_stdlib_bool (b : Imported.Stdlib_bool) : bool :=
  match b with
  | Imported.Stdlib_bool_true => true
  | Imported.Stdlib_bool_false => false
  end.

(* Build an isomorphism between Ascii.ascii and Imported.Ascii_ascii *)
Definition ascii_to : Ascii.ascii -> imported_Ascii_ascii :=
  fun a => match a with
           | Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
             Imported.Ascii_ascii_Ascii
               (stdlib_bool_to_imported b0)
               (stdlib_bool_to_imported b1)
               (stdlib_bool_to_imported b2)
               (stdlib_bool_to_imported b3)
               (stdlib_bool_to_imported b4)
               (stdlib_bool_to_imported b5)
               (stdlib_bool_to_imported b6)
               (stdlib_bool_to_imported b7)
           end.

Definition ascii_from : imported_Ascii_ascii -> Ascii.ascii :=
  Imported.Ascii_ascii_recl (fun _ => Ascii.ascii)
    (fun b0 b1 b2 b3 b4 b5 b6 b7 =>
      Ascii.Ascii
        (imported_to_stdlib_bool b0)
        (imported_to_stdlib_bool b1)
        (imported_to_stdlib_bool b2)
        (imported_to_stdlib_bool b3)
        (imported_to_stdlib_bool b4)
        (imported_to_stdlib_bool b5)
        (imported_to_stdlib_bool b6)
        (imported_to_stdlib_bool b7)).

(* from_to: for x : Ascii.ascii, ascii_from (ascii_to x) = x *)
Lemma ascii_from_to_aux : forall b0 b1 b2 b3 b4 b5 b6 b7,
  IsomorphismDefinitions.eq 
    (ascii_from (ascii_to (Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7))) 
    (Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7).
Proof.
  intros b0 b1 b2 b3 b4 b5 b6 b7.
  destruct b0, b1, b2, b3, b4, b5, b6, b7; exact IsomorphismDefinitions.eq_refl.
Defined.

Definition ascii_from_to : forall x, IsomorphismDefinitions.eq (ascii_from (ascii_to x)) x :=
  fun x => match x with
           | Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 => ascii_from_to_aux b0 b1 b2 b3 b4 b5 b6 b7
           end.

(* to_from: for x : imported_Ascii_ascii, ascii_to (ascii_from x) = x *)
Lemma ascii_to_from_aux : forall b0 b1 b2 b3 b4 b5 b6 b7,
  IsomorphismDefinitions.eq 
    (ascii_to (ascii_from (Imported.Ascii_ascii_Ascii b0 b1 b2 b3 b4 b5 b6 b7)))
    (Imported.Ascii_ascii_Ascii b0 b1 b2 b3 b4 b5 b6 b7).
Proof.
  intros b0 b1 b2 b3 b4 b5 b6 b7.
  destruct b0, b1, b2, b3, b4, b5, b6, b7; exact IsomorphismDefinitions.eq_refl.
Defined.

Definition ascii_to_from : forall x, IsomorphismDefinitions.eq (ascii_to (ascii_from x)) x :=
  Imported.Ascii_ascii_indl
    (fun x => IsomorphismDefinitions.eq (ascii_to (ascii_from x)) x)
    ascii_to_from_aux.

Instance Ascii_ascii_iso : Iso Ascii.ascii imported_Ascii_ascii :=
  @Build_Iso Ascii.ascii imported_Ascii_ascii ascii_to ascii_from ascii_to_from ascii_from_to.

Instance: KnownConstant Ascii.ascii := {}.
Instance: KnownConstant Imported.Ascii_ascii := {}.
Instance: IsoStatementProofFor Ascii.ascii Ascii_ascii_iso := {}.
Instance: IsoStatementProofBetween Ascii.ascii Imported.Ascii_ascii Ascii_ascii_iso := {}.
