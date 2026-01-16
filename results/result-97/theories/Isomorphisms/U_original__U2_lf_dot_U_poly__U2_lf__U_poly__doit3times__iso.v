From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Poly_LF_Poly_doit3times : forall x : Type, (x -> x) -> x -> x := (@Imported.Original_LF__DOT__Poly_LF_Poly_doit3times).
Instance Original_LF__DOT__Poly_LF_Poly_doit3times_iso : forall (x1 x2 : Type) (hx : IsoOrSortRelaxed x1 x2) (x3 : x1 -> x1) (x4 : x2 -> x2),
  (forall (x5 : x1) (x6 : x2), rel_iso_sort hx x5 x6 -> rel_iso_sort hx (x3 x5) (x4 x6)) ->
  forall (x5 : x1) (x6 : x2), rel_iso_sort hx x5 x6 -> rel_iso_sort hx (Original.LF_DOT_Poly.LF.Poly.doit3times x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_doit3times x4 x6).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.doit3times) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_doit3times) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.doit3times) Original_LF__DOT__Poly_LF_Poly_doit3times_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.doit3times) (@Imported.Original_LF__DOT__Poly_LF_Poly_doit3times) Original_LF__DOT__Poly_LF_Poly_doit3times_iso := {}.