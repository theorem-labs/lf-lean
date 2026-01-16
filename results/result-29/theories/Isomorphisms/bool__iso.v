From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_bool : Type := Imported.StdBool.
(* bool <-> StdBool isomorphism *)
Definition bool_to_imported (b : bool) : imported_bool :=
  match b with
  | true => Imported.StdBool_strue
  | false => Imported.StdBool_sfalse
  end.

Definition imported_to_bool (b : imported_bool) : bool :=
  match b with
  | Imported.StdBool_strue => true
  | Imported.StdBool_sfalse => false
  end.

Lemma bool_to_from : forall x, IsomorphismDefinitions.eq (bool_to_imported (imported_to_bool x)) x.
Proof. intros []; apply IsomorphismDefinitions.eq_refl. Qed.

Lemma bool_from_to : forall x, IsomorphismDefinitions.eq (imported_to_bool (bool_to_imported x)) x.
Proof. intros []; apply IsomorphismDefinitions.eq_refl. Qed.

Monomorphic Instance bool_iso : Iso bool imported_bool :=
  Build_Iso bool_to_imported imported_to_bool bool_to_from bool_from_to.
Instance: KnownConstant bool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.StdBool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor bool bool_iso := {}.
Instance: IsoStatementProofBetween bool Imported.StdBool bool_iso := {}.