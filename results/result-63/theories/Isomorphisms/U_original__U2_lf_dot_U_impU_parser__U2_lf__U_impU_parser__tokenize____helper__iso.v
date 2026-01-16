From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__chartype__iso Isomorphisms.list__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper : imported_Original_LF__DOT__ImpParser_LF_ImpParser_chartype -> imported_list imported_Ascii_ascii -> imported_list imported_Ascii_ascii -> imported_list (imported_list imported_Ascii_ascii) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper.
Instance Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper_iso : forall (x1 : Original.LF_DOT_ImpParser.LF.ImpParser.chartype) (x2 : imported_Original_LF__DOT__ImpParser_LF_ImpParser_chartype),
  rel_iso Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso x1 x2 ->
  forall (x3 : list Ascii.ascii) (x4 : imported_list imported_Ascii_ascii),
  rel_iso (list_iso Ascii_ascii_iso) x3 x4 ->
  forall (x5 : list Ascii.ascii) (x6 : imported_list imported_Ascii_ascii),
  rel_iso (list_iso Ascii_ascii_iso) x5 x6 ->
  rel_iso (list_iso (list_iso Ascii_ascii_iso)) (Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_helper x1 x3 x5) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_helper := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_helper Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_helper Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper_iso := {}.