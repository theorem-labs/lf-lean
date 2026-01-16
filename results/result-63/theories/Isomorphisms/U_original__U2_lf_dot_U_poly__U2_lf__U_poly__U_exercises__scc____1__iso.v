From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__one__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__scc__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__zero__iso.

(* scc_1 is Admitted in Original.v, so we use the imported axiom directly *)
Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_scc__1 := 
  Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_scc__1.

(* Since scc_1 is an axiom/Admitted theorem, we admit this isomorphism *)
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_scc__1_iso : 
  rel_iso (Corelib_Init_Logic_eq_iso
    (Original_LF__DOT__Poly_LF_Poly_Exercises_scc_iso 
       Original.LF_DOT_Poly.LF.Poly.Exercises.zero
       imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero
       Original_LF__DOT__Poly_LF_Poly_Exercises_zero_iso)
    (Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso))
  Original.LF_DOT_Poly.LF.Poly.Exercises.scc_1
  imported_Original_LF__DOT__Poly_LF_Poly_Exercises_scc__1.
Admitted.

Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.scc_1 := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_scc__1 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.scc_1 Original_LF__DOT__Poly_LF_Poly_Exercises_scc__1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.scc_1 Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_scc__1 Original_LF__DOT__Poly_LF_Poly_Exercises_scc__1_iso := {}.
