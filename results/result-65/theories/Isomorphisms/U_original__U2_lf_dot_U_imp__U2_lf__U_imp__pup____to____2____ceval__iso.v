From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.__0__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__ceval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__pup____to____n__iso Isomorphisms.U_s__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval : imported_Original_LF__DOT__Imp_LF_Imp_ceval imported_Original_LF__DOT__Imp_LF_Imp_pup__to__n
    (fun x : imported_String_string =>
     imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x0) imported_Original_LF__DOT__Imp_LF_Imp_X
       (imported_S (imported_S imported_0)) x)
    (fun x : imported_String_string =>
     imported_Original_LF__DOT__Maps_LF_Maps_t__update
       (fun x0 : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update
          (fun x1 : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_t__update
             (fun x2 : imported_String_string =>
              imported_Original_LF__DOT__Maps_LF_Maps_t__update
                (fun x3 : imported_String_string =>
                 imported_Original_LF__DOT__Maps_LF_Maps_t__update
                   (fun x4 : imported_String_string =>
                    imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x5 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x5) imported_Original_LF__DOT__Imp_LF_Imp_X
                      (imported_S (imported_S imported_0)) x4)
                   imported_Original_LF__DOT__Imp_LF_Imp_Y imported_0 x3)
                imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S imported_0)) x2)
             imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S imported_0) x1)
          imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S (imported_S imported_0))) x0)
       imported_Original_LF__DOT__Imp_LF_Imp_X imported_0 x) := Imported.Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval_iso : rel_iso
    (Original_LF__DOT__Imp_LF_Imp_ceval_iso Original_LF__DOT__Imp_LF_Imp_pup__to__n_iso (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 2)
       (fun x : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x0) imported_Original_LF__DOT__Imp_LF_Imp_X
          (imported_S (imported_S imported_0)) x)
       (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) =>
        unwrap_sprop
          (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso Original.LF_DOT_Imp.LF.Imp.empty_st (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
             (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) => {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx0 |})
             Original_LF__DOT__Imp_LF_Imp_X_iso 2%nat (imported_S (imported_S imported_0)) {| unwrap_sprop := S_iso (S_iso _0_iso) |} hx))
       (Original.LF_DOT_Maps.LF.Maps.t_update
          (Original.LF_DOT_Maps.LF.Maps.t_update
             (Original.LF_DOT_Maps.LF.Maps.t_update
                (Original.LF_DOT_Maps.LF.Maps.t_update
                   (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 2) Original.LF_DOT_Imp.LF.Imp.Y 0)
                   Original.LF_DOT_Imp.LF.Imp.Y 2)
                Original.LF_DOT_Imp.LF.Imp.X 1)
             Original.LF_DOT_Imp.LF.Imp.Y 3)
          Original.LF_DOT_Imp.LF.Imp.X 0)
       (fun x : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update
          (fun x0 : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_t__update
             (fun x1 : imported_String_string =>
              imported_Original_LF__DOT__Maps_LF_Maps_t__update
                (fun x2 : imported_String_string =>
                 imported_Original_LF__DOT__Maps_LF_Maps_t__update
                   (fun x3 : imported_String_string =>
                    imported_Original_LF__DOT__Maps_LF_Maps_t__update
                      (fun x4 : imported_String_string =>
                       imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x5 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x5)
                         imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S imported_0)) x4)
                      imported_Original_LF__DOT__Imp_LF_Imp_Y imported_0 x3)
                   imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S imported_0)) x2)
                imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S imported_0) x1)
             imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S (imported_S imported_0))) x0)
          imported_Original_LF__DOT__Imp_LF_Imp_X imported_0 x)
       (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) =>
        unwrap_sprop
          (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso
             (Original.LF_DOT_Maps.LF.Maps.t_update
                (Original.LF_DOT_Maps.LF.Maps.t_update
                   (Original.LF_DOT_Maps.LF.Maps.t_update
                      (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 2) Original.LF_DOT_Imp.LF.Imp.Y 0)
                      Original.LF_DOT_Imp.LF.Imp.Y 2)
                   Original.LF_DOT_Imp.LF.Imp.X 1)
                Original.LF_DOT_Imp.LF.Imp.Y 3)
             (fun x : imported_String_string =>
              imported_Original_LF__DOT__Maps_LF_Maps_t__update
                (fun x0 : imported_String_string =>
                 imported_Original_LF__DOT__Maps_LF_Maps_t__update
                   (fun x3 : imported_String_string =>
                    imported_Original_LF__DOT__Maps_LF_Maps_t__update
                      (fun x4 : imported_String_string =>
                       imported_Original_LF__DOT__Maps_LF_Maps_t__update
                         (fun x5 : imported_String_string =>
                          imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x6 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x6)
                            imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S imported_0)) x5)
                         imported_Original_LF__DOT__Imp_LF_Imp_Y imported_0 x4)
                      imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S imported_0)) x3)
                   imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S imported_0) x0)
                imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S (imported_S imported_0))) x)
             (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) =>
              {|
                unwrap_sprop :=
                  unwrap_sprop
                    (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso
                       (Original.LF_DOT_Maps.LF.Maps.t_update
                          (Original.LF_DOT_Maps.LF.Maps.t_update
                             (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 2)
                                Original.LF_DOT_Imp.LF.Imp.Y 0)
                             Original.LF_DOT_Imp.LF.Imp.Y 2)
                          Original.LF_DOT_Imp.LF.Imp.X 1)
                       (fun x : imported_String_string =>
                        imported_Original_LF__DOT__Maps_LF_Maps_t__update
                          (fun x0 : imported_String_string =>
                           imported_Original_LF__DOT__Maps_LF_Maps_t__update
                             (fun x5 : imported_String_string =>
                              imported_Original_LF__DOT__Maps_LF_Maps_t__update
                                (fun x6 : imported_String_string =>
                                 imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x7 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x7)
                                   imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S imported_0)) x6)
                                imported_Original_LF__DOT__Imp_LF_Imp_Y imported_0 x5)
                             imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S imported_0)) x0)
                          imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S imported_0) x)
                       (fun (x5 : String.string) (x6 : imported_String_string) (hx1 : rel_iso String_string_iso x5 x6) =>
                        {|
                          unwrap_sprop :=
                            unwrap_sprop
                              (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso
                                 (Original.LF_DOT_Maps.LF.Maps.t_update
                                    (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 2)
                                       Original.LF_DOT_Imp.LF.Imp.Y 0)
                                    Original.LF_DOT_Imp.LF.Imp.Y 2)
                                 (fun x : imported_String_string =>
                                  imported_Original_LF__DOT__Maps_LF_Maps_t__update
                                    (fun x0 : imported_String_string =>
                                     imported_Original_LF__DOT__Maps_LF_Maps_t__update
                                       (fun x7 : imported_String_string =>
                                        imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x8 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x8)
                                          imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S imported_0)) x7)
                                       imported_Original_LF__DOT__Imp_LF_Imp_Y imported_0 x0)
                                    imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S imported_0)) x)
                                 (fun (x7 : String.string) (x8 : imported_String_string) (hx2 : rel_iso String_string_iso x7 x8) =>
                                  {|
                                    unwrap_sprop :=
                                      unwrap_sprop
                                        (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso
                                           (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 2)
                                              Original.LF_DOT_Imp.LF.Imp.Y 0)
                                           (fun x : imported_String_string =>
                                            imported_Original_LF__DOT__Maps_LF_Maps_t__update
                                              (fun x0 : imported_String_string =>
                                               imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x9 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x9)
                                                 imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S imported_0)) x0)
                                              imported_Original_LF__DOT__Imp_LF_Imp_Y imported_0 x)
                                           (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) =>
                                            {|
                                              unwrap_sprop :=
                                                unwrap_sprop
                                                  (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso
                                                     (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 2)
                                                     (fun x : imported_String_string =>
                                                      imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x0)
                                                        imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S imported_0)) x)
                                                     (fun (x11 : String.string) (x12 : imported_String_string) (hx4 : rel_iso String_string_iso x11 x12) =>
                                                      {|
                                                        unwrap_sprop :=
                                                          unwrap_sprop
                                                            (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso Original.LF_DOT_Imp.LF.Imp.empty_st
                                                               (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
                                                               (fun (x13 : String.string) (x14 : imported_String_string) (hx5 : rel_iso String_string_iso x13 x14) =>
                                                                {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx5 |})
                                                               Original_LF__DOT__Imp_LF_Imp_X_iso 2%nat (imported_S (imported_S imported_0)) {| unwrap_sprop := S_iso (S_iso _0_iso) |} hx4)
                                                      |})
                                                     Original_LF__DOT__Imp_LF_Imp_Y_iso O imported_0 {| unwrap_sprop := _0_iso |} hx3)
                                            |})
                                           Original_LF__DOT__Imp_LF_Imp_Y_iso 2%nat (imported_S (imported_S imported_0)) {| unwrap_sprop := S_iso (S_iso _0_iso) |} hx2)
                                  |})
                                 Original_LF__DOT__Imp_LF_Imp_X_iso 1%nat (imported_S imported_0) {| unwrap_sprop := S_iso _0_iso |} hx1)
                        |})
                       Original_LF__DOT__Imp_LF_Imp_Y_iso 3%nat (imported_S (imported_S (imported_S imported_0))) {| unwrap_sprop := S_iso (S_iso (S_iso _0_iso)) |} hx0)
              |})
             Original_LF__DOT__Imp_LF_Imp_X_iso O imported_0 {| unwrap_sprop := _0_iso |} hx)))
    Original.LF_DOT_Imp.LF.Imp.pup_to_2_ceval imported_Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.pup_to_2_ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.pup_to_2_ceval Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.pup_to_2_ceval Imported.Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval_iso := {}.