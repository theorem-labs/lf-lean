From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__option__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__prod__iso Isomorphisms.U_string__string__iso Isomorphisms.nat__iso.

(* manual_grade_for_fold_map := None *)
Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_manual__grade__for__fold__map : imported_Original_LF__DOT__Poly_LF_Poly_option (imported_Original_LF__DOT__Poly_LF_Poly_prod imported_nat imported_String_string) := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_manual__grade__for__fold__map.

(* manual_grade_for_fold_map := None in Original.v *)
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_Exercises_manual__grade__for__fold__map_iso : rel_iso (Original_LF__DOT__Poly_LF_Poly_option_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso nat_iso String_string_iso)) Original.LF_DOT_Poly.LF.Poly.Exercises.manual_grade_for_fold_map
    imported_Original_LF__DOT__Poly_LF_Poly_Exercises_manual__grade__for__fold__map.
Proof.
  constructor.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_Exercises_manual__grade__for__fold__map.
  unfold Original.LF_DOT_Poly.LF.Poly.Exercises.manual_grade_for_fold_map.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.manual_grade_for_fold_map := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_manual__grade__for__fold__map := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.manual_grade_for_fold_map Original_LF__DOT__Poly_LF_Poly_Exercises_manual__grade__for__fold__map_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.manual_grade_for_fold_map Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_manual__grade__for__fold__map Original_LF__DOT__Poly_LF_Poly_Exercises_manual__grade__for__fold__map_iso := {}.
