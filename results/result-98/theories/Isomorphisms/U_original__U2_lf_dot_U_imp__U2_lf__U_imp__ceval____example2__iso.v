From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.__0__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_anum__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_casgn__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_cseq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_z__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__ceval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso Isomorphisms.U_s__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_ceval__example2 : imported_Original_LF__DOT__Imp_LF_Imp_ceval
    (imported_Original_LF__DOT__Imp_LF_Imp_CSeq (imported_Original_LF__DOT__Imp_LF_Imp_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_X (imported_Original_LF__DOT__Imp_LF_Imp_ANum imported_0))
       (imported_Original_LF__DOT__Imp_LF_Imp_CSeq
          (imported_Original_LF__DOT__Imp_LF_Imp_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S imported_0)))
          (imported_Original_LF__DOT__Imp_LF_Imp_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_Z (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S (imported_S imported_0))))))
    (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
    (fun x : imported_String_string =>
     imported_Original_LF__DOT__Maps_LF_Maps_t__update
       (fun x0 : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update
          (fun x1 : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x2 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x2) imported_Original_LF__DOT__Imp_LF_Imp_X imported_0
             x1)
          imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S imported_0) x0)
       imported_Original_LF__DOT__Imp_LF_Imp_Z (imported_S (imported_S imported_0)) x) := Imported.Original_LF__DOT__Imp_LF_Imp_ceval__example2.
Instance Original_LF__DOT__Imp_LF_Imp_ceval__example2_iso : rel_iso
    (Original_LF__DOT__Imp_LF_Imp_ceval_iso
       (Original_LF__DOT__Imp_LF_Imp_CSeq_iso (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_X_iso (Original_LF__DOT__Imp_LF_Imp_ANum_iso _0_iso))
          (Original_LF__DOT__Imp_LF_Imp_CSeq_iso (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_Y_iso (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso _0_iso)))
             (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_Z_iso (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso _0_iso))))))
       Original.LF_DOT_Imp.LF.Imp.empty_st (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
       (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) => Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx)
       (Original.LF_DOT_Maps.LF.Maps.t_update
          (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 0) Original.LF_DOT_Imp.LF.Imp.Y 1)
          Original.LF_DOT_Imp.LF.Imp.Z 2)
       (fun x : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update
          (fun x0 : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_t__update
             (fun x1 : imported_String_string =>
              imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x2 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x2) imported_Original_LF__DOT__Imp_LF_Imp_X
                imported_0 x1)
             imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S imported_0) x0)
          imported_Original_LF__DOT__Imp_LF_Imp_Z (imported_S (imported_S imported_0)) x)
       (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) =>
        unwrap_sprop
          (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso
             (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 0) Original.LF_DOT_Imp.LF.Imp.Y 1)
             (fun x : imported_String_string =>
              imported_Original_LF__DOT__Maps_LF_Maps_t__update
                (fun x0 : imported_String_string =>
                 imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x3 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x3) imported_Original_LF__DOT__Imp_LF_Imp_X
                   imported_0 x0)
                imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S imported_0) x)
             (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) =>
              {|
                unwrap_sprop :=
                  unwrap_sprop
                    (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 0)
                       (fun x : imported_String_string =>
                        imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x0)
                          imported_Original_LF__DOT__Imp_LF_Imp_X imported_0 x)
                       (fun (x5 : String.string) (x6 : imported_String_string) (hx1 : rel_iso String_string_iso x5 x6) =>
                        {|
                          unwrap_sprop :=
                            unwrap_sprop
                              (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso Original.LF_DOT_Imp.LF.Imp.empty_st
                                 (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
                                 (fun (x7 : String.string) (x8 : imported_String_string) (hx2 : rel_iso String_string_iso x7 x8) =>
                                  {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx2 |})
                                 Original_LF__DOT__Imp_LF_Imp_X_iso 0 imported_0 {| unwrap_sprop := _0_iso |} hx1)
                        |})
                       Original_LF__DOT__Imp_LF_Imp_Y_iso 1 (imported_S imported_0) {| unwrap_sprop := S_iso _0_iso |} hx0)
              |})
             Original_LF__DOT__Imp_LF_Imp_Z_iso 2 (imported_S (imported_S imported_0)) {| unwrap_sprop := S_iso (S_iso _0_iso) |} hx)))
    Original.LF_DOT_Imp.LF.Imp.ceval_example2 imported_Original_LF__DOT__Imp_LF_Imp_ceval__example2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.ceval_example2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_ceval__example2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.ceval_example2 Original_LF__DOT__Imp_LF_Imp_ceval__example2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.ceval_example2 Imported.Original_LF__DOT__Imp_LF_Imp_ceval__example2 Original_LF__DOT__Imp_LF_Imp_ceval__example2_iso := {}.