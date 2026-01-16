From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso Isomorphisms.U_string__string__iso Isomorphisms.list__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list : imported_list imported_Ascii_ascii -> imported_String_string := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list.
Instance Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list_iso : forall (x1 : list Ascii.ascii) (x2 : imported_list imported_Ascii_ascii),
  rel_iso (list_iso Ascii_ascii_iso) x1 x2 ->
  rel_iso String_string_iso (Original.LF_DOT_ImpParser.LF.ImpParser.string_of_list x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.string_of_list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.string_of_list Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.string_of_list Imported.Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list_iso := {}.