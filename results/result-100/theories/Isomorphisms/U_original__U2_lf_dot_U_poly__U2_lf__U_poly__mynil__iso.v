From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_mynil : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat := Imported.Original_LF__DOT__Poly_LF_Poly_mynil.
Instance Original_LF__DOT__Poly_LF_Poly_mynil_iso : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) Original.LF_DOT_Poly.LF.Poly.mynil imported_Original_LF__DOT__Poly_LF_Poly_mynil.
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.mynil := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_mynil := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.mynil Original_LF__DOT__Poly_LF_Poly_mynil_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.mynil Imported.Original_LF__DOT__Poly_LF_Poly_mynil Original_LF__DOT__Poly_LF_Poly_mynil_iso := {}.