From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__cnat__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__one__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__scc__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__two__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_scc__2 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_scc imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one)
    imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_scc__2.

(* scc_2 is Admitted in Original.v, so we can admit this isomorphism *)
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_scc__2_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Poly_LF_Poly_Exercises_scc_iso Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso)
       Original_LF__DOT__Poly_LF_Poly_Exercises_two_iso)
    Original.LF_DOT_Poly.LF.Poly.Exercises.scc_2 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_scc__2.
Admitted.

Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.scc_2 := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_scc__2 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.scc_2 Original_LF__DOT__Poly_LF_Poly_Exercises_scc__2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.scc_2 Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_scc__2 Original_LF__DOT__Poly_LF_Poly_Exercises_scc__2_iso := {}.
