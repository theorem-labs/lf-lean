From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.__0__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__U2_casgn__iso Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__U2_cif__iso Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__ceval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aid__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aminus__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aplus__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_ble__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_z__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso Isomorphisms.U_s__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.ex__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__Auto_LF_Auto_eauto__example : imported_ex
    (fun H : imported_String_string -> imported_nat =>
     imported_Original_LF__DOT__Auto_LF_Auto_Repeat_ceval
       (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CIf
          (imported_Original_LF__DOT__Imp_LF_Imp_BLe (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_X)
             (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_Y))
          (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_Z
             (imported_Original_LF__DOT__Imp_LF_Imp_AMinus (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_Y)
                (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_X)))
          (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_Y
             (imported_Original_LF__DOT__Imp_LF_Imp_APlus (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_X)
                (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_Z))))
       (fun H0 : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update
          (fun H1 : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H2 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H2) imported_Original_LF__DOT__Imp_LF_Imp_X
             (imported_S (imported_S imported_0)) H1)
          imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S imported_0) H0)
       (fun H0 : imported_String_string => H H0)) := Imported.Original_LF__DOT__Auto_LF_Auto_eauto__example.
Monomorphic Instance Original_LF__DOT__Auto_LF_Auto_eauto__example_iso : rel_iso
    (relax_Iso_Ts_Ps
       (ex_iso
          (fun s' : Original.LF_DOT_Imp.LF.Imp.state =>
           Original.LF_DOT_Auto.LF.Auto.Repeat.ceval
             (Original.LF_DOT_Auto.LF.Auto.Repeat.CIf
                (Original.LF_DOT_Imp.LF.Imp.BLe (Original.LF_DOT_Imp.LF.Imp.AId Original.LF_DOT_Imp.LF.Imp.X) (Original.LF_DOT_Imp.LF.Imp.AId Original.LF_DOT_Imp.LF.Imp.Y))
                (Original.LF_DOT_Auto.LF.Auto.Repeat.CAsgn Original.LF_DOT_Imp.LF.Imp.Z
                   (Original.LF_DOT_Imp.LF.Imp.AMinus (Original.LF_DOT_Imp.LF.Imp.AId Original.LF_DOT_Imp.LF.Imp.Y) (Original.LF_DOT_Imp.LF.Imp.AId Original.LF_DOT_Imp.LF.Imp.X)))
                (Original.LF_DOT_Auto.LF.Auto.Repeat.CAsgn Original.LF_DOT_Imp.LF.Imp.Y
                   (Original.LF_DOT_Imp.LF.Imp.APlus (Original.LF_DOT_Imp.LF.Imp.AId Original.LF_DOT_Imp.LF.Imp.X) (Original.LF_DOT_Imp.LF.Imp.AId Original.LF_DOT_Imp.LF.Imp.Z))))
             (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X (S (S O))) Original.LF_DOT_Imp.LF.Imp.Y (S O)) s')
          (fun H : imported_String_string -> imported_nat =>
           imported_Original_LF__DOT__Auto_LF_Auto_Repeat_ceval
             (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CIf
                (imported_Original_LF__DOT__Imp_LF_Imp_BLe (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_X)
                   (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_Y))
                (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_Z
                   (imported_Original_LF__DOT__Imp_LF_Imp_AMinus (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_Y)
                      (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_X)))
                (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_Y
                   (imported_Original_LF__DOT__Imp_LF_Imp_APlus (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_X)
                      (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_Z))))
             (fun H0 : imported_String_string =>
              imported_Original_LF__DOT__Maps_LF_Maps_t__update
                (fun H1 : imported_String_string =>
                 imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H2 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H2) imported_Original_LF__DOT__Imp_LF_Imp_X
                   (imported_S (imported_S imported_0)) H1)
                imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S imported_0) H0)
             (fun H0 : imported_String_string => H H0))
          (fun (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat) (hx : rel_iso (IsoArrow String_string_iso nat_iso) x1 x2) =>
           Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_iso
             (Original_LF__DOT__Auto_LF_Auto_Repeat_CIf_iso
                (Original_LF__DOT__Imp_LF_Imp_BLe_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_X_iso)
                   (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_Y_iso))
                (Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_Z_iso
                   (Original_LF__DOT__Imp_LF_Imp_AMinus_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_Y_iso)
                      (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_X_iso)))
                (Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_Y_iso
                   (Original_LF__DOT__Imp_LF_Imp_APlus_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_X_iso)
                      (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_Z_iso))))
             (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X (S (S O))) Original.LF_DOT_Imp.LF.Imp.Y (S O))
             (fun H : imported_String_string =>
              imported_Original_LF__DOT__Maps_LF_Maps_t__update
                (fun H0 : imported_String_string =>
                 imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H1 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H1) imported_Original_LF__DOT__Imp_LF_Imp_X
                   (imported_S (imported_S imported_0)) H0)
                imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S imported_0) H)
             (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) =>
              unwrap_sprop
                (Original_LF__DOT__Maps_LF_Maps_t__update_iso (IsoIso nat_iso) (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X (S (S O)))
                   (fun H : imported_String_string =>
                    imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0) imported_Original_LF__DOT__Imp_LF_Imp_X
                      (imported_S (imported_S imported_0)) H)
                   (fun (x5 : String.string) (x6 : imported_String_string) (hx1 : rel_iso String_string_iso x5 x6) =>
                    {|
                      unwrap_sprop :=
                        unwrap_sprop
                          (Original_LF__DOT__Maps_LF_Maps_t__update_iso (IsoIso nat_iso) Original.LF_DOT_Imp.LF.Imp.empty_st
                             (fun H : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H)
                             (fun (x7 : String.string) (x8 : imported_String_string) (hx2 : rel_iso String_string_iso x7 x8) => {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx2 |})
                             Original_LF__DOT__Imp_LF_Imp_X_iso (S (S O)) (imported_S (imported_S imported_0)) {| unwrap_sprop := S_iso (S_iso _0_iso) |} hx1)
                    |})
                   Original_LF__DOT__Imp_LF_Imp_Y_iso (S O) (imported_S imported_0) {| unwrap_sprop := S_iso _0_iso |} hx0))
             x1 (fun H : imported_String_string => x2 H) (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) => IsoUnFunND hx hx0))))
    Original.LF_DOT_Auto.LF.Auto.eauto_example imported_Original_LF__DOT__Auto_LF_Auto_eauto__example.
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.eauto_example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_eauto__example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.eauto_example Original_LF__DOT__Auto_LF_Auto_eauto__example_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.eauto_example Imported.Original_LF__DOT__Auto_LF_Auto_eauto__example Original_LF__DOT__Auto_LF_Auto_eauto__example_iso := {}.