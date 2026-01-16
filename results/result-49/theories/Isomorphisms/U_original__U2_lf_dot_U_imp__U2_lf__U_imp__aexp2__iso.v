From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aid__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_amult__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aplus__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_z__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aeval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_aexp2 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Imp_LF_Imp_aeval
       (fun x : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update
          (fun H : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0) imported_Original_LF__DOT__Imp_LF_Imp_Y
             (imported_S (imported_S (imported_S (imported_S imported_0)))) H)
          imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S (imported_S (imported_S (imported_S imported_0))))) x)
       (imported_Original_LF__DOT__Imp_LF_Imp_APlus (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_Z)
          (imported_Original_LF__DOT__Imp_LF_Imp_AMult (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_X)
             (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_Y))))
    (imported_S
       (imported_S
          (imported_S
             (imported_S
                (imported_S
                   (imported_S
                      (imported_S
                         (imported_S
                            (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S imported_0)))))))))))))))))))) := Imported.Original_LF__DOT__Imp_LF_Imp_aexp2.
Instance Original_LF__DOT__Imp_LF_Imp_aexp2_iso : rel_iso
    {|
      to :=
        Corelib_Init_Logic_eq_iso
          (Original_LF__DOT__Imp_LF_Imp_aeval_iso
             (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.Y (S (S (S (S O))))) Original.LF_DOT_Imp.LF.Imp.X (S (S (S (S (S O))))))
             (fun x : imported_String_string =>
              imported_Original_LF__DOT__Maps_LF_Maps_t__update
                (fun H : imported_String_string =>
                 imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0) imported_Original_LF__DOT__Imp_LF_Imp_Y
                   (imported_S (imported_S (imported_S (imported_S imported_0)))) H)
                imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S (imported_S (imported_S (imported_S imported_0))))) x)
             (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) =>
              unwrap_sprop
                (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.Y (S (S (S (S O)))))
                   (fun H : imported_String_string =>
                    imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0) imported_Original_LF__DOT__Imp_LF_Imp_Y
                      (imported_S (imported_S (imported_S (imported_S imported_0)))) H)
                   (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) =>
                    {|
                      unwrap_sprop :=
                        unwrap_sprop
                          (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso Original.LF_DOT_Imp.LF.Imp.empty_st
                             (fun H : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H)
                             (fun (x5 : String.string) (x6 : imported_String_string) (hx1 : rel_iso String_string_iso x5 x6) => {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx1 |})
                             Original_LF__DOT__Imp_LF_Imp_Y_iso (S (S (S (S O)))) (imported_S (imported_S (imported_S (imported_S imported_0)))) {| unwrap_sprop := S_iso (S_iso (S_iso (S_iso _0_iso))) |} hx0)
                    |})
                   Original_LF__DOT__Imp_LF_Imp_X_iso (S (S (S (S (S O))))) (imported_S (imported_S (imported_S (imported_S (imported_S imported_0))))) {| unwrap_sprop := S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))) |}
                   hx))
             (Original_LF__DOT__Imp_LF_Imp_APlus_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_Z_iso)
                (Original_LF__DOT__Imp_LF_Imp_AMult_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_X_iso)
                   (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_Y_iso))))
          (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso))))))))))))))))))));
      from :=
        from
          (Corelib_Init_Logic_eq_iso
             (Original_LF__DOT__Imp_LF_Imp_aeval_iso
                (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.Y (S (S (S (S O))))) Original.LF_DOT_Imp.LF.Imp.X (S (S (S (S (S O))))))
                (fun x : imported_String_string =>
                 imported_Original_LF__DOT__Maps_LF_Maps_t__update
                   (fun H : imported_String_string =>
                    imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0) imported_Original_LF__DOT__Imp_LF_Imp_Y
                      (imported_S (imported_S (imported_S (imported_S imported_0)))) H)
                   imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S (imported_S (imported_S (imported_S imported_0))))) x)
                (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) =>
                 unwrap_sprop
                   (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.Y (S (S (S (S O)))))
                      (fun H : imported_String_string =>
                       imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0)
                         imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S (imported_S (imported_S imported_0)))) H)
                      (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) =>
                       {|
                         unwrap_sprop :=
                           unwrap_sprop
                             (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso Original.LF_DOT_Imp.LF.Imp.empty_st
                                (fun H : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H)
                                (fun (x5 : String.string) (x6 : imported_String_string) (hx1 : rel_iso String_string_iso x5 x6) => {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx1 |})
                                Original_LF__DOT__Imp_LF_Imp_Y_iso (S (S (S (S O)))) (imported_S (imported_S (imported_S (imported_S imported_0)))) {| unwrap_sprop := S_iso (S_iso (S_iso (S_iso _0_iso))) |} hx0)
                       |})
                      Original_LF__DOT__Imp_LF_Imp_X_iso (S (S (S (S (S O))))) (imported_S (imported_S (imported_S (imported_S (imported_S imported_0)))))
                      {| unwrap_sprop := S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))) |} hx))
                (Original_LF__DOT__Imp_LF_Imp_APlus_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_Z_iso)
                   (Original_LF__DOT__Imp_LF_Imp_AMult_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_X_iso)
                      (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_Y_iso))))
             (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))))))))))))))));
      to_from :=
        fun
          x : imported_Corelib_Init_Logic_eq
                (imported_Original_LF__DOT__Imp_LF_Imp_aeval
                   (fun x : imported_String_string =>
                    imported_Original_LF__DOT__Maps_LF_Maps_t__update
                      (fun H : imported_String_string =>
                       imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0)
                         imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S (imported_S (imported_S imported_0)))) H)
                      imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S (imported_S (imported_S (imported_S imported_0))))) x)
                   (imported_Original_LF__DOT__Imp_LF_Imp_APlus (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_Z)
                      (imported_Original_LF__DOT__Imp_LF_Imp_AMult (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_X)
                         (imported_Original_LF__DOT__Imp_LF_Imp_AId imported_Original_LF__DOT__Imp_LF_Imp_Y))))
                (imported_S
                   (imported_S
                      (imported_S
                         (imported_S
                            (imported_S
                               (imported_S
                                  (imported_S
                                     (imported_S
                                        (imported_S
                                           (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S imported_0)))))))))))))))))))) =>
        to_from
          (Corelib_Init_Logic_eq_iso
             (Original_LF__DOT__Imp_LF_Imp_aeval_iso
                (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.Y (S (S (S (S O))))) Original.LF_DOT_Imp.LF.Imp.X (S (S (S (S (S O))))))
                (fun x0 : imported_String_string =>
                 imported_Original_LF__DOT__Maps_LF_Maps_t__update
                   (fun H : imported_String_string =>
                    imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0) imported_Original_LF__DOT__Imp_LF_Imp_Y
                      (imported_S (imported_S (imported_S (imported_S imported_0)))) H)
                   imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S (imported_S (imported_S (imported_S imported_0))))) x0)
                (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) =>
                 unwrap_sprop
                   (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.Y (S (S (S (S O)))))
                      (fun H : imported_String_string =>
                       imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0)
                         imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S (imported_S (imported_S imported_0)))) H)
                      (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) =>
                       {|
                         unwrap_sprop :=
                           unwrap_sprop
                             (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso Original.LF_DOT_Imp.LF.Imp.empty_st
                                (fun H : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H)
                                (fun (x5 : String.string) (x6 : imported_String_string) (hx1 : rel_iso String_string_iso x5 x6) => {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx1 |})
                                Original_LF__DOT__Imp_LF_Imp_Y_iso (S (S (S (S O)))) (imported_S (imported_S (imported_S (imported_S imported_0)))) {| unwrap_sprop := S_iso (S_iso (S_iso (S_iso _0_iso))) |} hx0)
                       |})
                      Original_LF__DOT__Imp_LF_Imp_X_iso (S (S (S (S (S O))))) (imported_S (imported_S (imported_S (imported_S (imported_S imported_0)))))
                      {| unwrap_sprop := S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))) |} hx))
                (Original_LF__DOT__Imp_LF_Imp_APlus_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_Z_iso)
                   (Original_LF__DOT__Imp_LF_Imp_AMult_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_X_iso)
                      (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_Y_iso))))
             (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))))))))))))))))
          x;
      from_to :=
        fun
          x : Original.LF_DOT_Imp.LF.Imp.aeval
                (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.Y (S (S (S (S O))))) Original.LF_DOT_Imp.LF.Imp.X (S (S (S (S (S O))))))
                (Original.LF_DOT_Imp.LF.Imp.APlus (Original.LF_DOT_Imp.LF.Imp.AId Original.LF_DOT_Imp.LF.Imp.Z)
                   (Original.LF_DOT_Imp.LF.Imp.AMult (Original.LF_DOT_Imp.LF.Imp.AId Original.LF_DOT_Imp.LF.Imp.X) (Original.LF_DOT_Imp.LF.Imp.AId Original.LF_DOT_Imp.LF.Imp.Y))) =
              (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S O)))))))))))))))))))) =>
        seq_p_of_t
          (from_to
             (Corelib_Init_Logic_eq_iso
                (Original_LF__DOT__Imp_LF_Imp_aeval_iso
                   (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.Y (S (S (S (S O))))) Original.LF_DOT_Imp.LF.Imp.X (S (S (S (S (S O))))))
                   (fun x0 : imported_String_string =>
                    imported_Original_LF__DOT__Maps_LF_Maps_t__update
                      (fun H : imported_String_string =>
                       imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0)
                         imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S (imported_S (imported_S imported_0)))) H)
                      imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S (imported_S (imported_S (imported_S imported_0))))) x0)
                   (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) =>
                    unwrap_sprop
                      (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.Y (S (S (S (S O)))))
                         (fun H : imported_String_string =>
                          imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H0)
                            imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S (imported_S (imported_S imported_0)))) H)
                         (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) =>
                          {|
                            unwrap_sprop :=
                              unwrap_sprop
                                (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso Original.LF_DOT_Imp.LF.Imp.empty_st
                                   (fun H : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H)
                                   (fun (x5 : String.string) (x6 : imported_String_string) (hx1 : rel_iso String_string_iso x5 x6) =>
                                    {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx1 |})
                                   Original_LF__DOT__Imp_LF_Imp_Y_iso (S (S (S (S O)))) (imported_S (imported_S (imported_S (imported_S imported_0)))) {| unwrap_sprop := S_iso (S_iso (S_iso (S_iso _0_iso))) |} hx0)
                          |})
                         Original_LF__DOT__Imp_LF_Imp_X_iso (S (S (S (S (S O))))) (imported_S (imported_S (imported_S (imported_S (imported_S imported_0)))))
                         {| unwrap_sprop := S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))) |} hx))
                   (Original_LF__DOT__Imp_LF_Imp_APlus_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_Z_iso)
                      (Original_LF__DOT__Imp_LF_Imp_AMult_iso (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_X_iso)
                         (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_Y_iso))))
                (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))))))))))))))))
             x)
    |} Original.LF_DOT_Imp.LF.Imp.aexp2 imported_Original_LF__DOT__Imp_LF_Imp_aexp2.
Proof. apply IsomorphismDefinitions.eq_refl. Qed.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.aexp2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_aexp2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.aexp2 Original_LF__DOT__Imp_LF_Imp_aexp2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.aexp2 Imported.Original_LF__DOT__Imp_LF_Imp_aexp2 Original_LF__DOT__Imp_LF_Imp_aexp2_iso := {}.