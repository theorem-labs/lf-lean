From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__cnat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_scc := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_scc.
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_scc_iso : forall (x1 : Original.LF_DOT_Poly.LF.Poly.Exercises.cnat) (x2 : forall x : Type, (x -> x) -> x -> x),
  (forall (x3 x4 : Type) (hx : Iso x3 x4) (x5 : x3 -> x3) (x6 : x4 -> x4),
   (forall (x7 : x3) (x8 : x4), rel_iso hx x7 x8 -> rel_iso hx (x5 x7) (x6 x8)) -> forall (x7 : x3) (x8 : x4), rel_iso hx x7 x8 -> rel_iso hx (x1 x3 x5 x7) (x2 x4 x6 x8)) ->
  forall (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x3 -> x3) (x6 : x4 -> x4),
  (forall (x7 : x3) (x8 : x4), rel_iso hx0 x7 x8 -> rel_iso hx0 (x5 x7) (x6 x8)) ->
  forall (x7 : x3) (x8 : x4), rel_iso hx0 x7 x8 -> rel_iso hx0 (Original.LF_DOT_Poly.LF.Poly.Exercises.scc x1 x3 x5 x7) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_scc x2 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.scc := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_scc := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.scc Original_LF__DOT__Poly_LF_Poly_Exercises_scc_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.scc Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_scc Original_LF__DOT__Poly_LF_Poly_Exercises_scc_iso := {}.