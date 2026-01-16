From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__optionU_e__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__token__iso Isomorphisms.list__iso Isomorphisms.nat__iso Isomorphisms.prod__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand : imported_nat ->
  imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod imported_Original_LF__DOT__Imp_LF_Imp_com (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand.
Instance Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x4 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x3 x4 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso Original_LF__DOT__Imp_LF_Imp_com_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
    (Original.LF_DOT_ImpParser.LF.ImpParser.parseSimpleCommand x1 x3) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.parseSimpleCommand := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.parseSimpleCommand Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.parseSimpleCommand Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand_iso := {}.