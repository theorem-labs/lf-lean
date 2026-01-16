From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.U_s__iso Isomorphisms.le__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le__3__5 : imported_le (imported_S (imported_S (imported_S imported_0))) (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0)))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le__3__5.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le__3__5_iso : rel_iso (le_iso (S_iso (S_iso (S_iso _0_iso))) (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (S (S O)) O imported_0 _0_iso))))) Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le_3_5
    imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le__3__5.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le_3_5 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le__3__5 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le_3_5 Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le__3__5_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le_3_5 Imported.Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le__3__5 Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le__3__5_iso := {}.