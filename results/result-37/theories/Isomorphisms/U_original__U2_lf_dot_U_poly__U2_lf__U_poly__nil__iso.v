From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq. From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism. #[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.
Definition imported_Original_LF__DOT__Poly_LF_Poly_nil : forall X : Type, imported_Original_LF__DOT__Poly_LF_Poly_list X := Imported.Original_LF__DOT__Poly_LF_Poly_nil.
Instance Original_LF__DOT__Poly_LF_Poly_nil_iso : forall (x1 x2 : Type) (hx : Iso x1 x2), rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (@Original.LF_DOT_Poly.LF.Poly.nil x1) (imported_Original_LF__DOT__Poly_LF_Poly_nil x2). Admitted.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.nil) := {}. Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_nil := {}.
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.nil) Original_LF__DOT__Poly_LF_Poly_nil_iso := {}. Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.nil) Imported.Original_LF__DOT__Poly_LF_Poly_nil Original_LF__DOT__Poly_LF_Poly_nil_iso := {}.
