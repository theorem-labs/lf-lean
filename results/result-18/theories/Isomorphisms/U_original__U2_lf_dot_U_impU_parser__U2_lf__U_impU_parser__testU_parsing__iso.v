From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__optionU_e__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__token__iso Isomorphisms.U_string__string__iso Isomorphisms.list__iso Isomorphisms.nat__iso Isomorphisms.prod__iso.

Monomorphic Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_testParsing : forall x : Type,
  (imported_nat ->
   imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
   imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod x (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token))) ->
  imported_String_string -> imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod x (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_testParsing).
Monomorphic Instance Original_LF__DOT__ImpParser_LF_ImpParser_testParsing_iso : forall (x1 x2 : Type) (hx : Iso x1 x2)
    (x3 : nat -> list Original.LF_DOT_ImpParser.LF.ImpParser.token -> Original.LF_DOT_ImpParser.LF.ImpParser.optionE (x1 * list Original.LF_DOT_ImpParser.LF.ImpParser.token))
    (x4 : imported_nat ->
          imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
          imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod x2 (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token))),
  (forall (x5 : nat) (x6 : imported_nat),
   rel_iso nat_iso x5 x6 ->
   forall (x7 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x8 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
   rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x7 x8 ->
   rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso hx (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso))) (x3 x5 x7) (x4 x6 x8)) ->
  forall (x5 : String.string) (x6 : imported_String_string),
  rel_iso String_string_iso x5 x6 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso hx (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso))) (Original.LF_DOT_ImpParser.LF.ImpParser.testParsing x3 x5)
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_testParsing x4 x6).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_ImpParser.LF.ImpParser.testParsing) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_testParsing) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_ImpParser.LF.ImpParser.testParsing) Original_LF__DOT__ImpParser_LF_ImpParser_testParsing_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_ImpParser.LF.ImpParser.testParsing) (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_testParsing) Original_LF__DOT__ImpParser_LF_ImpParser_testParsing_iso := {}.