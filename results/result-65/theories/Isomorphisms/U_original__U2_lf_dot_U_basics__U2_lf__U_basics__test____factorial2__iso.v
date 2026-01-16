From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__factorial__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__mult__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_test__factorial2 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_factorial (imported_S (imported_S (imported_S (iterate1 imported_S 2%nat imported_0)))))
    (imported_Original_LF__DOT__Basics_LF_Basics_mult (imported_S (imported_S (imported_S (iterate1 imported_S 7%nat imported_0))))
       (imported_S (imported_S (imported_S (iterate1 imported_S 9%nat imported_0))))) := Imported.Original_LF__DOT__Basics_LF_Basics_test__factorial2.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_test__factorial2_iso : rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_factorial_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 2%nat O imported_0 _0_iso)))))
       (Original_LF__DOT__Basics_LF_Basics_mult_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 7%nat O imported_0 _0_iso))))
          (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 9%nat O imported_0 _0_iso))))))
    Original.LF_DOT_Basics.LF.Basics.test_factorial2 imported_Original_LF__DOT__Basics_LF_Basics_test__factorial2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.test_factorial2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_test__factorial2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.test_factorial2 Original_LF__DOT__Basics_LF_Basics_test__factorial2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.test_factorial2 Imported.Original_LF__DOT__Basics_LF_Basics_test__factorial2 Original_LF__DOT__Basics_LF_Basics_test__factorial2_iso := {}.