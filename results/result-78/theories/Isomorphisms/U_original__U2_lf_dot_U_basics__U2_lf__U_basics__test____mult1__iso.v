From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__mult__iso Isomorphisms.U_s__iso.

(* test_mult1: 3 * 3 = 9 (Admitted in Original.v) *)
Definition imported_Original_LF__DOT__Basics_LF_Basics_test__mult1 := Imported.Original_LF__DOT__Basics_LF_Basics_test__mult1.

(* Since test_mult1 is Admitted in Original.v, we admit the isomorphism *)
Instance Original_LF__DOT__Basics_LF_Basics_test__mult1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso 
       (Original_LF__DOT__Basics_LF_Basics_mult_iso 
          (S_iso (S_iso (S_iso _0_iso))) 
          (S_iso (S_iso (S_iso _0_iso))))
       (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso))))))))))
    Original.LF_DOT_Basics.LF.Basics.test_mult1 
    imported_Original_LF__DOT__Basics_LF_Basics_test__mult1.
Admitted.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.test_mult1 := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_test__mult1 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.test_mult1 Original_LF__DOT__Basics_LF_Basics_test__mult1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.test_mult1 Imported.Original_LF__DOT__Basics_LF_Basics_test__mult1 Original_LF__DOT__Basics_LF_Basics_test__mult1_iso := {}.
