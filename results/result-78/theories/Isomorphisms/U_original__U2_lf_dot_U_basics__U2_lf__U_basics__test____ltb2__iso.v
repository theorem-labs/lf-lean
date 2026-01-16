From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__ltb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_s__iso.

(* test_ltb2: (ltb 2 4) = true *)
Definition imported_Original_LF__DOT__Basics_LF_Basics_test__ltb2 := Imported.Original_LF__DOT__Basics_LF_Basics_test__ltb2.

(* Since test_ltb2 is Admitted in Original.v, we admit the isomorphism *)
Instance Original_LF__DOT__Basics_LF_Basics_test__ltb2_iso : rel_iso
    (Corelib_Init_Logic_eq_iso 
       (Original_LF__DOT__Basics_LF_Basics_ltb_iso 
          (S_iso (S_iso _0_iso)) 
          (S_iso (S_iso (S_iso (S_iso _0_iso)))))
       Original_LF__DOT__Basics_LF_Basics_true_iso)
    Original.LF_DOT_Basics.LF.Basics.test_ltb2 
    imported_Original_LF__DOT__Basics_LF_Basics_test__ltb2.
Admitted.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.test_ltb2 := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_test__ltb2 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.test_ltb2 Original_LF__DOT__Basics_LF_Basics_test__ltb2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.test_ltb2 Imported.Original_LF__DOT__Basics_LF_Basics_test__ltb2 Original_LF__DOT__Basics_LF_Basics_test__ltb2_iso := {}.
