From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__mult__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__one__iso.

(* mult_1 is Admitted in Original.v: mult one one = one *)
Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult__1 : 
  imported_Corelib_Init_Logic_eq
    (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
     imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult 
       (fun (x : Type) (x0 : x -> x) (x1 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x3 : x => x0 x3) x1)
       (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x1 : x => x0 x1) x3) 
       (fun x : x2 => x4 x) x6)
    (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) => 
     imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x : x2 => x4 x) x6).
Admitted.

(* Using Axiom for the complex isomorphism since mult_1 is itself admitted *)
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_mult__1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (IsoFun
          (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
           IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
          (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.one Original.LF_DOT_Poly.LF.Poly.Exercises.one)
          (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
           imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult (fun (x : Type) (x0 : x -> x) (x1 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x3 : x => x0 x3) x1)
             (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x1 : x => x0 x1) x3) (fun x : x2 => x4 x) x6)
          (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) => Original_LF__DOT__Poly_LF_Poly_Exercises_mult_iso _ _ Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso _ _ Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso))
       (IsoFun
          (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
           IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
          Original.LF_DOT_Poly.LF.Poly.Exercises.one (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x : x2 => x4 x) x6)
          (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) => Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso)))
    Original.LF_DOT_Poly.LF.Poly.Exercises.mult_1 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult__1.
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.mult_1 := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_mult__1 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.mult_1 Original_LF__DOT__Poly_LF_Poly_Exercises_mult__1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.mult_1 Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_mult__1 Original_LF__DOT__Poly_LF_Poly_Exercises_mult__1_iso := {}.
