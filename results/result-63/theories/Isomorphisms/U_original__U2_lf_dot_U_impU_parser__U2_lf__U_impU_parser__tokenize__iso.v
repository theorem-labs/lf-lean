From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso Isomorphisms.list__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize : imported_String_string -> imported_list imported_String_string := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize.
Instance Original_LF__DOT__ImpParser_LF_ImpParser_tokenize_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 -> rel_iso (list_iso String_string_iso) (Original.LF_DOT_ImpParser.LF.ImpParser.tokenize x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.tokenize := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.tokenize Original_LF__DOT__ImpParser_LF_ImpParser_tokenize_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.tokenize Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize Original_LF__DOT__ImpParser_LF_ImpParser_tokenize_iso := {}.