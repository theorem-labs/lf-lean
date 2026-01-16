From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__prod__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry : forall x x0 x1 : Type, (imported_Original_LF__DOT__Poly_LF_Poly_prod x x0 -> x1) -> x -> x0 -> x1 := (@Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry).
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 x6 : Type) (hx1 : IsoOrSortRelaxed x5 x6) (x7 : Original.LF_DOT_Poly.LF.Poly.prod x1 x3 -> x5)
    (x8 : imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4 -> x6),
  (forall (x9 : Original.LF_DOT_Poly.LF.Poly.prod x1 x3) (x10 : imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4),
   rel_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso hx hx0) x9 x10 -> rel_iso_sort hx1 (x7 x9) (x8 x10)) ->
  forall (x9 : x1) (x10 : x2),
  rel_iso hx x9 x10 ->
  forall (x11 : x3) (x12 : x4),
  rel_iso hx0 x11 x12 -> rel_iso_sort hx1 (Original.LF_DOT_Poly.LF.Poly.Exercises.prod_curry x7 x9 x11) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry x8 x10 x12).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.Exercises.prod_curry) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.Exercises.prod_curry) Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.Exercises.prod_curry) (@Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry) Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry_iso := {}.