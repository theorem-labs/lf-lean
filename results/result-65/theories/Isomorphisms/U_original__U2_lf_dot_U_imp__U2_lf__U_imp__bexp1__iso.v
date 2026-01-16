From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.__0__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aid__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_anum__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_band__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_ble__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_bnot__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_btrue__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__beval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso Isomorphisms.U_s__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_bexp1 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Imp_LF_Imp_beval
       (fun x : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x0) imported_Original_LF__DOT__Imp_LF_Imp_X
          (imported_S (imported_S (imported_S (iterate1 imported_S 2%nat imported_0)))) x)
       (imported_Original_LF__DOT__Imp_LF_Imp_BAnd imported_Original_LF__DOT__Imp_LF_Imp_BTrue
          (imported_Original_LF__DOT__Imp_LF_Imp_BNot
             (imported_Original_LF__DOT__Imp_LF_Imp_BLe (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_X)
                (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S (imported_S (imported_S (iterate1 imported_S 1%nat imported_0)))))))))
    imported_true := Imported.Original_LF__DOT__Imp_LF_Imp_bexp1.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_bexp1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Imp_LF_Imp_beval_iso (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 5)
          (fun x : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x0) imported_Original_LF__DOT__Imp_LF_Imp_X
             (imported_S (imported_S (imported_S (iterate1 imported_S 2%nat imported_0)))) x)
          (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) =>
           unwrap_sprop
             (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso Original.LF_DOT_Imp.LF.Imp.empty_st (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
                (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) => {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx0 |})
                Original_LF__DOT__Imp_LF_Imp_X_iso 5%nat (imported_S (imported_S (imported_S (iterate1 imported_S 2%nat imported_0))))
                {| unwrap_sprop := S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 2%nat O imported_0 _0_iso))) |} hx))
          (Original_LF__DOT__Imp_LF_Imp_BAnd_iso Original_LF__DOT__Imp_LF_Imp_BTrue_iso
             (Original_LF__DOT__Imp_LF_Imp_BNot_iso
                (Original_LF__DOT__Imp_LF_Imp_BLe_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_X_iso)
                   (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1%nat O imported_0 _0_iso)))))))))
       true_iso)
    Original.LF_DOT_Imp.LF.Imp.bexp1 imported_Original_LF__DOT__Imp_LF_Imp_bexp1.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.bexp1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_bexp1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.bexp1 Original_LF__DOT__Imp_LF_Imp_bexp1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.bexp1 Imported.Original_LF__DOT__Imp_LF_Imp_bexp1 Original_LF__DOT__Imp_LF_Imp_bexp1_iso := {}.