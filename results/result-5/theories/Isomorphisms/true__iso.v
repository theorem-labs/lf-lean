From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.bool__iso.

Definition imported_true : imported_bool := Imported.mybool_true.
Instance true_iso : @rel_iso bool imported_bool bool_iso true imported_true.
Proof.
  apply Build_rel_iso.
  unfold imported_true, Imported.mybool_true.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant true := {}.
Instance: KnownConstant Imported.mybool_true := {}.
Instance: IsoStatementProofFor true true_iso := {}.
Instance: IsoStatementProofBetween true Imported.mybool_true true_iso := {}.
