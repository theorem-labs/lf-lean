From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__app__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__cons__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__nil__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__app1 := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__app1.

(* test_app1 is Admitted in Original.v *)
Instance Original_LF__DOT__Lists_LF_Lists_NatList_test__app1_iso :
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso)
             (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso _0_iso))
                (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso _0_iso)))
                   Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso)))
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso _0_iso))))
             (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))
                Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso)))
       (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso)
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso _0_iso))
             (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso _0_iso)))
                (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso _0_iso))))
                   (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))
                      Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso))))))
    Original.LF_DOT_Lists.LF.Lists.NatList.test_app1 imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__app1.
Admitted.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.test_app1 := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__app1 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.test_app1 Original_LF__DOT__Lists_LF_Lists_NatList_test__app1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.test_app1 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__app1 Original_LF__DOT__Lists_LF_Lists_NatList_test__app1_iso := {}.
