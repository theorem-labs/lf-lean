From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_lt : imported_nat -> imported_nat -> SProp := Imported.lt.

(* Admitting lt_iso - the Lean lt is defined via Imported.Original_LF__DOT__IndProp_LF_IndProp_le *)
Instance lt_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 ->
                  forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 ->
                  Iso (lt x1 x3) (imported_lt x2 x4).
Admitted.

Instance: KnownConstant lt := {}. 
Instance: KnownConstant Imported.lt := {}. 
Instance: IsoStatementProofFor lt lt_iso := {}.
Instance: IsoStatementProofBetween lt Imported.lt lt_iso := {}.
