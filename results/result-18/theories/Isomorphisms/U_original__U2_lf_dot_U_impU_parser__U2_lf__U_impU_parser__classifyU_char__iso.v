From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__chartype__iso.

Monomorphic Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_classifyChar : imported_Ascii_ascii -> imported_Original_LF__DOT__ImpParser_LF_ImpParser_chartype := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_classifyChar.
Monomorphic Instance Original_LF__DOT__ImpParser_LF_ImpParser_classifyChar_iso : forall (x1 : Ascii.ascii) (x2 : imported_Ascii_ascii),
  rel_iso Ascii_ascii_iso x1 x2 ->
  rel_iso Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso (Original.LF_DOT_ImpParser.LF.ImpParser.classifyChar x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_classifyChar x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.classifyChar := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_classifyChar := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.classifyChar Original_LF__DOT__ImpParser_LF_ImpParser_classifyChar_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.classifyChar Imported.Original_LF__DOT__ImpParser_LF_ImpParser_classifyChar Original_LF__DOT__ImpParser_LF_ImpParser_classifyChar_iso := {}.