From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__cons__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__count__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__nil__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__remove____all__iso Isomorphisms.U_s__iso.

(* Define imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all4 *)
Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all4 := 
  Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all4.

(* The composed isomorphism for the equality statement *)
Definition test_remove_all4_composed_iso :=
  Corelib_Init_Logic_eq_iso
    (Original_LF__DOT__Lists_LF_Lists_NatList_count_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))
       (Original_LF__DOT__Lists_LF_Lists_NatList_remove__all_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso _0_iso))
             (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso)
                (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))
                   (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso _0_iso))))
                      (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))
                         (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso)
                            (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso _0_iso))))
                               (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))
                                  (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso)
                                     (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))) Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso))))))))))))
    _0_iso.

(* Since both are proofs of an SProp, they are equal *)
Instance Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all4_iso : 
  rel_iso test_remove_all4_composed_iso 
    Original.LF_DOT_Lists.LF.Lists.NatList.test_remove_all4 
    imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all4.
Proof.
  constructor. unfold imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all4.
  (* The goal is an SProp equality. Since both sides inhabit an SProp type, 
     any two inhabitants are equal. *)
  apply IsomorphismDefinitions.eq_refl.
Qed.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.test_remove_all4 := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all4 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.test_remove_all4 Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all4_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.test_remove_all4 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all4 Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all4_iso := {}.
