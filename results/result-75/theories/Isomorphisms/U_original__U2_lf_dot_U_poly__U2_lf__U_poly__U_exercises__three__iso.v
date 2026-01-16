From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__cnat__iso.

(* three : cnat := @doit3times *)
(* Both Original.three and Imported.three are defined as doit3times *)

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_three.

Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> x1) (x4 : x2 -> x2),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso hx (x3 x5) (x4 x6)) ->
  forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso hx (Original.LF_DOT_Poly.LF.Poly.Exercises.three x1 x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three x4 x6).
Proof.
  intros x1 x2 hx f1 f2 Hf n1 n2 Hn.
  (* three = @doit3times = fun X f n => f (f (f n)) *)
  unfold Original.LF_DOT_Poly.LF.Poly.Exercises.three.
  unfold Original.LF_DOT_Poly.LF.Poly.doit3times.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_Exercises_three.
  unfold Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_three.
  unfold Imported.Original_LF__DOT__Poly_LF_Poly_doit3times.
  (* Apply Hf three times *)
  apply Hf. apply Hf. apply Hf. exact Hn.
Defined.

Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.three := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_three := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.three Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.three Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_three Original_LF__DOT__Poly_LF_Poly_Exercises_three_iso := {}.