From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__cnat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp : (forall x : Type, (x -> x) -> x -> x) -> (forall x : Type, (x -> x) -> x -> x) -> forall x1 : Type, (x1 -> x1) -> x1 -> x1 := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_exp.
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_exp_iso : forall (x1 : Original.LF_DOT_Poly.LF.Poly.Exercises.cnat) (x2 : forall x : Type, (x -> x) -> x -> x),
  (forall (x3 x4 : Type) (hx : Iso x3 x4) (x5 : x3 -> x3) (x6 : x4 -> x4),
   (forall (x7 : x3) (x8 : x4), rel_iso hx x7 x8 -> rel_iso hx (x5 x7) (x6 x8)) -> forall (x7 : x3) (x8 : x4), rel_iso hx x7 x8 -> rel_iso hx (x1 x3 x5 x7) (x2 x4 x6 x8)) ->
  forall (x3 : Original.LF_DOT_Poly.LF.Poly.Exercises.cnat) (x4 : forall x : Type, (x -> x) -> x -> x),
  (forall (x5 x6 : Type) (hx0 : Iso x5 x6) (x7 : x5 -> x5) (x8 : x6 -> x6),
   (forall (x9 : x5) (x10 : x6), rel_iso hx0 x9 x10 -> rel_iso hx0 (x7 x9) (x8 x10)) -> forall (x9 : x5) (x10 : x6), rel_iso hx0 x9 x10 -> rel_iso hx0 (x3 x5 x7 x9) (x4 x6 x8 x10)) ->
  forall (x5 x6 : Type) (hx1 : Iso x5 x6) (x7 : x5 -> x5) (x8 : x6 -> x6),
  (forall (x9 : x5) (x10 : x6), rel_iso hx1 x9 x10 -> rel_iso hx1 (x7 x9) (x8 x10)) ->
  forall (x9 : x5) (x10 : x6), rel_iso hx1 x9 x10 -> rel_iso hx1 (Original.LF_DOT_Poly.LF.Poly.Exercises.exp x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_exp x2 x4 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.exp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_exp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.exp Original_LF__DOT__Poly_LF_Poly_Exercises_exp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.exp Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_exp Original_LF__DOT__Poly_LF_Poly_Exercises_exp_iso := {}.