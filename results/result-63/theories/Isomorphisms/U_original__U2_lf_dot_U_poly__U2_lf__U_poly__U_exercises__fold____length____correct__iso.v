From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__fold____length__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length__correct : forall (x : Type) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length x0) (imported_Original_LF__DOT__Poly_LF_Poly_length x0) := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length__correct.
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length__correct_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length_iso hx0) (Original_LF__DOT__Poly_LF_Poly_length_iso hx0))
    (Original.LF_DOT_Poly.LF.Poly.Exercises.fold_length_correct x1 x3) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length__correct x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.fold_length_correct := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length__correct := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.fold_length_correct Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length__correct_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.fold_length_correct Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length__correct Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length__correct_iso := {}.