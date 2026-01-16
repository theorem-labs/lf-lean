From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_ge : imported_nat -> imported_nat -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_ge.

(* ge n m = le m n - so the iso follows from le_iso with swapped arguments *)
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_ge_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.ge x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_ge x2 x4).
Proof.
  intros x1 x2 Hx1 x3 x4 Hx3.
  unfold Original.LF_DOT_IndProp.LF.IndProp.ge.
  unfold imported_Original_LF__DOT__IndProp_LF_IndProp_ge.
  unfold Imported.Original_LF__DOT__IndProp_LF_IndProp_ge.
  (* ge x1 x3 = le x3 x1, and Imported ge x2 x4 = Imported le x4 x2 *)
  apply Original_LF__DOT__IndProp_LF_IndProp_le_iso; assumption.
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.ge := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_ge := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.ge Original_LF__DOT__IndProp_LF_IndProp_ge_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.ge Imported.Original_LF__DOT__IndProp_LF_IndProp_ge Original_LF__DOT__IndProp_LF_IndProp_ge_iso := {}.
