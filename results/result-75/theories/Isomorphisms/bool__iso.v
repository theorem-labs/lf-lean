From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Monomorphic Definition imported_bool : Type := Imported.mybool.

(* Convert from Rocq bool to Imported.mybool *)
Monomorphic Definition bool_to_imported (b : bool) : imported_bool :=
  match b with
  | true => Imported.mybool_mytrue
  | false => Imported.mybool_myfalse
  end.

(* Convert from Imported.mybool to Rocq bool *)
Monomorphic Definition imported_to_bool (b : imported_bool) : bool :=
  match b with
  | Imported.mybool_mytrue => true
  | Imported.mybool_myfalse => false
  end.

(* Proof that to_from holds *)
Monomorphic Lemma bool_to_from : forall x : imported_bool, 
  IsomorphismDefinitions.eq (bool_to_imported (imported_to_bool x)) x.
Proof.
  intro x.
  destruct x; apply IsomorphismDefinitions.eq_refl.
Qed.

(* Proof that from_to holds *)
Monomorphic Lemma bool_from_to : forall x : bool,
  IsomorphismDefinitions.eq (imported_to_bool (bool_to_imported x)) x.
Proof.
  intro x. destruct x; apply IsomorphismDefinitions.eq_refl.
Qed.

Monomorphic Instance bool_iso : Iso bool imported_bool := {|
  to := bool_to_imported;
  from := imported_to_bool;
  to_from := bool_to_from;
  from_to := bool_from_to
|}.

Instance: KnownConstant bool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.mybool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Datatypes.bool bool_iso := {}.
Instance: IsoStatementProofBetween Datatypes.bool Imported.mybool bool_iso := {}.