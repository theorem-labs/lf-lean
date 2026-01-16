From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parser__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_many : forall x : Type,
  (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
   imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod x (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token))) ->
  imported_nat ->
  imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod (imported_list x) (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many).
Monomorphic Instance Original_LF__DOT__ImpParser_LF_ImpParser_many_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_ImpParser.LF.ImpParser.parser x1)
    (x4 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
          imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod x2 (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token))),
  (forall (x5 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x6 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
   rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x5 x6 ->
   rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso hx (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso))) (x3 x5) (x4 x6)) ->
  forall (x5 : nat) (x6 : imported_nat),
  rel_iso nat_iso x5 x6 ->
  forall (x7 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x8 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x7 x8 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso (list_iso hx) (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
    (Original.LF_DOT_ImpParser.LF.ImpParser.many x3 x5 x7) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_many x4 x6 x8).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_ImpParser.LF.ImpParser.many) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_ImpParser.LF.ImpParser.many) Original_LF__DOT__ImpParser_LF_ImpParser_many_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_ImpParser.LF.ImpParser.many) (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many) Original_LF__DOT__ImpParser_LF_ImpParser_many_iso := {}.