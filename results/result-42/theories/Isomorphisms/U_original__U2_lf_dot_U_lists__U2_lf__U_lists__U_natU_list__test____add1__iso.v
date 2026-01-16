From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__add__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__cons__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__count__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__nil__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__add1 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_count (imported_S imported_0)
       (imported_Original_LF__DOT__Lists_LF_Lists_NatList_add (imported_S imported_0)
          (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S imported_0)
             (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S (imported_S (imported_S (imported_S imported_0))))
                (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S imported_0) imported_Original_LF__DOT__Lists_LF_Lists_NatList_nil)))))
    (imported_S (imported_S (imported_S imported_0))) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__add1.

(* The isomorphism between two admitted axioms - admitted since Original.test_add1 is Admitted *)
Instance Original_LF__DOT__Lists_LF_Lists_NatList_test__add1_iso : rel_iso
    {|
      to :=
        Corelib_Init_Logic_eq_iso
          (Original_LF__DOT__Lists_LF_Lists_NatList_count_iso (S_iso _0_iso)
             (Original_LF__DOT__Lists_LF_Lists_NatList_add_iso (S_iso _0_iso)
                (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso)
                   (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso _0_iso))))
                      (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso) Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso)))))
          (S_iso (S_iso (S_iso _0_iso)));
      from :=
        from
          (Corelib_Init_Logic_eq_iso
             (Original_LF__DOT__Lists_LF_Lists_NatList_count_iso (S_iso _0_iso)
                (Original_LF__DOT__Lists_LF_Lists_NatList_add_iso (S_iso _0_iso)
                   (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso)
                      (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso _0_iso))))
                         (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso) Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso)))))
             (S_iso (S_iso (S_iso _0_iso))));
      to_from :=
        fun
          x : imported_Corelib_Init_Logic_eq
                (imported_Original_LF__DOT__Lists_LF_Lists_NatList_count (imported_S imported_0)
                   (imported_Original_LF__DOT__Lists_LF_Lists_NatList_add (imported_S imported_0)
                      (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S imported_0)
                         (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S (imported_S (imported_S (imported_S imported_0))))
                            (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S imported_0) imported_Original_LF__DOT__Lists_LF_Lists_NatList_nil)))))
                (imported_S (imported_S (imported_S imported_0))) =>
        to_from
          (Corelib_Init_Logic_eq_iso
             (Original_LF__DOT__Lists_LF_Lists_NatList_count_iso (S_iso _0_iso)
                (Original_LF__DOT__Lists_LF_Lists_NatList_add_iso (S_iso _0_iso)
                   (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso)
                      (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso _0_iso))))
                         (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso) Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso)))))
             (S_iso (S_iso (S_iso _0_iso))))
          x;
      from_to :=
        fun
          x : Original.LF_DOT_Lists.LF.Lists.NatList.count (Datatypes.S Datatypes.O)
                (Original.LF_DOT_Lists.LF.Lists.NatList.add (Datatypes.S Datatypes.O)
                   (Original.LF_DOT_Lists.LF.Lists.NatList.cons (Datatypes.S Datatypes.O)
                      (Original.LF_DOT_Lists.LF.Lists.NatList.cons (Datatypes.S (Datatypes.S (Datatypes.S (Datatypes.S Datatypes.O)))) (Original.LF_DOT_Lists.LF.Lists.NatList.cons (Datatypes.S Datatypes.O) Original.LF_DOT_Lists.LF.Lists.NatList.nil)))) =
              (Datatypes.S (Datatypes.S (Datatypes.S Datatypes.O))) =>
        seq_p_of_t
          (from_to
             (Corelib_Init_Logic_eq_iso
                (Original_LF__DOT__Lists_LF_Lists_NatList_count_iso (S_iso _0_iso)
                   (Original_LF__DOT__Lists_LF_Lists_NatList_add_iso (S_iso _0_iso)
                      (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso)
                         (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (S_iso _0_iso))))
                            (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso) Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso)))))
                (S_iso (S_iso (S_iso _0_iso))))
             x)
    |} Original.LF_DOT_Lists.LF.Lists.NatList.test_add1 imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__add1.
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.test_add1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__add1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.test_add1 Original_LF__DOT__Lists_LF_Lists_NatList_test__add1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.test_add1 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__add1 Original_LF__DOT__Lists_LF_Lists_NatList_test__add1_iso := {}.