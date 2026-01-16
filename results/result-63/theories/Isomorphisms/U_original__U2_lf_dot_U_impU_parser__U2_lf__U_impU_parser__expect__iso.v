From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parser__iso Isomorphisms.unit__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_expect : imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod imported_unit (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect.
Instance Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso : forall (x1 : Original.LF_DOT_ImpParser.LF.ImpParser.token) (x2 : imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso x1 x2 ->
  forall (x3 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x4 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x3 x4 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso unit_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
    (Original.LF_DOT_ImpParser.LF.ImpParser.expect x1 x3) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_expect x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.expect := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.expect Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.expect Imported.Original_LF__DOT__ImpParser_LF_ImpParser_expect Original_LF__DOT__ImpParser_LF_ImpParser_expect_iso := {}.