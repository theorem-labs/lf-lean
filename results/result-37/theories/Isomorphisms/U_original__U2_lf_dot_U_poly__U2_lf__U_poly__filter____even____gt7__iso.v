From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq. From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism. #[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso.
Definition imported_Original_LF__DOT__Poly_LF_Poly_filter__even__gt7 := Imported.Original_LF__DOT__Poly_LF_Poly_filter__even__gt7.
Instance Original_LF__DOT__Poly_LF_Poly_filter__even__gt7_iso : forall x1 x2, rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x1 x2 -> rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) (Original.LF_DOT_Poly.LF.Poly.filter_even_gt7 x1) (imported_Original_LF__DOT__Poly_LF_Poly_filter__even__gt7 x2). Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.filter_even_gt7 := {}. Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_filter__even__gt7 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.filter_even_gt7 Original_LF__DOT__Poly_LF_Poly_filter__even__gt7_iso := {}. Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.filter_even_gt7 Imported.Original_LF__DOT__Poly_LF_Poly_filter__even__gt7 Original_LF__DOT__Poly_LF_Poly_filter__even__gt7_iso := {}.
