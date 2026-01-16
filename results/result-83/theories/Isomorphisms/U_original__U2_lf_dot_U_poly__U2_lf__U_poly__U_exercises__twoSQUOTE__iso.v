From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__cnat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two' : forall x : Type, (x -> x) -> x -> x := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_two'.

(* two' x succ zero = succ (succ zero) in both versions - they are definitionally equal *)
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_two'_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> x1) (x4 : x2 -> x2),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso hx (x3 x5) (x4 x6)) ->
  forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso hx (Original.LF_DOT_Poly.LF.Poly.Exercises.two' x1 x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two' x4 x6).
Proof.
  intros x1 x2 hx succ1 succ2 Hsucc zero1 zero2 Hzero.
  (* two' X succ zero = succ (succ zero) *)
  unfold Original.LF_DOT_Poly.LF.Poly.Exercises.two'.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_Exercises_two'.
  unfold Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_two'.
  (* Now we need to show: rel_iso hx (succ1 (succ1 zero1)) (succ2 (succ2 zero2)) *)
  apply Hsucc.
  apply Hsucc.
  exact Hzero.
Qed.

Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.two' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_two' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.two' Original_LF__DOT__Poly_LF_Poly_Exercises_two'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.two' Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_two' Original_LF__DOT__Poly_LF_Poly_Exercises_two'_iso := {}.