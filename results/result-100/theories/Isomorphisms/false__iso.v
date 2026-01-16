From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.bool__iso.

Definition imported_false : imported_bool := Imported.Coqbool_Coqfalse.
Instance false_iso : rel_iso bool_iso false imported_false.
Proof.
  constructor. simpl.
  unfold imported_false.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Coqbool_Coqfalse := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor false false_iso := {}.
Instance: IsoStatementProofBetween false Imported.Coqbool_Coqfalse false_iso := {}.