From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.U_nat__mul__iso Isomorphisms.U_s__iso Isomorphisms.gt__iso.

Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_lia__succeed1 : forall x : imported_nat, imported_gt x imported_0 -> imported_gt (imported_Nat_mul x (imported_S (imported_S imported_0))) x := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_lia__succeed1.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_lia__succeed1_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : x1 > O) (x4 : imported_gt x2 imported_0),
  rel_iso (gt_iso hx _0_iso) x3 x4 ->
  rel_iso (gt_iso (Nat_mul_iso hx (S_iso (S_iso _0_iso))) hx) (Original.LF_DOT_AltAuto.LF.AltAuto.lia_succeed1 x1 x3) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_lia__succeed1 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.lia_succeed1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_lia__succeed1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.lia_succeed1 Original_LF__DOT__AltAuto_LF_AltAuto_lia__succeed1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.lia_succeed1 Imported.Original_LF__DOT__AltAuto_LF_AltAuto_lia__succeed1 Original_LF__DOT__AltAuto_LF_AltAuto_lia__succeed1_iso := {}.