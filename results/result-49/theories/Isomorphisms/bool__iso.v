From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_bool : Type := Imported.mybool.

Definition bool_to_imported (b : bool) : imported_bool :=
  match b with true => Imported.mybool_mytrue | false => Imported.mybool_myfalse end.

Definition bool_from_imported (b : imported_bool) : bool :=
  match b with Imported.mybool_mytrue => true | Imported.mybool_myfalse => false end.

Instance bool_iso : Iso bool imported_bool.
Proof.
  exists bool_to_imported bool_from_imported.
  - intros [|]; apply IsomorphismDefinitions.eq_refl.
  - intros [|]; apply IsomorphismDefinitions.eq_refl.
Defined.

(* Compatibility lemmas for the ceval proof *)
Lemma bool_to_imported_negb : forall b, bool_to_imported (negb b) = Imported.bool_negb (bool_to_imported b).
Proof.
  intros [|]; reflexivity.
Qed.

Definition andb_i : imported_bool -> imported_bool -> imported_bool := Imported.bool_andb.
Instance: KnownConstant bool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.mybool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor bool bool_iso := {}.
Instance: IsoStatementProofBetween bool Imported.mybool bool_iso := {}.