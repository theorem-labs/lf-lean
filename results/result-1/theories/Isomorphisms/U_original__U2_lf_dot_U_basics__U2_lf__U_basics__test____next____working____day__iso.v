From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__next____working____day__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__saturday__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__tuesday__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_test__next__working__day : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Basics_LF_Basics_next__working__day (imported_Original_LF__DOT__Basics_LF_Basics_next__working__day imported_Original_LF__DOT__Basics_LF_Basics_saturday))
    imported_Original_LF__DOT__Basics_LF_Basics_tuesday := Imported.Original_LF__DOT__Basics_LF_Basics_test__next__working__day.
(* test_next_working_day is Admitted in Original.v, so we use an axiom for the isomorphism *)
Axiom Original_LF__DOT__Basics_LF_Basics_test__next__working__day_iso : rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_next__working__day_iso (Original_LF__DOT__Basics_LF_Basics_next__working__day_iso Original_LF__DOT__Basics_LF_Basics_saturday_iso))
       Original_LF__DOT__Basics_LF_Basics_tuesday_iso)
    Original.LF_DOT_Basics.LF.Basics.test_next_working_day imported_Original_LF__DOT__Basics_LF_Basics_test__next__working__day.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.test_next_working_day := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_test__next__working__day := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.test_next_working_day Original_LF__DOT__Basics_LF_Basics_test__next__working__day_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.test_next_working_day Imported.Original_LF__DOT__Basics_LF_Basics_test__next__working__day Original_LF__DOT__Basics_LF_Basics_test__next__working__day_iso := {}.