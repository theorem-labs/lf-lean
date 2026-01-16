From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__leb__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_test__leb3 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_leb (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))) (imported_S (imported_S imported_0)))
    imported_Original_LF__DOT__Basics_LF_Basics_false := Imported.Original_LF__DOT__Basics_LF_Basics_test__leb3.
Instance Original_LF__DOT__Basics_LF_Basics_test__leb3_iso : rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_leb_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1 0 imported_0 _0_iso)))) (S_iso (S_iso _0_iso)))
       Original_LF__DOT__Basics_LF_Basics_false_iso)
    Original.LF_DOT_Basics.LF.Basics.test_leb3 imported_Original_LF__DOT__Basics_LF_Basics_test__leb3.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.test_leb3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_test__leb3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.test_leb3 Original_LF__DOT__Basics_LF_Basics_test__leb3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.test_leb3 Imported.Original_LF__DOT__Basics_LF_Basics_test__leb3 Original_LF__DOT__Basics_LF_Basics_test__leb3_iso := {}.