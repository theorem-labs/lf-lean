From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.__0__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__U2_casgn__iso Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__U2_cif__iso Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__U2_cseq__iso Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__ceval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aid__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_anum__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_ble__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_z__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso Isomorphisms.U_s__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__Auto_LF_Auto_ceval'__example1 : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_ceval
    (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq
       (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_X (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S (imported_S imported_0))))
       (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CIf
          (imported_Original_LF__DOT__Imp_LF_Imp_BLe (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_X)
             (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S imported_0)))
          (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S (imported_S (imported_S imported_0)))))
          (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_Z
             (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0))))))))
    (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
    (fun x : imported_String_string =>
     imported_Original_LF__DOT__Maps_LF_Maps_t__update
       (fun x0 : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x1 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x1) imported_Original_LF__DOT__Imp_LF_Imp_X
          (imported_S (imported_S imported_0)) x0)
       imported_Original_LF__DOT__Imp_LF_Imp_Z (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))) x) := Imported.Original_LF__DOT__Auto_LF_Auto_ceval'__example1.
Monomorphic Instance Original_LF__DOT__Auto_LF_Auto_ceval'__example1_iso : rel_iso
    (Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_iso
       (Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq_iso
          (Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_X_iso (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso _0_iso))))
          (Original_LF__DOT__Auto_LF_Auto_Repeat_CIf_iso
             (Original_LF__DOT__Imp_LF_Imp_BLe_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_X_iso) (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso _0_iso)))
             (Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_Y_iso (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso (S_iso _0_iso)))))
             (Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_Z_iso
                (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (S O) O imported_0 _0_iso))))))))
       Original.LF_DOT_Imp.LF.Imp.empty_st (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
       (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) => Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx)
       (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 2) Original.LF_DOT_Imp.LF.Imp.Z 4)
       (fun x : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update
          (fun x0 : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x1 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x1) imported_Original_LF__DOT__Imp_LF_Imp_X
             (imported_S (imported_S imported_0)) x0)
          imported_Original_LF__DOT__Imp_LF_Imp_Z (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))) x)
       (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) =>
        unwrap_sprop
          (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 2)
             (fun x : imported_String_string =>
              imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x0) imported_Original_LF__DOT__Imp_LF_Imp_X
                (imported_S (imported_S imported_0)) x)
             (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) =>
              {|
                unwrap_sprop :=
                  unwrap_sprop
                    (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso Original.LF_DOT_Imp.LF.Imp.empty_st (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
                       (fun (x5 : String.string) (x6 : imported_String_string) (hx1 : rel_iso String_string_iso x5 x6) => {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx1 |})
                       Original_LF__DOT__Imp_LF_Imp_X_iso 2 (imported_S (imported_S imported_0)) {| unwrap_sprop := S_iso (S_iso _0_iso) |} hx0)
              |})
             Original_LF__DOT__Imp_LF_Imp_Z_iso 4 (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0))))
             {| unwrap_sprop := S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (S O) O imported_0 _0_iso))) |} hx)))
    Original.LF_DOT_Auto.LF.Auto.ceval'_example1 imported_Original_LF__DOT__Auto_LF_Auto_ceval'__example1.
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.ceval'_example1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_ceval'__example1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.ceval'_example1 Original_LF__DOT__Auto_LF_Auto_ceval'__example1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.ceval'_example1 Imported.Original_LF__DOT__Auto_LF_Auto_ceval'__example1 Original_LF__DOT__Auto_LF_Auto_ceval'__example1_iso := {}.