From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__U2_anum__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__U2_aplus__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aeval__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_test__aeval1 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Imp_LF_Imp_AExp_aeval
       (imported_Original_LF__DOT__Imp_LF_Imp_AExp_APlus (imported_Original_LF__DOT__Imp_LF_Imp_AExp_ANum (imported_S (imported_S imported_0)))
          (imported_Original_LF__DOT__Imp_LF_Imp_AExp_ANum (imported_S (imported_S imported_0)))))
    (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))) := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_test__aeval1.
Instance Original_LF__DOT__Imp_LF_Imp_AExp_test__aeval1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Imp_LF_Imp_AExp_aeval_iso
          (Original_LF__DOT__Imp_LF_Imp_AExp_APlus_iso (Original_LF__DOT__Imp_LF_Imp_AExp_ANum_iso (S_iso (S_iso _0_iso))) (Original_LF__DOT__Imp_LF_Imp_AExp_ANum_iso (S_iso (S_iso _0_iso)))))
       (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1 0 imported_0 _0_iso)))))
    Original.LF_DOT_Imp.LF.Imp.AExp.test_aeval1 imported_Original_LF__DOT__Imp_LF_Imp_AExp_test__aeval1.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.test_aeval1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_test__aeval1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.test_aeval1 Original_LF__DOT__Imp_LF_Imp_AExp_test__aeval1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.test_aeval1 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_test__aeval1 Original_LF__DOT__Imp_LF_Imp_AExp_test__aeval1_iso := {}.