From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__cnat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one := @Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_one.
Arguments imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one X%_type_scope _%_function_scope _.
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> x1) (x4 : x2 -> x2),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso hx (x3 x5) (x4 x6)) ->
  forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso hx (Original.LF_DOT_Poly.LF.Poly.Exercises.one x1 x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one x4 x6).
Proof.
  intros x1 x2 hx x3 x4 Hf x5 x6 Hx56.
  unfold Original.LF_DOT_Poly.LF.Poly.Exercises.one, imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one.
  unfold Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_one.
  (* one X f x = f x, so we need rel_iso hx (x3 x5) (x4 x6) *)
  apply Hf. exact Hx56.
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.one := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_one := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.one Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.one Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_one Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso := {}.