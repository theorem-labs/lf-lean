From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aid__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_anum__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_ble__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_casgn__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_cif__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_cseq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_z__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__ceval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_ceval__example1 : imported_Original_LF__DOT__Imp_LF_Imp_ceval
    (imported_Original_LF__DOT__Imp_LF_Imp_CSeq
       (imported_Original_LF__DOT__Imp_LF_Imp_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_X (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S (imported_S imported_0))))
       (imported_Original_LF__DOT__Imp_LF_Imp_CIf
          (imported_Original_LF__DOT__Imp_LF_Imp_BLe (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_X)
             (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S imported_0)))
          (imported_Original_LF__DOT__Imp_LF_Imp_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S (imported_S (imported_S imported_0)))))
          (imported_Original_LF__DOT__Imp_LF_Imp_CAsgn imported_Original_LF__DOT__Imp_LF_Imp_Z
             (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S (imported_S (imported_S (imported_S imported_0))))))))
    (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
    (fun x : imported_String_string =>
     imported_Original_LF__DOT__Maps_LF_Maps_t__update
       (fun H : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0) imported_Original_LF__DOT__Imp_LF_Imp_X
          (imported_S (imported_S imported_0)) H)
       imported_Original_LF__DOT__Imp_LF_Imp_Z (imported_S (imported_S (imported_S (imported_S imported_0)))) x) := Imported.Original_LF__DOT__Imp_LF_Imp_ceval__example1.
Instance Original_LF__DOT__Imp_LF_Imp_ceval__example1_iso : rel_iso
    (Original_LF__DOT__Imp_LF_Imp_ceval_iso
       (Original_LF__DOT__Imp_LF_Imp_CSeq_iso (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_X_iso (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso _0_iso))))
          (Original_LF__DOT__Imp_LF_Imp_CIf_iso
             (Original_LF__DOT__Imp_LF_Imp_BLe_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_X_iso) (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso _0_iso)))
             (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_Y_iso (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso (S_iso _0_iso)))))
             (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_Z_iso (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso (S_iso (S_iso _0_iso))))))))
       Original.LF_DOT_Imp.LF.Imp.empty_st (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
       (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) => Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx)
       (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X (S (S O))) Original.LF_DOT_Imp.LF.Imp.Z (S (S (S (S O)))))
       (fun x : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update
          (fun H : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0) imported_Original_LF__DOT__Imp_LF_Imp_X
             (imported_S (imported_S imported_0)) H)
          imported_Original_LF__DOT__Imp_LF_Imp_Z (imported_S (imported_S (imported_S (imported_S imported_0)))) x)
       (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) =>
        unwrap_sprop
          (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X (S (S O)))
             (fun H : imported_String_string =>
              imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0) imported_Original_LF__DOT__Imp_LF_Imp_X
                (imported_S (imported_S imported_0)) H)
             (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) =>
              {|
                unwrap_sprop :=
                  unwrap_sprop
                    (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso Original.LF_DOT_Imp.LF.Imp.empty_st (fun H : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H)
                       (fun (x5 : String.string) (x6 : imported_String_string) (hx1 : rel_iso String_string_iso x5 x6) => {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx1 |})
                       Original_LF__DOT__Imp_LF_Imp_X_iso (S (S O)) (imported_S (imported_S imported_0)) {| unwrap_sprop := S_iso (S_iso _0_iso) |} hx0)
              |})
             Original_LF__DOT__Imp_LF_Imp_Z_iso (S (S (S (S O)))) (imported_S (imported_S (imported_S (imported_S imported_0)))) {| unwrap_sprop := S_iso (S_iso (S_iso (S_iso _0_iso))) |} hx)))
    Original.LF_DOT_Imp.LF.Imp.ceval_example1 imported_Original_LF__DOT__Imp_LF_Imp_ceval__example1.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.ceval_example1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_ceval__example1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.ceval_example1 Original_LF__DOT__Imp_LF_Imp_ceval__example1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.ceval_example1 Imported.Original_LF__DOT__Imp_LF_Imp_ceval__example1 Original_LF__DOT__Imp_LF_Imp_ceval__example1_iso := {}.