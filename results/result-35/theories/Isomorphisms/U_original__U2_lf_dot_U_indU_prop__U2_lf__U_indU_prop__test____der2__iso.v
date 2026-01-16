From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_char__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__c__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__d__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__derive__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__match____eps__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_test__der2 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__IndProp_LF_IndProp_match__eps
       (imported_Original_LF__DOT__IndProp_LF_IndProp_derive imported_Original_LF__DOT__IndProp_LF_IndProp_c
          (imported_Original_LF__DOT__IndProp_LF_IndProp_Char imported_Original_LF__DOT__IndProp_LF_IndProp_d)))
    imported_Original_LF__DOT__Basics_LF_Basics_false := Imported.Original_LF__DOT__IndProp_LF_IndProp_test__der2.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_test__der2_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__IndProp_LF_IndProp_match__eps_iso
          (Original_LF__DOT__IndProp_LF_IndProp_derive_iso Original_LF__DOT__IndProp_LF_IndProp_c_iso (Original_LF__DOT__IndProp_LF_IndProp_Char_iso Original_LF__DOT__IndProp_LF_IndProp_d_iso)))
       Original_LF__DOT__Basics_LF_Basics_false_iso)
    Original.LF_DOT_IndProp.LF.IndProp.test_der2 imported_Original_LF__DOT__IndProp_LF_IndProp_test__der2.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.test_der2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_test__der2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.test_der2 Original_LF__DOT__IndProp_LF_IndProp_test__der2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.test_der2 Imported.Original_LF__DOT__IndProp_LF_IndProp_test__der2 Original_LF__DOT__IndProp_LF_IndProp_test__der2_iso := {}.