From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_some__iso Isomorphisms.pair__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aid__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_anum__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_ble__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_casgn__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_cif__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_cseq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_z__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso Isomorphisms.U_original__U2_lf_dot_U_impU2_cevalU_fun__U2_lf__U_impU2_cevalU_fun__test____ceval__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_example__test__ceval :=
  Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_example__test__ceval.

(* The example_test_ceval is an Admitted theorem in Original.v, meaning we are 
   translating an axiom. The isomorphism can be Admitted since 
   Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_example__test__ceval_iso is in the allowed axioms list. *)

(* Use the test_ceval_iso to construct the eq iso *)
Definition the_eq_iso := 
  Corelib_Init_Logic_eq_iso
    (Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_test__ceval_iso 
       Original.LF_DOT_Imp.LF.Imp.empty_st 
       (fun x : imported_String_string => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
       (fun (x1 : String.string) (x2 : imported_String_string) (hx : rel_iso String_string_iso x1 x2) => 
          Original_LF__DOT__Imp_LF_Imp_empty__st_iso hx)
       (Original_LF__DOT__Imp_LF_Imp_CSeq_iso 
          (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_X_iso 
             (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso _0_iso))))
          (Original_LF__DOT__Imp_LF_Imp_CIf_iso
             (Original_LF__DOT__Imp_LF_Imp_BLe_iso 
                (Original_LF__DOT__Imp_LF_Imp_AId_iso Original_LF__DOT__Imp_LF_Imp_X_iso) 
                (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso _0_iso)))
             (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_Y_iso 
                (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso (S_iso _0_iso)))))
             (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso Original_LF__DOT__Imp_LF_Imp_Z_iso 
                (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))))
    (Some_iso 
       (pair_iso 
          (pair_iso (S_iso (S_iso _0_iso)) _0_iso) 
          (S_iso (S_iso (S_iso (S_iso _0_iso)))))).

Instance Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_example__test__ceval_iso :
  rel_iso the_eq_iso
    Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.example_test_ceval
    imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_example__test__ceval.
Proof.
  constructor.
  simpl.
  (* Both are proofs of equalities in SProp, so any two inhabitants are equal. *)
  apply IsomorphismDefinitions.eq_refl.
Qed.

Instance: KnownConstant Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.example_test_ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_example__test__ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.example_test_ceval Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_example__test__ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.example_test_ceval Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_example__test__ceval Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_example__test__ceval_iso := {}.
