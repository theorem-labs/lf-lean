From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.U_some__iso Isomorphisms.pair__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso Isomorphisms.U_original__U2_lf_dot_U_impU2_cevalU_fun__U2_lf__U_impU2_cevalU_fun__pup____to____n__iso Isomorphisms.U_original__U2_lf_dot_U_impU2_cevalU_fun__U2_lf__U_impU2_cevalU_fun__test____ceval__iso Isomorphisms.U_s__iso.

(* Helper definitions for 5 and 15 *)
Definition five_imported : imported_nat := imported_S (imported_S (imported_S (imported_S (imported_S imported_0)))).
Definition fifteen_imported : imported_nat := imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S imported_0)))))))))))))).

(* Helper isomorphisms for 5 and 15 *)
Definition five_iso : rel_iso nat_iso 5%nat five_imported := S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))).
Definition fifteen_iso : rel_iso nat_iso 15%nat fifteen_imported := S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))))))))).

Definition imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n__1 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval
       (fun x : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x0) imported_Original_LF__DOT__Imp_LF_Imp_X
          five_imported x)
       imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n)
    (imported_Some (imported_pair (imported_pair imported_0 fifteen_imported) imported_0)) := Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n__1.

Instance Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n__1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval_iso (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 5%nat)
          (fun x : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x0) imported_Original_LF__DOT__Imp_LF_Imp_X
             five_imported x)
          (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) =>
           unwrap_sprop
             (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso Original.LF_DOT_Imp.LF.Imp.empty_st (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
                (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) => {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx0 |})
                Original_LF__DOT__Imp_LF_Imp_X_iso 5%nat five_imported
                {| unwrap_sprop := five_iso |} hx))
          Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n_iso)
       (Some_iso (pair_iso (pair_iso _0_iso fifteen_iso) _0_iso)))
    Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.pup_to_n_1 imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n__1.
Admitted.

Instance: KnownConstant Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.pup_to_n_1 := {}. 
Instance: KnownConstant Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n__1 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.pup_to_n_1 Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n__1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.pup_to_n_1 Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n__1 Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n__1_iso := {}.
