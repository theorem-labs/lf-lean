From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.cons__iso Isomorphisms.nil__iso Isomorphisms.__0__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_sminus__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_spush__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__s____execute__iso Isomorphisms.U_s__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_s__execute1 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Imp_LF_Imp_s__execute (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x) (imported_nil imported_nat)
       (imported_cons (imported_Original_LF__DOT__Imp_LF_Imp_SPush (imported_S (imported_S (imported_S (iterate1 imported_S 2%nat imported_0)))))
          (imported_cons (imported_Original_LF__DOT__Imp_LF_Imp_SPush (imported_S (imported_S (imported_S imported_0))))
             (imported_cons (imported_Original_LF__DOT__Imp_LF_Imp_SPush (imported_S imported_0))
                (imported_cons imported_Original_LF__DOT__Imp_LF_Imp_SMinus (imported_nil imported_Original_LF__DOT__Imp_LF_Imp_sinstr))))))
    (imported_cons (imported_S (imported_S imported_0)) (imported_cons (imported_S (imported_S (imported_S (iterate1 imported_S 2%nat imported_0)))) (imported_nil imported_nat))) := Imported.Original_LF__DOT__Imp_LF_Imp_s__execute1.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_s__execute1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Imp_LF_Imp_s__execute_iso Original.LF_DOT_Imp.LF.Imp.empty_st (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
          (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) => Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx) (nil_iso nat_iso)
          (cons_iso (Original_LF__DOT__Imp_LF_Imp_SPush_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 2%nat 0%nat imported_0 _0_iso)))))
             (cons_iso (Original_LF__DOT__Imp_LF_Imp_SPush_iso (S_iso (S_iso (S_iso _0_iso))))
                (cons_iso (Original_LF__DOT__Imp_LF_Imp_SPush_iso (S_iso _0_iso)) (cons_iso Original_LF__DOT__Imp_LF_Imp_SMinus_iso (nil_iso Original_LF__DOT__Imp_LF_Imp_sinstr_iso))))))
       (cons_iso (S_iso (S_iso _0_iso)) (cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 2%nat 0%nat imported_0 _0_iso)))) (nil_iso nat_iso))))
    Original.LF_DOT_Imp.LF.Imp.s_execute1 imported_Original_LF__DOT__Imp_LF_Imp_s__execute1.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.s_execute1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_s__execute1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.s_execute1 Original_LF__DOT__Imp_LF_Imp_s__execute1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.s_execute1 Imported.Original_LF__DOT__Imp_LF_Imp_s__execute1 Original_LF__DOT__Imp_LF_Imp_s__execute1_iso := {}.