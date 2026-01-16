From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Poly_LF_Poly_boollist : Type := Imported.Original_LF__DOT__Poly_LF_Poly_boollist.
Instance Original_LF__DOT__Poly_LF_Poly_boollist_iso : Iso Original.LF_DOT_Poly.LF.Poly.boollist imported_Original_LF__DOT__Poly_LF_Poly_boollist.
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.boollist := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_boollist := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.boollist Original_LF__DOT__Poly_LF_Poly_boollist_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.boollist Imported.Original_LF__DOT__Poly_LF_Poly_boollist Original_LF__DOT__Poly_LF_Poly_boollist_iso := {}.