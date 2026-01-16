From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__mult__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__plus__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__three__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__zero__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult__2 : imported_Corelib_Init_Logic_eq
    (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
     imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult (fun (x : Type) (x0 : x -> x) (x1 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x3 : x => x0 x3) x1)
       (fun (x : Type) (x0 : x -> x) (x3 : x) =>
        imported_Original_LF__DOT__Poly_LF_Poly_Exercises_plus (fun (x1 : Type) (x5 : x1 -> x1) (x7 : x1) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x8 : x1 => x5 x8) x7)
          (fun (x1 : Type) (x5 : x1 -> x1) (x7 : x1) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x8 : x1 => x5 x8) x7) (fun x1 : x => x0 x1) x3)
       (fun x : x2 => x4 x) x6)
    (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x : x2 => x4 x) x6) := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_mult__2.
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_mult__2_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (IsoFun
          (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
           IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
          (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.zero
             (Original.LF_DOT_Poly.LF.Poly.Exercises.plus Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.three))
          (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
           imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult (fun (x : Type) (x0 : x -> x) (x1 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x3 : x => x0 x3) x1)
             (fun (x : Type) (x0 : x -> x) (x3 : x) =>
              imported_Original_LF__DOT__Poly_LF_Poly_Exercises_plus (fun (x1 : Type) (x5 : x1 -> x1) (x7 : x1) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x8 : x1 => x5 x8) x7)
                (fun (x1 : Type) (x5 : x1 -> x1) (x7 : x1) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x8 : x1 => x5 x8) x7) (fun x1 : x => x0 x1) x3)
             (fun x : x2 => x4 x) x6)
          (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
           IsoFunND
             (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.zero
                (Original.LF_DOT_Poly.LF.Poly.Exercises.plus Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.three) x1)
             (fun (x4 : x2 -> x2) (x6 : x2) =>
              imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x5 : x => x0 x5) x3)
                (fun (x : Type) (x0 : x -> x) (x3 : x) =>
                 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_plus
                   (fun (x5 : Type) (x7 : x5 -> x5) (x8 : x5) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x9 : x5 => x7 x9) x8)
                   (fun (x5 : Type) (x7 : x5 -> x5) (x8 : x5) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x9 : x5 => x7 x9) x8) (fun x5 : x => x0 x5) x3)
                (fun x : x2 => x4 x) x6)
             (fun (x3 : x1 -> x1) (x4 : x2 -> x2) (hx0 : rel_iso (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) x3 x4) =>
              IsoFunND
                (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.zero
                   (Original.LF_DOT_Poly.LF.Poly.Exercises.plus Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.three) x1 x3)
                (fun x6 : x2 =>
                 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult (fun (x : Type) (x0 : x -> x) (x5 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x7 : x => x0 x7) x5)
                   (fun (x : Type) (x0 : x -> x) (x5 : x) =>
                    imported_Original_LF__DOT__Poly_LF_Poly_Exercises_plus
                      (fun (x7 : Type) (x8 : x7 -> x7) (x9 : x7) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x10 : x7 => x8 x10) x9)
                      (fun (x7 : Type) (x8 : x7 -> x7) (x9 : x7) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x10 : x7 => x8 x10) x9) (fun x7 : x => x0 x7) x5)
                   (fun x : x2 => x4 x) x6)
                (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort hx) x5 x6) =>
                 Original_LF__DOT__Poly_LF_Poly_Exercises_mult_iso Original.LF_DOT_Poly.LF.Poly.Exercises.zero
                   (fun (x : Type) (x0 : x -> x) (x7 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x8 : x => x0 x8) x7)
                   (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12)) 
                      (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                    Original_LF__DOT__Poly_LF_Poly_Exercises_zero_iso x9 (fun x : x8 => x10 x) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                   (Original.LF_DOT_Poly.LF.Poly.Exercises.plus Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.three)
                   (fun (x : Type) (x0 : x -> x) (x7 : x) =>
                    imported_Original_LF__DOT__Poly_LF_Poly_Exercises_plus
                      (fun (x8 : Type) (x9 : x8 -> x8) (x10 : x8) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x11 : x8 => x9 x11) x10)
                      (fun (x8 : Type) (x9 : x8 -> x8) (x10 : x8) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x11 : x8 => x9 x11) x10) (fun x8 : x => x0 x8) x7)
                   (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12)) 
                      (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                    Original_LF__DOT__Poly_LF_Poly_Exercises_plus_iso Original.LF_DOT_Poly.LF.Poly.Exercises.three
                      (fun (x : Type) (x0 : x -> x) (x13 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x14 : x => x0 x14) x13)
                      (fun (x13 x14 : Type) (hx5 : Iso x13 x14) (x15 : x13 -> x13) (x16 : x14 -> x14) (hx6 : forall (x17 : x13) (x18 : x14), rel_iso hx5 x17 x18 -> rel_iso hx5 (x15 x17) (x16 x18))
                         (x17 : x13) (x18 : x14) (hx7 : rel_iso hx5 x17 x18) =>
                       Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso x15 (fun x : x14 => x16 x) (fun (x19 : x13) (x20 : x14) (hx8 : rel_iso hx5 x19 x20) => hx6 x19 x20 hx8) hx7)
                      Original.LF_DOT_Poly.LF.Poly.Exercises.three (fun (x : Type) (x0 : x -> x) (x13 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x14 : x => x0 x14) x13)
                      (fun (x13 x14 : Type) (hx5 : Iso x13 x14) (x15 : x13 -> x13) (x16 : x14 -> x14) (hx6 : forall (x17 : x13) (x18 : x14), rel_iso hx5 x17 x18 -> rel_iso hx5 (x15 x17) (x16 x18))
                         (x17 : x13) (x18 : x14) (hx7 : rel_iso hx5 x17 x18) =>
                       Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso x15 (fun x : x14 => x16 x) (fun (x19 : x13) (x20 : x14) (hx8 : rel_iso hx5 x19 x20) => hx6 x19 x20 hx8) hx7)
                      x9 (fun x : x8 => x10 x) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                   x3 (fun x : x2 => x4 x) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso (iso_of_rel_iso_iso_sort hx) x7 x8) => IsoUnFunND hx0 hx2) hx1))))
       (IsoFun
          (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
           IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
          Original.LF_DOT_Poly.LF.Poly.Exercises.zero (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x : x2 => x4 x) x6)
          (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
           IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.zero x1) (fun (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x : x2 => x4 x) x6)
             (fun (x3 : x1 -> x1) (x4 : x2 -> x2) (hx0 : rel_iso (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) x3 x4) =>
              IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.zero x1 x3) (fun x6 : x2 => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x : x2 => x4 x) x6)
                (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort hx) x5 x6) =>
                 Original_LF__DOT__Poly_LF_Poly_Exercises_zero_iso x3 (fun x : x2 => x4 x) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso (iso_of_rel_iso_iso_sort hx) x7 x8) => IsoUnFunND hx0 hx2) hx1)))))
    Original.LF_DOT_Poly.LF.Poly.Exercises.mult_2 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult__2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.mult_2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_mult__2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.mult_2 Original_LF__DOT__Poly_LF_Poly_Exercises_mult__2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.mult_2 Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_mult__2 Original_LF__DOT__Poly_LF_Poly_Exercises_mult__2_iso := {}.