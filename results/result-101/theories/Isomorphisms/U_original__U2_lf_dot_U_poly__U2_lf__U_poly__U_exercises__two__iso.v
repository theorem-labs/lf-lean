From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__cnat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two : forall x : Type, (x -> x) -> x -> x := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_two.
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_two_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> x1) (x4 : x2 -> x2),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso hx (x3 x5) (x4 x6)) ->
  forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso hx (Original.LF_DOT_Poly.LF.Poly.Exercises.two x1 x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.two := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_two := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.two Original_LF__DOT__Poly_LF_Poly_Exercises_two_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.two Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_two Original_LF__DOT__Poly_LF_Poly_Exercises_two_iso := {}.