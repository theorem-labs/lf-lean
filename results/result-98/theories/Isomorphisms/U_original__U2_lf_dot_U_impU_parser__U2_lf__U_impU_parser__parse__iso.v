From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__optionU_e__iso Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_parse : imported_String_string -> imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE imported_Original_LF__DOT__Imp_LF_Imp_com := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parse.
Instance Original_LF__DOT__ImpParser_LF_ImpParser_parse_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso Original_LF__DOT__Imp_LF_Imp_com_iso) (Original.LF_DOT_ImpParser.LF.ImpParser.parse x1)
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parse x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.parse := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parse := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.parse Original_LF__DOT__ImpParser_LF_ImpParser_parse_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.parse Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parse Original_LF__DOT__ImpParser_LF_ImpParser_parse_iso := {}.