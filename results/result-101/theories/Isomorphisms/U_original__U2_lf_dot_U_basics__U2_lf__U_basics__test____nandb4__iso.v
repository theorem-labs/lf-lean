From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__nandb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_test__nandb4 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_nandb imported_Original_LF__DOT__Basics_LF_Basics_true imported_Original_LF__DOT__Basics_LF_Basics_true)
    imported_Original_LF__DOT__Basics_LF_Basics_false := Imported.Original_LF__DOT__Basics_LF_Basics_test__nandb4.
Instance Original_LF__DOT__Basics_LF_Basics_test__nandb4_iso : rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_nandb_iso Original_LF__DOT__Basics_LF_Basics_true_iso Original_LF__DOT__Basics_LF_Basics_true_iso)
       Original_LF__DOT__Basics_LF_Basics_false_iso)
    Original.LF_DOT_Basics.LF.Basics.test_nandb4 imported_Original_LF__DOT__Basics_LF_Basics_test__nandb4.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.test_nandb4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_test__nandb4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.test_nandb4 Original_LF__DOT__Basics_LF_Basics_test__nandb4_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.test_nandb4 Imported.Original_LF__DOT__Basics_LF_Basics_test__nandb4 Original_LF__DOT__Basics_LF_Basics_test__nandb4_iso := {}.