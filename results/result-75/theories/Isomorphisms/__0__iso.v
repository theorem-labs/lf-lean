From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_0 : imported_nat := Imported._0.
Monomorphic Instance _0_iso : rel_iso nat_iso (Datatypes.O) imported_0.
Proof.
  constructor. simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant (Datatypes.O) := {}.
Instance: KnownConstant Imported._0 := {}.
Instance: IsoStatementProofFor (Datatypes.O) _0_iso := {}.
Instance: IsoStatementProofBetween (Datatypes.O) Imported._0 _0_iso := {}.
