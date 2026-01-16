From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.cons__iso Isomorphisms.nil__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_sload__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_smult__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_splus__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_spush__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__s____execute__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_s__execute2 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Imp_LF_Imp_s__execute
       (fun x : imported_String_string =>
        imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H) imported_Original_LF__DOT__Imp_LF_Imp_X
          (imported_S (imported_S (imported_S imported_0))) x)
       (imported_cons (imported_S (imported_S (imported_S imported_0))) (imported_cons (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))) (imported_nil imported_nat)))
       (imported_cons (imported_Original_LF__DOT__Imp_LF_Imp_SPush (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))))
          (imported_cons (imported_Original_LF__DOT__Imp_LF_Imp_SLoad imported_Original_LF__DOT__Imp_LF_Imp_X)
             (imported_cons imported_Original_LF__DOT__Imp_LF_Imp_SMult (imported_cons imported_Original_LF__DOT__Imp_LF_Imp_SPlus (imported_nil imported_Original_LF__DOT__Imp_LF_Imp_sinstr))))))
    (imported_cons (imported_S (imported_S (imported_S (iterate1 imported_S 12 imported_0))))
       (imported_cons (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))) (imported_nil imported_nat))) := Imported.Original_LF__DOT__Imp_LF_Imp_s__execute2.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_s__execute2_iso : rel_iso
    (relax_Iso_Ts_Ps
       (Corelib_Init_Logic_eq_iso
          (Original_LF__DOT__Imp_LF_Imp_s__execute_iso (Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X (S (S (S O))))
             (fun x : imported_String_string =>
              imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun H : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H) imported_Original_LF__DOT__Imp_LF_Imp_X
                (imported_S (imported_S (imported_S imported_0))) x)
             (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) =>
              unwrap_sprop
                (Original_LF__DOT__Maps_LF_Maps_t__update_iso (IsoIso nat_iso) Original.LF_DOT_Imp.LF.Imp.empty_st
                   (fun H : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st H)
                   (fun (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) => {| unwrap_sprop := Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx0 |})
                   Original_LF__DOT__Imp_LF_Imp_X_iso (S (S (S O))) (imported_S (imported_S (imported_S imported_0))) {| unwrap_sprop := S_iso (S_iso (S_iso _0_iso)) |} hx))
             (cons_iso (S_iso (S_iso (S_iso _0_iso))) (cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1 O imported_0 _0_iso)))) (nil_iso nat_iso)))
             (cons_iso (Original_LF__DOT__Imp_LF_Imp_SPush_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1 O imported_0 _0_iso)))))
                (cons_iso (Original_LF__DOT__Imp_LF_Imp_SLoad_iso Original_LF__DOT__Imp_LF_Imp_X_iso)
                   (cons_iso Original_LF__DOT__Imp_LF_Imp_SMult_iso (cons_iso Original_LF__DOT__Imp_LF_Imp_SPlus_iso (nil_iso Original_LF__DOT__Imp_LF_Imp_sinstr_iso))))))
          (cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 12 O imported_0 _0_iso))))
             (cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1 O imported_0 _0_iso)))) (nil_iso nat_iso)))))
    Original.LF_DOT_Imp.LF.Imp.s_execute2 imported_Original_LF__DOT__Imp_LF_Imp_s__execute2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.s_execute2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_s__execute2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.s_execute2 Original_LF__DOT__Imp_LF_Imp_s__execute2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.s_execute2 Imported.Original_LF__DOT__Imp_LF_Imp_s__execute2 Original_LF__DOT__Imp_LF_Imp_s__execute2_iso := {}.