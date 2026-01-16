From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__cons__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__count__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__nil__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__remove____all__iso Isomorphisms.U_s__iso.

(* test_remove_all3 is Admitted in Original.v *)
(* Example test_remove_all3: count 4 (remove_all 5 [2;1;4;5;1;4]) = 2 *)
Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all3 := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all3.

(* Define the actual numbers needed *)
Definition nat5 : nat := S (S (S (S (S O)))).
Definition nat4 : nat := S (S (S (S O))).
Definition nat2 : nat := S (S O).
Definition nat1 : nat := S O.

Definition imported_nat5 : Imported.nat := Imported.nat_S (Imported.nat_S (Imported.nat_S (Imported.nat_S (Imported.nat_S Imported.nat_O)))).
Definition imported_nat4 : Imported.nat := Imported.nat_S (Imported.nat_S (Imported.nat_S (Imported.nat_S Imported.nat_O))).
Definition imported_nat2 : Imported.nat := Imported.nat_S (Imported.nat_S Imported.nat_O).
Definition imported_nat1 : Imported.nat := Imported.nat_S Imported.nat_O.

Instance nat5_iso : rel_iso nat_iso nat5 imported_nat5.
Proof. constructor. apply IsomorphismDefinitions.eq_refl. Defined.
Instance nat4_iso : rel_iso nat_iso nat4 imported_nat4.
Proof. constructor. apply IsomorphismDefinitions.eq_refl. Defined.
Instance nat2_iso : rel_iso nat_iso nat2 imported_nat2.
Proof. constructor. apply IsomorphismDefinitions.eq_refl. Defined.
Instance nat1_iso : rel_iso nat_iso nat1 imported_nat1.
Proof. constructor. apply IsomorphismDefinitions.eq_refl. Defined.

(* count 4 (remove_all 5 [2;1;4;5;1;4]) = 2 *)
Instance Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all3_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Lists_LF_Lists_NatList_count_iso nat4_iso
          (Original_LF__DOT__Lists_LF_Lists_NatList_remove__all_iso nat5_iso
             (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso nat2_iso
                (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso nat1_iso
                   (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso nat4_iso
                      (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso nat5_iso
                         (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso nat1_iso
                            (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso nat4_iso
                               Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso))))))))
       (S_iso (S_iso _0_iso)))
    Original.LF_DOT_Lists.LF.Lists.NatList.test_remove_all3 imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all3.
Proof.
  (* Both are axioms about Admitted theorems *)
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.test_remove_all3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.test_remove_all3 Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.test_remove_all3 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all3 Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__all3_iso := {}.