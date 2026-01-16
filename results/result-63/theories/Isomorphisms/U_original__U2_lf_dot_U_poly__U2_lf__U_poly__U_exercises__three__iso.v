From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__cnat__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__doit3times__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three : forall x : Type, (x -> x) -> x -> x := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_three.
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> x1) (x4 : x2 -> x2),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso hx (x3 x5) (x4 x6)) ->
  forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso hx (Original.LF_DOT_Poly.LF.Poly.Exercises.three x1 x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three x4 x6).
Proof.
  intros x1 x2 hx x3 x4 Hf x5 x6 Hx56.
  unfold Original.LF_DOT_Poly.LF.Poly.Exercises.three, imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three.
  unfold Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_three.
  (* three = @doit3times, so three X f x = f (f (f x)) *)
  unfold Original.LF_DOT_Poly.LF.Poly.doit3times, Imported.Original_LF__DOT__Poly_LF_Poly_doit3times.
  apply Hf. apply Hf. apply Hf. exact Hx56.
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.three := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_three := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.three Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.three Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_three Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso := {}.
