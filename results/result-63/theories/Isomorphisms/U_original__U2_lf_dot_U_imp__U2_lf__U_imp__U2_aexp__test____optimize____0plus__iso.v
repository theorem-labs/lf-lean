From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__U2_anum__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__U2_aplus__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__optimize____0plus__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_test__optimize__0plus : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus
       (imported_Original_LF__DOT__Imp_LF_Imp_AExp_APlus (imported_Original_LF__DOT__Imp_LF_Imp_AExp_ANum (imported_S (imported_S imported_0)))
          (imported_Original_LF__DOT__Imp_LF_Imp_AExp_APlus (imported_Original_LF__DOT__Imp_LF_Imp_AExp_ANum imported_0)
             (imported_Original_LF__DOT__Imp_LF_Imp_AExp_APlus (imported_Original_LF__DOT__Imp_LF_Imp_AExp_ANum imported_0) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_ANum (imported_S imported_0))))))
    (imported_Original_LF__DOT__Imp_LF_Imp_AExp_APlus (imported_Original_LF__DOT__Imp_LF_Imp_AExp_ANum (imported_S (imported_S imported_0)))
       (imported_Original_LF__DOT__Imp_LF_Imp_AExp_ANum (imported_S imported_0))) := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_test__optimize__0plus.
Instance Original_LF__DOT__Imp_LF_Imp_AExp_test__optimize__0plus_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus_iso
          (Original_LF__DOT__Imp_LF_Imp_AExp_APlus_iso (Original_LF__DOT__Imp_LF_Imp_AExp_ANum_iso (S_iso (S_iso _0_iso)))
             (Original_LF__DOT__Imp_LF_Imp_AExp_APlus_iso (Original_LF__DOT__Imp_LF_Imp_AExp_ANum_iso _0_iso)
                (Original_LF__DOT__Imp_LF_Imp_AExp_APlus_iso (Original_LF__DOT__Imp_LF_Imp_AExp_ANum_iso _0_iso) (Original_LF__DOT__Imp_LF_Imp_AExp_ANum_iso (S_iso _0_iso))))))
       (Original_LF__DOT__Imp_LF_Imp_AExp_APlus_iso (Original_LF__DOT__Imp_LF_Imp_AExp_ANum_iso (S_iso (S_iso _0_iso))) (Original_LF__DOT__Imp_LF_Imp_AExp_ANum_iso (S_iso _0_iso))))
    Original.LF_DOT_Imp.LF.Imp.AExp.test_optimize_0plus imported_Original_LF__DOT__Imp_LF_Imp_AExp_test__optimize__0plus.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.test_optimize_0plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_test__optimize__0plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.test_optimize_0plus Original_LF__DOT__Imp_LF_Imp_AExp_test__optimize__0plus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.test_optimize_0plus Imported.Original_LF__DOT__Imp_LF_Imp_AExp_test__optimize__0plus Original_LF__DOT__Imp_LF_Imp_AExp_test__optimize__0plus_iso := {}.