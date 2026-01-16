From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq. From LeanImport Require Import Lean. From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__csf__iso.
Definition imported_Original_LF__DOT__IndProp_LF_IndProp_cs : imported_nat -> imported_nat -> SProp := fun n m => imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__IndProp_LF_IndProp_csf n) m.
Instance Original_LF__DOT__IndProp_LF_IndProp_cs_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.cs x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_cs x2 x4). Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.cs := {}.
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_cs := {}.
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.cs Original_LF__DOT__IndProp_LF_IndProp_cs_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.cs Imported.Original_LF__DOT__IndProp_LF_IndProp_cs Original_LF__DOT__IndProp_LF_IndProp_cs_iso := {}.
