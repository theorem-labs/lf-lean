From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__optionU_e__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__token__iso Isomorphisms.U_string__string__iso Isomorphisms.list__iso Isomorphisms.prod__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod imported_String_string (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier.
Instance Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso : forall (x1 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x2 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x1 x2 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso String_string_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
    (Original.LF_DOT_ImpParser.LF.ImpParser.parseIdentifier x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.parseIdentifier := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.parseIdentifier Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.parseIdentifier Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier_iso := {}.