From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__prod____curry__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__prod____uncurry__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_curry__uncurry : forall (x x0 x1 : Type) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_prod x x0 -> x1) (x3 : imported_Original_LF__DOT__Poly_LF_Poly_prod x x0),
  imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_prod__uncurry
       (fun (x4 : x) (x5 : x0) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry (fun x6 : imported_Original_LF__DOT__Poly_LF_Poly_prod x x0 => x2 x6) x4 x5) x3)
    (x2 x3) := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_curry__uncurry.
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_curry__uncurry_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 x6 : Type) (hx1 : Iso x5 x6) (x7 : Original.LF_DOT_Poly.LF.Poly.prod x1 x3 -> x5)
    (x8 : imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4 -> x6)
    (hx2 : forall (x9 : Original.LF_DOT_Poly.LF.Poly.prod x1 x3) (x10 : imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4),
           rel_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso hx hx0) x9 x10 -> rel_iso hx1 (x7 x9) (x8 x10))
    (x9 : Original.LF_DOT_Poly.LF.Poly.prod x1 x3) (x10 : imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4) (hx3 : rel_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso hx hx0) x9 x10),
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (unwrap_sprop
          (Original_LF__DOT__Poly_LF_Poly_Exercises_prod__uncurry_iso hx1 (Original.LF_DOT_Poly.LF.Poly.Exercises.prod_curry x7)
             (fun (x : x2) (x0 : x4) => imported_Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry (fun x11 : imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4 => x8 x11) x x0)
             (fun (x11 : x1) (x12 : x2) (hx4 : rel_iso hx x11 x12) (x13 : x3) (x14 : x4) (hx5 : rel_iso hx0 x13 x14) =>
              {|
                unwrap_sprop :=
                  unwrap_sprop
                    (Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry_iso hx1 x7 (fun x : imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4 => x8 x)
                       (fun (x15 : Original.LF_DOT_Poly.LF.Poly.prod x1 x3) (x16 : imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4)
                          (hx6 : rel_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso hx hx0) x15 x16) =>
                        {| unwrap_sprop := hx2 x15 x16 hx6 |})
                       hx4 hx5)
              |})
             hx3))
       (hx2 x9 x10 hx3))
    (Original.LF_DOT_Poly.LF.Poly.Exercises.curry_uncurry x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_curry__uncurry x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.curry_uncurry := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_curry__uncurry := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.curry_uncurry Original_LF__DOT__Poly_LF_Poly_Exercises_curry__uncurry_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.curry_uncurry Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_curry__uncurry Original_LF__DOT__Poly_LF_Poly_Exercises_curry__uncurry_iso := {}.