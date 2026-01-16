From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso Isomorphisms.U_string__string__iso Isomorphisms.list__iso.

Monomorphic Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string : imported_String_string -> imported_list imported_Ascii_ascii := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string.
Monomorphic Instance Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 ->
  rel_iso (list_iso Ascii_ascii_iso) (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string Imported.Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string_iso := {}.