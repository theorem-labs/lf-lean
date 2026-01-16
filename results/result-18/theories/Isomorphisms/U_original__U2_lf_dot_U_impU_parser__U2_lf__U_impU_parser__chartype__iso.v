From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_chartype : Type := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype.
Monomorphic Instance Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso : Iso Original.LF_DOT_ImpParser.LF.ImpParser.chartype imported_Original_LF__DOT__ImpParser_LF_ImpParser_chartype.
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.chartype := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.chartype Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.chartype Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso := {}.