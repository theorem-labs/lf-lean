From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__prod__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_fst : forall x x0 : Type, imported_Original_LF__DOT__Poly_LF_Poly_prod x x0 -> x := (@Imported.Original_LF__DOT__Poly_LF_Poly_fst).
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_fst_iso : forall (x1 x2 : Type) (hx : IsoOrSort x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.prod x1 x3) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso (Iso_of_IsoOrSortAndRelIso hx) hx0) x5 x6 -> rel_iso_sort hx (Original.LF_DOT_Poly.LF.Poly.fst x5) (imported_Original_LF__DOT__Poly_LF_Poly_fst x6).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.fst) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_fst) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.fst) Original_LF__DOT__Poly_LF_Poly_fst_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.fst) (@Imported.Original_LF__DOT__Poly_LF_Poly_fst) Original_LF__DOT__Poly_LF_Poly_fst_iso := {}.