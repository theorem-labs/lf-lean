From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_collatz____holds____for__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for__12 : imported_Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for (imported_S (imported_S (imported_S (iterate1 imported_S 9 imported_0)))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for__12.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for__12_iso : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 9 Datatypes.O imported_0 _0_iso)))))
    Original.LF_DOT_IndProp.LF.IndProp.Collatz_holds_for_12 imported_Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for__12.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Collatz_holds_for_12 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for__12 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Collatz_holds_for_12 Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for__12_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Collatz_holds_for_12 Imported.Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for__12 Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for__12_iso := {}.