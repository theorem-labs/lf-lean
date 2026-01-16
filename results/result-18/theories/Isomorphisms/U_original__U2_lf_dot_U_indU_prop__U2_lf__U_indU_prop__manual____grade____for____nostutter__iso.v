From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__option__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__prod__iso Isomorphisms.U_string__string__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_manual__grade__for__nostutter : imported_Original_LF__DOT__Poly_LF_Poly_option (imported_Original_LF__DOT__Poly_LF_Poly_prod imported_nat imported_String_string) := Imported.Original_LF__DOT__IndProp_LF_IndProp_manual__grade__for__nostutter.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_manual__grade__for__nostutter_iso : rel_iso (Original_LF__DOT__Poly_LF_Poly_option_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso nat_iso String_string_iso)) Original.LF_DOT_IndProp.LF.IndProp.manual_grade_for_nostutter
    imported_Original_LF__DOT__IndProp_LF_IndProp_manual__grade__for__nostutter.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.manual_grade_for_nostutter := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_manual__grade__for__nostutter := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.manual_grade_for_nostutter Original_LF__DOT__IndProp_LF_IndProp_manual__grade__for__nostutter_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.manual_grade_for_nostutter Imported.Original_LF__DOT__IndProp_LF_IndProp_manual__grade__for__nostutter Original_LF__DOT__IndProp_LF_IndProp_manual__grade__for__nostutter_iso := {}.