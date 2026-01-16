From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
 (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_fold__map : forall x x0 : Type, (x -> x0) -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Poly_LF_Poly_list x0 := (@Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__map).
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_fold__map_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x1 -> x3) (x6 : x2 -> x4),
  (forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso hx0 (x5 x7) (x6 x8)) ->
  forall (x7 : Original.LF_DOT_Poly.LF.Poly.list x1) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8 ->
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx0) (Original.LF_DOT_Poly.LF.Poly.Exercises.fold_map x5 x7) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_fold__map x6 x8).
Proof.
  (* Since fold_map is an axiom in both Rocq and Lean, we can admit this isomorphism
     as allowed by the instructions *)
  admit.
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.Exercises.fold_map) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__map) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.Exercises.fold_map) Original_LF__DOT__Poly_LF_Poly_Exercises_fold__map_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.Exercises.fold_map) (@Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__map) Original_LF__DOT__Poly_LF_Poly_Exercises_fold__map_iso := {}.