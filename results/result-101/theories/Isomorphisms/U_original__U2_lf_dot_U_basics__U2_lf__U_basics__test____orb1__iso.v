From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__orb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_test__orb1 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_orb imported_Original_LF__DOT__Basics_LF_Basics_true imported_Original_LF__DOT__Basics_LF_Basics_false)
    imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Basics_LF_Basics_test__orb1.
Instance Original_LF__DOT__Basics_LF_Basics_test__orb1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_orb_iso Original_LF__DOT__Basics_LF_Basics_true_iso Original_LF__DOT__Basics_LF_Basics_false_iso)
       Original_LF__DOT__Basics_LF_Basics_true_iso)
    Original.LF_DOT_Basics.LF.Basics.test_orb1 imported_Original_LF__DOT__Basics_LF_Basics_test__orb1.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.test_orb1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_test__orb1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.test_orb1 Original_LF__DOT__Basics_LF_Basics_test__orb1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.test_orb1 Imported.Original_LF__DOT__Basics_LF_Basics_test__orb1 Original_LF__DOT__Basics_LF_Basics_test__orb1_iso := {}.