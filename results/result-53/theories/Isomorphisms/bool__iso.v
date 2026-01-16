From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_bool : Type := Imported.mybool.

Definition bool_to_imported (b : bool) : imported_bool :=
  match b with
  | true => Imported.mybool_true
  | false => Imported.mybool_false
  end.

Definition imported_to_bool (b : imported_bool) : bool :=
  match b with
  | Imported.mybool_true => true
  | Imported.mybool_false => false
  end.

Monomorphic Instance bool_iso : Iso bool imported_bool.
Proof.
  refine {|
    to := bool_to_imported;
    from := imported_to_bool;
    to_from := _;
    from_to := _
  |}.
  - intros [|]; apply IsomorphismDefinitions.eq_refl.
  - intros [|]; apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant bool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.mybool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor bool bool_iso := {}.
Instance: IsoStatementProofBetween bool Imported.mybool bool_iso := {}.