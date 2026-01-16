From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.cons__iso Isomorphisms.nil__iso Isomorphisms.__0__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aid__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aminus__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_amult__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_anum__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_sload__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_sminus__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_smult__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_spush__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__s____compile__iso Isomorphisms.U_s__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_s__compile1 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Imp_LF_Imp_s__compile
       (imported_Original_LF__DOT__Imp_LF_Imp_AMinus (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_X)
          (imported_Original_LF__DOT__Imp_LF_Imp_AMult (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S (imported_S imported_0)))
             (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_Y))))
    (imported_cons (imported_Original_LF__DOT__Imp_LF_Imp_SLoad imported_Original_LF__DOT__Imp_LF_Imp_X)
       (imported_cons (imported_Original_LF__DOT__Imp_LF_Imp_SPush (imported_S (imported_S imported_0)))
          (imported_cons (imported_Original_LF__DOT__Imp_LF_Imp_SLoad imported_Original_LF__DOT__Imp_LF_Imp_Y)
             (imported_cons imported_Original_LF__DOT__Imp_LF_Imp_SMult (imported_cons imported_Original_LF__DOT__Imp_LF_Imp_SMinus (imported_nil imported_Original_LF__DOT__Imp_LF_Imp_sinstr)))))) := Imported.Original_LF__DOT__Imp_LF_Imp_s__compile1.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_s__compile1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Imp_LF_Imp_s__compile_iso
          (Original_LF__DOT__Imp_LF_Imp_AMinus_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_X_iso)
             (Original_LF__DOT__Imp_LF_Imp_AMult_iso (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso _0_iso))) (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_Y_iso))))
       (cons_iso (Original_LF__DOT__Imp_LF_Imp_SLoad_iso Original_LF__DOT__Imp_LF_Imp_X_iso)
          (cons_iso (Original_LF__DOT__Imp_LF_Imp_SPush_iso (S_iso (S_iso _0_iso)))
             (cons_iso (Original_LF__DOT__Imp_LF_Imp_SLoad_iso Original_LF__DOT__Imp_LF_Imp_Y_iso)
                (cons_iso Original_LF__DOT__Imp_LF_Imp_SMult_iso (cons_iso Original_LF__DOT__Imp_LF_Imp_SMinus_iso (nil_iso Original_LF__DOT__Imp_LF_Imp_sinstr_iso)))))))
    Original.LF_DOT_Imp.LF.Imp.s_compile1 imported_Original_LF__DOT__Imp_LF_Imp_s__compile1.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.s_compile1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_s__compile1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.s_compile1 Original_LF__DOT__Imp_LF_Imp_s__compile1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.s_compile1 Imported.Original_LF__DOT__Imp_LF_Imp_s__compile1 Original_LF__DOT__Imp_LF_Imp_s__compile1_iso := {}.