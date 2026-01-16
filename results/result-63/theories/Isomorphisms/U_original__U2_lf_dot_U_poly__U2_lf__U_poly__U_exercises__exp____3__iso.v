From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__exp__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__mult__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__one__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__plus__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__three__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__two__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp__3 : imported_Corelib_Init_Logic_eq
    (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
     imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp (fun (x : Type) (x0 : x -> x) (x1 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x3 : x => x0 x3) x1)
       (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x1 : x => x0 x1) x3) (fun x : x2 => x4 x) x6)
    (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
     imported_Original_LF__DOT__Poly_LF_Poly_Exercises_plus
       (fun (x : Type) (x0 : x -> x) (x1 : x) =>
        imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult (fun (x3 : Type) (x5 : x3 -> x3) (x7 : x3) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x8 : x3 => x5 x8) x7)
          (fun (x3 : Type) (x5 : x3 -> x3) (x7 : x3) =>
           imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult (fun (x8 : Type) (x9 : x8 -> x8) (x10 : x8) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x11 : x8 => x9 x11) x10)
             (fun (x8 : Type) (x9 : x8 -> x8) (x10 : x8) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x11 : x8 => x9 x11) x10) (fun x8 : x3 => x5 x8) x7)
          (fun x3 : x => x0 x3) x1)
       (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x1 : x => x0 x1) x3) (fun x : x2 => x4 x) x6) := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_exp__3.
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_exp__3_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (IsoFun
          (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
           IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
          (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.two)
          (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
           imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp (fun (x : Type) (x0 : x -> x) (x1 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x3 : x => x0 x3) x1)
             (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x1 : x => x0 x1) x3) (fun x : x2 => x4 x) x6)
          (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
           IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.two x1)
             (fun (x4 : x2 -> x2) (x6 : x2) =>
              imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x5 : x => x0 x5) x3)
                (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x5 : x => x0 x5) x3) (fun x : x2 => x4 x) x6)
             (fun (x3 : x1 -> x1) (x4 : x2 -> x2) (hx0 : rel_iso (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) x3 x4) =>
              IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.two x1 x3)
                (fun x6 : x2 =>
                 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp (fun (x : Type) (x0 : x -> x) (x5 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x7 : x => x0 x7) x5)
                   (fun (x : Type) (x0 : x -> x) (x5 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x7 : x => x0 x7) x5) (fun x : x2 => x4 x) x6)
                (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort hx) x5 x6) =>
                 Original_LF__DOT__Poly_LF_Poly_Exercises_exp_iso Original.LF_DOT_Poly.LF.Poly.Exercises.three
                   (fun (x : Type) (x0 : x -> x) (x7 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x8 : x => x0 x8) x7)
                   (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12)) 
                      (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                    Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso x9 (fun x : x8 => x10 x) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                   Original.LF_DOT_Poly.LF.Poly.Exercises.two (fun (x : Type) (x0 : x -> x) (x7 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x8 : x => x0 x8) x7)
                   (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12)) 
                      (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                    Original_LF__DOT__Poly_LF_Poly_Exercises_two_iso x9 (fun x : x8 => x10 x) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                   x3 (fun x : x2 => x4 x) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso (iso_of_rel_iso_iso_sort hx) x7 x8) => IsoUnFunND hx0 hx2) hx1))))
       (IsoFun
          (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
           IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
          (Original.LF_DOT_Poly.LF.Poly.Exercises.plus
             (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.two
                (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.two Original.LF_DOT_Poly.LF.Poly.Exercises.two))
             Original.LF_DOT_Poly.LF.Poly.Exercises.one)
          (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
           imported_Original_LF__DOT__Poly_LF_Poly_Exercises_plus
             (fun (x : Type) (x0 : x -> x) (x1 : x) =>
              imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult (fun (x3 : Type) (x5 : x3 -> x3) (x7 : x3) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x8 : x3 => x5 x8) x7)
                (fun (x3 : Type) (x5 : x3 -> x3) (x7 : x3) =>
                 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult
                   (fun (x8 : Type) (x9 : x8 -> x8) (x10 : x8) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x11 : x8 => x9 x11) x10)
                   (fun (x8 : Type) (x9 : x8 -> x8) (x10 : x8) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x11 : x8 => x9 x11) x10) (fun x8 : x3 => x5 x8) x7)
                (fun x3 : x => x0 x3) x1)
             (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x1 : x => x0 x1) x3) (fun x : x2 => x4 x) x6)
          (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
           IsoFunND
             (Original.LF_DOT_Poly.LF.Poly.Exercises.plus
                (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.two
                   (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.two Original.LF_DOT_Poly.LF.Poly.Exercises.two))
                Original.LF_DOT_Poly.LF.Poly.Exercises.one x1)
             (fun (x4 : x2 -> x2) (x6 : x2) =>
              imported_Original_LF__DOT__Poly_LF_Poly_Exercises_plus
                (fun (x : Type) (x0 : x -> x) (x3 : x) =>
                 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult (fun (x5 : Type) (x7 : x5 -> x5) (x8 : x5) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x9 : x5 => x7 x9) x8)
                   (fun (x5 : Type) (x7 : x5 -> x5) (x8 : x5) =>
                    imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult
                      (fun (x9 : Type) (x10 : x9 -> x9) (x11 : x9) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x12 : x9 => x10 x12) x11)
                      (fun (x9 : Type) (x10 : x9 -> x9) (x11 : x9) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x12 : x9 => x10 x12) x11) (fun x9 : x5 => x7 x9) x8)
                   (fun x5 : x => x0 x5) x3)
                (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x5 : x => x0 x5) x3) (fun x : x2 => x4 x) x6)
             (fun (x3 : x1 -> x1) (x4 : x2 -> x2) (hx0 : rel_iso (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) x3 x4) =>
              IsoFunND
                (Original.LF_DOT_Poly.LF.Poly.Exercises.plus
                   (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.two
                      (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.two Original.LF_DOT_Poly.LF.Poly.Exercises.two))
                   Original.LF_DOT_Poly.LF.Poly.Exercises.one x1 x3)
                (fun x6 : x2 =>
                 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_plus
                   (fun (x : Type) (x0 : x -> x) (x5 : x) =>
                    imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult
                      (fun (x7 : Type) (x8 : x7 -> x7) (x9 : x7) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x10 : x7 => x8 x10) x9)
                      (fun (x7 : Type) (x8 : x7 -> x7) (x9 : x7) =>
                       imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult
                         (fun (x10 : Type) (x11 : x10 -> x10) (x12 : x10) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x13 : x10 => x11 x13) x12)
                         (fun (x10 : Type) (x11 : x10 -> x10) (x12 : x10) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x13 : x10 => x11 x13) x12) (fun x10 : x7 => x8 x10) x9)
                      (fun x7 : x => x0 x7) x5)
                   (fun (x : Type) (x0 : x -> x) (x5 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x7 : x => x0 x7) x5) (fun x : x2 => x4 x) x6)
                (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort hx) x5 x6) =>
                 Original_LF__DOT__Poly_LF_Poly_Exercises_plus_iso
                   (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.two
                      (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.two Original.LF_DOT_Poly.LF.Poly.Exercises.two))
                   (fun (x : Type) (x0 : x -> x) (x7 : x) =>
                    imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult
                      (fun (x8 : Type) (x9 : x8 -> x8) (x10 : x8) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x11 : x8 => x9 x11) x10)
                      (fun (x8 : Type) (x9 : x8 -> x8) (x10 : x8) =>
                       imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult
                         (fun (x11 : Type) (x12 : x11 -> x11) (x13 : x11) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x14 : x11 => x12 x14) x13)
                         (fun (x11 : Type) (x12 : x11 -> x11) (x13 : x11) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x14 : x11 => x12 x14) x13) (fun x11 : x8 => x9 x11) x10)
                      (fun x8 : x => x0 x8) x7)
                   (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12)) 
                      (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                    Original_LF__DOT__Poly_LF_Poly_Exercises_mult_iso Original.LF_DOT_Poly.LF.Poly.Exercises.two
                      (fun (x : Type) (x0 : x -> x) (x13 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x14 : x => x0 x14) x13)
                      (fun (x13 x14 : Type) (hx5 : Iso x13 x14) (x15 : x13 -> x13) (x16 : x14 -> x14) (hx6 : forall (x17 : x13) (x18 : x14), rel_iso hx5 x17 x18 -> rel_iso hx5 (x15 x17) (x16 x18))
                         (x17 : x13) (x18 : x14) (hx7 : rel_iso hx5 x17 x18) =>
                       Original_LF__DOT__Poly_LF_Poly_Exercises_two_iso x15 (fun x : x14 => x16 x) (fun (x19 : x13) (x20 : x14) (hx8 : rel_iso hx5 x19 x20) => hx6 x19 x20 hx8) hx7)
                      (Original.LF_DOT_Poly.LF.Poly.Exercises.mult Original.LF_DOT_Poly.LF.Poly.Exercises.two Original.LF_DOT_Poly.LF.Poly.Exercises.two)
                      (fun (x : Type) (x0 : x -> x) (x13 : x) =>
                       imported_Original_LF__DOT__Poly_LF_Poly_Exercises_mult
                         (fun (x14 : Type) (x15 : x14 -> x14) (x16 : x14) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x17 : x14 => x15 x17) x16)
                         (fun (x14 : Type) (x15 : x14 -> x14) (x16 : x14) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x17 : x14 => x15 x17) x16) (fun x14 : x => x0 x14) x13)
                      (fun (x13 x14 : Type) (hx5 : Iso x13 x14) (x15 : x13 -> x13) (x16 : x14 -> x14) (hx6 : forall (x17 : x13) (x18 : x14), rel_iso hx5 x17 x18 -> rel_iso hx5 (x15 x17) (x16 x18))
                         (x17 : x13) (x18 : x14) (hx7 : rel_iso hx5 x17 x18) =>
                       Original_LF__DOT__Poly_LF_Poly_Exercises_mult_iso Original.LF_DOT_Poly.LF.Poly.Exercises.two
                         (fun (x : Type) (x0 : x -> x) (x19 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x20 : x => x0 x20) x19)
                         (fun (x19 x20 : Type) (hx8 : Iso x19 x20) (x21 : x19 -> x19) (x22 : x20 -> x20) (hx9 : forall (x23 : x19) (x24 : x20), rel_iso hx8 x23 x24 -> rel_iso hx8 (x21 x23) (x22 x24))
                            (x23 : x19) (x24 : x20) (hx10 : rel_iso hx8 x23 x24) =>
                          Original_LF__DOT__Poly_LF_Poly_Exercises_two_iso x21 (fun x : x20 => x22 x) (fun (x25 : x19) (x26 : x20) (hx11 : rel_iso hx8 x25 x26) => hx9 x25 x26 hx11) hx10)
                         Original.LF_DOT_Poly.LF.Poly.Exercises.two (fun (x : Type) (x0 : x -> x) (x19 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two (fun x20 : x => x0 x20) x19)
                         (fun (x19 x20 : Type) (hx8 : Iso x19 x20) (x21 : x19 -> x19) (x22 : x20 -> x20) (hx9 : forall (x23 : x19) (x24 : x20), rel_iso hx8 x23 x24 -> rel_iso hx8 (x21 x23) (x22 x24))
                            (x23 : x19) (x24 : x20) (hx10 : rel_iso hx8 x23 x24) =>
                          Original_LF__DOT__Poly_LF_Poly_Exercises_two_iso x21 (fun x : x20 => x22 x) (fun (x25 : x19) (x26 : x20) (hx11 : rel_iso hx8 x25 x26) => hx9 x25 x26 hx11) hx10)
                         x15 (fun x : x14 => x16 x) (fun (x19 : x13) (x20 : x14) (hx8 : rel_iso hx5 x19 x20) => hx6 x19 x20 hx8) hx7)
                      x9 (fun x : x8 => x10 x) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                   Original.LF_DOT_Poly.LF.Poly.Exercises.one (fun (x : Type) (x0 : x -> x) (x7 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x8 : x => x0 x8) x7)
                   (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12)) 
                      (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                    Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso x9 (fun x : x8 => x10 x) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                   x3 (fun x : x2 => x4 x) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso (iso_of_rel_iso_iso_sort hx) x7 x8) => IsoUnFunND hx0 hx2) hx1)))))
    Original.LF_DOT_Poly.LF.Poly.Exercises.exp_3 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp__3.
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.exp_3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_exp__3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.exp_3 Original_LF__DOT__Poly_LF_Poly_Exercises_exp__3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.exp_3 Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_exp__3 Original_LF__DOT__Poly_LF_Poly_Exercises_exp__3_iso := {}.