From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

Definition imported_bool : Type := Imported.Stdlib_bool.

Definition bool_to_imported (b : bool) : imported_bool :=
  match b with
  | true => Imported.Stdlib_bool_true
  | false => Imported.Stdlib_bool_false
  end.

Definition imported_to_bool (b : imported_bool) : bool :=
  match b with
  | Imported.Stdlib_bool_true => true
  | Imported.Stdlib_bool_false => false
  end.

Instance bool_iso : Iso bool imported_bool.
Proof.
  apply Build_Iso with
    (to := fun b => match b with true => Imported.Stdlib_bool_true | false => Imported.Stdlib_bool_false end)
    (from := fun b => match b with Imported.Stdlib_bool_true => true | Imported.Stdlib_bool_false => false end).
  - intros x. destruct x; apply IsomorphismDefinitions.eq_refl.
  - intros x. destruct x; apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant bool := {}.
Instance: KnownConstant Imported.Stdlib_bool := {}.
Instance: IsoStatementProofFor bool bool_iso := {}.
Instance: IsoStatementProofBetween bool Imported.Stdlib_bool bool_iso := {}.
