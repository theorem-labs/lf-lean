From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_string : Type := imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii.
Instance Original_LF__DOT__IndProp_LF_IndProp_string_iso : Iso Original.LF_DOT_IndProp.LF.IndProp.string imported_Original_LF__DOT__IndProp_LF_IndProp_string
  := Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.string Original_LF__DOT__IndProp_LF_IndProp_string_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.string Imported.Original_LF__DOT__IndProp_LF_IndProp_string Original_LF__DOT__IndProp_LF_IndProp_string_iso := {}.