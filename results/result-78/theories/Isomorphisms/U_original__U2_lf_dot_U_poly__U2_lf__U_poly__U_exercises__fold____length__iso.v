From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_nat := (@Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length).
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 ->
  rel_iso nat_iso (Original.LF_DOT_Poly.LF.Poly.Exercises.fold_length x3) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length x4).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.Exercises.fold_length) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.Exercises.fold_length) Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.Exercises.fold_length) (@Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length) Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length_iso := {}.