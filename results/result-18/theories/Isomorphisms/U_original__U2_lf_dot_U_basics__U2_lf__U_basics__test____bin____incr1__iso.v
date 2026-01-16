From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_b0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_b1__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_z__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__incr__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_test__bin__incr1 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_incr (imported_Original_LF__DOT__Basics_LF_Basics_B1 imported_Original_LF__DOT__Basics_LF_Basics_Z))
    (imported_Original_LF__DOT__Basics_LF_Basics_B0 (imported_Original_LF__DOT__Basics_LF_Basics_B1 imported_Original_LF__DOT__Basics_LF_Basics_Z)) := Imported.Original_LF__DOT__Basics_LF_Basics_test__bin__incr1.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_test__bin__incr1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_incr_iso (Original_LF__DOT__Basics_LF_Basics_B1_iso Original_LF__DOT__Basics_LF_Basics_Z_iso))
       (Original_LF__DOT__Basics_LF_Basics_B0_iso (Original_LF__DOT__Basics_LF_Basics_B1_iso Original_LF__DOT__Basics_LF_Basics_Z_iso)))
    Original.LF_DOT_Basics.LF.Basics.test_bin_incr1 imported_Original_LF__DOT__Basics_LF_Basics_test__bin__incr1.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.test_bin_incr1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_test__bin__incr1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.test_bin_incr1 Original_LF__DOT__Basics_LF_Basics_test__bin__incr1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.test_bin_incr1 Imported.Original_LF__DOT__Basics_LF_Basics_test__bin__incr1 Original_LF__DOT__Basics_LF_Basics_test__bin__incr1_iso := {}.