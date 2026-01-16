From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__exp__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__one__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__three__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__zero__iso.

(* The definition must be definitionally equal to Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_exp__2 *)
Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp__2 := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_exp__2.
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_exp__2_iso : rel_iso
    {|
      to :=
        Corelib_Init_Logic_eq_iso
          (IsoFun
             (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
              IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
             (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero)
             (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
              imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp (fun (x : Type) (x0 : x -> x) (x1 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x3 : x => x0 x3) x1)
                (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x1 : x => x0 x1) x3) (fun x : x2 => x4 x) x6)
             (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
              IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero x1)
                (fun (x4 : x2 -> x2) (x6 : x2) =>
                 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x5 : x => x0 x5) x3)
                   (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x5 : x => x0 x5) x3) (fun x : x2 => x4 x) x6)
                (fun (x3 : x1 -> x1) (x4 : x2 -> x2) (hx0 : rel_iso (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) x3 x4) =>
                 IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero x1 x3)
                   (fun x6 : x2 =>
                    imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp (fun (x : Type) (x0 : x -> x) (x5 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x7 : x => x0 x7) x5)
                      (fun (x : Type) (x0 : x -> x) (x5 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x7 : x => x0 x7) x5) (fun x : x2 => x4 x) x6)
                   (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort hx) x5 x6) =>
                    Original_LF__DOT__Poly_LF_Poly_Exercises_exp_iso Original.LF_DOT_Poly.LF.Poly.Exercises.three
                      (fun (x : Type) (x0 : x -> x) (x7 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x8 : x => x0 x8) x7)
                      (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12)) 
                         (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                       Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso x9 (fun x : x8 => x10 x) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                      Original.LF_DOT_Poly.LF.Poly.Exercises.zero (fun (x : Type) (x0 : x -> x) (x7 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x8 : x => x0 x8) x7)
                      (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12)) 
                         (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                       Original_LF__DOT__Poly_LF_Poly_Exercises_zero_iso x9 (fun x : x8 => x10 x) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                      x3 (fun x : x2 => x4 x) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso (iso_of_rel_iso_iso_sort hx) x7 x8) => IsoUnFunND hx0 hx2) hx1))))
          (IsoFun
             (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
              IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
             Original.LF_DOT_Poly.LF.Poly.Exercises.one (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x : x2 => x4 x) x6)
             (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
              IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.one x1) (fun (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x : x2 => x4 x) x6)
                (fun (x3 : x1 -> x1) (x4 : x2 -> x2) (hx0 : rel_iso (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) x3 x4) =>
                 IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.one x1 x3) (fun x6 : x2 => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x : x2 => x4 x) x6)
                   (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort hx) x5 x6) =>
                    Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso x3 (fun x : x2 => x4 x) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso (iso_of_rel_iso_iso_sort hx) x7 x8) => IsoUnFunND hx0 hx2) hx1))));
      from :=
        from
          (Corelib_Init_Logic_eq_iso
             (IsoFun
                (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
                 IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
                (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero)
                (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
                 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp (fun (x : Type) (x0 : x -> x) (x1 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x3 : x => x0 x3) x1)
                   (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x1 : x => x0 x1) x3) (fun x : x2 => x4 x) x6)
                (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
                 IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero x1)
                   (fun (x4 : x2 -> x2) (x6 : x2) =>
                    imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x5 : x => x0 x5) x3)
                      (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x5 : x => x0 x5) x3) (fun x : x2 => x4 x) x6)
                   (fun (x3 : x1 -> x1) (x4 : x2 -> x2) (hx0 : rel_iso (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) x3 x4) =>
                    IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero x1 x3)
                      (fun x6 : x2 =>
                       imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp
                         (fun (x : Type) (x0 : x -> x) (x5 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x7 : x => x0 x7) x5)
                         (fun (x : Type) (x0 : x -> x) (x5 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x7 : x => x0 x7) x5) (fun x : x2 => x4 x) x6)
                      (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort hx) x5 x6) =>
                       Original_LF__DOT__Poly_LF_Poly_Exercises_exp_iso Original.LF_DOT_Poly.LF.Poly.Exercises.three
                         (fun (x : Type) (x0 : x -> x) (x7 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x8 : x => x0 x8) x7)
                         (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12)) 
                            (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                          Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso x9 (fun x : x8 => x10 x) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                         Original.LF_DOT_Poly.LF.Poly.Exercises.zero (fun (x : Type) (x0 : x -> x) (x7 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x8 : x => x0 x8) x7)
                         (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12)) 
                            (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                          Original_LF__DOT__Poly_LF_Poly_Exercises_zero_iso x9 (fun x : x8 => x10 x) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                         x3 (fun x : x2 => x4 x) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso (iso_of_rel_iso_iso_sort hx) x7 x8) => IsoUnFunND hx0 hx2) hx1))))
             (IsoFun
                (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
                 IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
                Original.LF_DOT_Poly.LF.Poly.Exercises.one (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x : x2 => x4 x) x6)
                (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
                 IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.one x1) (fun (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x : x2 => x4 x) x6)
                   (fun (x3 : x1 -> x1) (x4 : x2 -> x2) (hx0 : rel_iso (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) x3 x4) =>
                    IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.one x1 x3) (fun x6 : x2 => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x : x2 => x4 x) x6)
                      (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort hx) x5 x6) =>
                       Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso x3 (fun x : x2 => x4 x) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso (iso_of_rel_iso_iso_sort hx) x7 x8) => IsoUnFunND hx0 hx2) hx1)))));
      to_from :=
        fun
          x : imported_Corelib_Init_Logic_eq
                (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
                 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp (fun (x : Type) (x0 : x -> x) (x1 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x3 : x => x0 x3) x1)
                   (fun (x : Type) (x0 : x -> x) (x3 : x) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x1 : x => x0 x1) x3) (fun x : x2 => x4 x) x6)
                (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x : x2 => x4 x) x6) =>
        to_from
          (Corelib_Init_Logic_eq_iso
             (IsoFun
                (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
                 IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
                (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero)
                (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
                 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp (fun (x0 : Type) (x1 : x0 -> x0) (x3 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x5 : x0 => x1 x5) x3)
                   (fun (x0 : Type) (x1 : x0 -> x0) (x3 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x5 : x0 => x1 x5) x3) (fun x0 : x2 => x4 x0) x6)
                (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
                 IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero x1)
                   (fun (x4 : x2 -> x2) (x6 : x2) =>
                    imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp
                      (fun (x0 : Type) (x3 : x0 -> x0) (x5 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x7 : x0 => x3 x7) x5)
                      (fun (x0 : Type) (x3 : x0 -> x0) (x5 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x7 : x0 => x3 x7) x5) (fun x0 : x2 => x4 x0) x6)
                   (fun (x3 : x1 -> x1) (x4 : x2 -> x2) (hx0 : rel_iso (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) x3 x4) =>
                    IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero x1 x3)
                      (fun x6 : x2 =>
                       imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp
                         (fun (x0 : Type) (x5 : x0 -> x0) (x7 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x8 : x0 => x5 x8) x7)
                         (fun (x0 : Type) (x5 : x0 -> x0) (x7 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x8 : x0 => x5 x8) x7) (fun x0 : x2 => x4 x0) x6)
                      (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort hx) x5 x6) =>
                       Original_LF__DOT__Poly_LF_Poly_Exercises_exp_iso Original.LF_DOT_Poly.LF.Poly.Exercises.three
                         (fun (x0 : Type) (x7 : x0 -> x0) (x8 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x9 : x0 => x7 x9) x8)
                         (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12)) 
                            (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                          Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso x9 (fun x0 : x8 => x10 x0) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                         Original.LF_DOT_Poly.LF.Poly.Exercises.zero (fun (x0 : Type) (x7 : x0 -> x0) (x8 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x9 : x0 => x7 x9) x8)
                         (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12)) 
                            (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                          Original_LF__DOT__Poly_LF_Poly_Exercises_zero_iso x9 (fun x0 : x8 => x10 x0) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                         x3 (fun x0 : x2 => x4 x0) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso (iso_of_rel_iso_iso_sort hx) x7 x8) => IsoUnFunND hx0 hx2) hx1))))
             (IsoFun
                (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
                 IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
                Original.LF_DOT_Poly.LF.Poly.Exercises.one (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x0 : x2 => x4 x0) x6)
                (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
                 IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.one x1) (fun (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x0 : x2 => x4 x0) x6)
                   (fun (x3 : x1 -> x1) (x4 : x2 -> x2) (hx0 : rel_iso (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) x3 x4) =>
                    IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.one x1 x3) (fun x6 : x2 => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x0 : x2 => x4 x0) x6)
                      (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort hx) x5 x6) =>
                       Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso x3 (fun x0 : x2 => x4 x0) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso (iso_of_rel_iso_iso_sort hx) x7 x8) => IsoUnFunND hx0 hx2)
                         hx1)))))
          x;
      from_to :=
        fun x : Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero = Original.LF_DOT_Poly.LF.Poly.Exercises.one =>
        seq_p_of_t
          (from_to
             (Corelib_Init_Logic_eq_iso
                (IsoFun
                   (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
                    IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
                   (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero)
                   (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) =>
                    imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp
                      (fun (x0 : Type) (x1 : x0 -> x0) (x3 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x5 : x0 => x1 x5) x3)
                      (fun (x0 : Type) (x1 : x0 -> x0) (x3 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x5 : x0 => x1 x5) x3) (fun x0 : x2 => x4 x0) x6)
                   (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
                    IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero x1)
                      (fun (x4 : x2 -> x2) (x6 : x2) =>
                       imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp
                         (fun (x0 : Type) (x3 : x0 -> x0) (x5 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x7 : x0 => x3 x7) x5)
                         (fun (x0 : Type) (x3 : x0 -> x0) (x5 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x7 : x0 => x3 x7) x5) (fun x0 : x2 => x4 x0) x6)
                      (fun (x3 : x1 -> x1) (x4 : x2 -> x2) (hx0 : rel_iso (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) x3 x4) =>
                       IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original.LF_DOT_Poly.LF.Poly.Exercises.three Original.LF_DOT_Poly.LF.Poly.Exercises.zero x1 x3)
                         (fun x6 : x2 =>
                          imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp
                            (fun (x0 : Type) (x5 : x0 -> x0) (x7 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x8 : x0 => x5 x8) x7)
                            (fun (x0 : Type) (x5 : x0 -> x0) (x7 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x8 : x0 => x5 x8) x7) (fun x0 : x2 => x4 x0) x6)
                         (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort hx) x5 x6) =>
                          Original_LF__DOT__Poly_LF_Poly_Exercises_exp_iso Original.LF_DOT_Poly.LF.Poly.Exercises.three
                            (fun (x0 : Type) (x7 : x0 -> x0) (x8 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three (fun x9 : x0 => x7 x9) x8)
                            (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12))
                               (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                             Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso x9 (fun x0 : x8 => x10 x0) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                            Original.LF_DOT_Poly.LF.Poly.Exercises.zero (fun (x0 : Type) (x7 : x0 -> x0) (x8 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x9 : x0 => x7 x9) x8)
                            (fun (x7 x8 : Type) (hx2 : Iso x7 x8) (x9 : x7 -> x7) (x10 : x8 -> x8) (hx3 : forall (x11 : x7) (x12 : x8), rel_iso hx2 x11 x12 -> rel_iso hx2 (x9 x11) (x10 x12))
                               (x11 : x7) (x12 : x8) (hx4 : rel_iso hx2 x11 x12) =>
                             Original_LF__DOT__Poly_LF_Poly_Exercises_zero_iso x9 (fun x0 : x8 => x10 x0) (fun (x13 : x7) (x14 : x8) (hx5 : rel_iso hx2 x13 x14) => hx3 x13 x14 hx5) hx4)
                            x3 (fun x0 : x2 => x4 x0) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso (iso_of_rel_iso_iso_sort hx) x7 x8) => IsoUnFunND hx0 hx2) hx1))))
                (IsoFun
                   (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
                    IsoArrow (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)))
                   Original.LF_DOT_Poly.LF.Poly.Exercises.one (fun (x2 : Type) (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x0 : x2 => x4 x0) x6)
                   (fun (x1 x2 : Type) (hx : rel_iso iso_Sort x1 x2) =>
                    IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.one x1) (fun (x4 : x2 -> x2) (x6 : x2) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x0 : x2 => x4 x0) x6)
                      (fun (x3 : x1 -> x1) (x4 : x2 -> x2) (hx0 : rel_iso (IsoArrow (iso_of_rel_iso_iso_sort hx) (iso_of_rel_iso_iso_sort hx)) x3 x4) =>
                       IsoFunND (Original.LF_DOT_Poly.LF.Poly.Exercises.one x1 x3) (fun x6 : x2 => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x0 : x2 => x4 x0) x6)
                         (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort hx) x5 x6) =>
                          Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso x3 (fun x0 : x2 => x4 x0) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso (iso_of_rel_iso_iso_sort hx) x7 x8) => IsoUnFunND hx0 hx2)
                            hx1)))))
             x)
    |} Original.LF_DOT_Poly.LF.Poly.Exercises.exp_2 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp__2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.exp_2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_exp__2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.exp_2 Original_LF__DOT__Poly_LF_Poly_Exercises_exp__2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.exp_2 Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_exp__2 Original_LF__DOT__Poly_LF_Poly_Exercises_exp__2_iso := {}.