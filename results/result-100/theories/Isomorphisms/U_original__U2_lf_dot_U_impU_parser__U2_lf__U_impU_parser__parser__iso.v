From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__optionU_e__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__token__iso Isomorphisms.list__iso Isomorphisms.prod__iso.

(* parser is a type alias, not a separate inductive type *)
Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_parser : Type -> Type := fun x2 : Type =>
  imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod x2 (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)).
  
Instance Original_LF__DOT__ImpParser_LF_ImpParser_parser_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_ImpParser.LF.ImpParser.parser x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parser x2)
  := fun (x1 x2 : Type) (hx : Iso x1 x2) =>
  IsoArrow (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)
    (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso hx (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso))).

Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.parser := {}. (* only needed when rel_iso is typeclasses opaque *)
(* No Imported.parser since it's a type alias *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.parser Original_LF__DOT__ImpParser_LF_ImpParser_parser_iso := {}.
(* Note: IsoStatementProofBetween needs to use the actual imported type structure *)
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.parser imported_Original_LF__DOT__ImpParser_LF_ImpParser_parser Original_LF__DOT__ImpParser_LF_ImpParser_parser_iso := {}.