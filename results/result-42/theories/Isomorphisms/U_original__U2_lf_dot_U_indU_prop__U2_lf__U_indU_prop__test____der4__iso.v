From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_app__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_char__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_emptyU_str__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__c__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__derive__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__match____eps__iso.

(* test_der4 is Admitted in Original.v, so we axiomatize the isomorphism *)
(* The statement is: match_eps (derive c (App EmptyStr (Char c))) = true *)

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_test__der4 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__IndProp_LF_IndProp_match__eps
       (imported_Original_LF__DOT__IndProp_LF_IndProp_derive imported_Original_LF__DOT__IndProp_LF_IndProp_c
          (imported_Original_LF__DOT__IndProp_LF_IndProp_App (imported_Original_LF__DOT__IndProp_LF_IndProp_EmptyStr imported_Ascii_ascii)
             (imported_Original_LF__DOT__IndProp_LF_IndProp_Char imported_Original_LF__DOT__IndProp_LF_IndProp_c))))
    imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__IndProp_LF_IndProp_test__der4.

(* The isomorphism between the Prop equality (=) and SProp Corelib_Init_Logic_eq
   works because they are both proof-irrelevant *)
   
(* Define the composition of isomorphisms needed *)
Definition composed_match_eps_iso := Original_LF__DOT__IndProp_LF_IndProp_match__eps_iso
          (Original_LF__DOT__IndProp_LF_IndProp_derive_iso Original_LF__DOT__IndProp_LF_IndProp_c_iso
             (Original_LF__DOT__IndProp_LF_IndProp_App_iso (Original_LF__DOT__IndProp_LF_IndProp_EmptyStr_iso Ascii_ascii_iso)
                (Original_LF__DOT__IndProp_LF_IndProp_Char_iso Original_LF__DOT__IndProp_LF_IndProp_c_iso))).

Definition full_eq_iso := Corelib_Init_Logic_eq_iso composed_match_eps_iso Original_LF__DOT__Basics_LF_Basics_true_iso.

Instance Original_LF__DOT__IndProp_LF_IndProp_test__der4_iso : rel_iso
    {|
      to := to full_eq_iso;
      from := from full_eq_iso;
      to_from := to_from full_eq_iso;
      from_to := fun x => seq_p_of_t (from_to full_eq_iso x)
    |} Original.LF_DOT_IndProp.LF.IndProp.test_der4 imported_Original_LF__DOT__IndProp_LF_IndProp_test__der4.
Proof.
  (* Both sides are proofs of equalities, so they are proof-irrelevant *)
  (* The original and imported are both axioms (Admitted), so the isomorphism is allowed *)
Admitted.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.test_der4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_test__der4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.test_der4 Original_LF__DOT__IndProp_LF_IndProp_test__der4_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.test_der4 Imported.Original_LF__DOT__IndProp_LF_IndProp_test__der4 Original_LF__DOT__IndProp_LF_IndProp_test__der4_iso := {}.