From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.bool__iso.

Definition imported_false : imported_bool := Imported.mybool_myfalse.
Instance false_iso : rel_iso bool_iso false imported_false.
Proof.
  constructor; simpl.
  unfold imported_false.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.mybool_myfalse := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor false false_iso := {}.
Instance: IsoStatementProofBetween false Imported.mybool_myfalse false_iso := {}.