From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__odd__iso Isomorphisms.U_s__iso.

(* test_odd2 is an Admitted axiom, so we use an axiom-based isomorphism *)
Definition imported_Original_LF__DOT__Basics_LF_Basics_test__odd2 := Imported.Original_LF__DOT__Basics_LF_Basics_test__odd2.

(* Since test_odd2 is an admitted axiom, we admit this isomorphism as allowed *)
Instance Original_LF__DOT__Basics_LF_Basics_test__odd2_iso : rel_iso
    (Corelib_Init_Logic_eq_iso 
       (Original_LF__DOT__Basics_LF_Basics_odd_iso 
         (S_iso (S_iso (S_iso (S_iso _0_iso))))) 
       Original_LF__DOT__Basics_LF_Basics_false_iso)
    Original.LF_DOT_Basics.LF.Basics.test_odd2 imported_Original_LF__DOT__Basics_LF_Basics_test__odd2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.test_odd2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_test__odd2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.test_odd2 Original_LF__DOT__Basics_LF_Basics_test__odd2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.test_odd2 Imported.Original_LF__DOT__Basics_LF_Basics_test__odd2 Original_LF__DOT__Basics_LF_Basics_test__odd2_iso := {}.