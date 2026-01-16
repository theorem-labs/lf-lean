From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_bignumber : imported_nat := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_bignumber.
Instance Original_LF__DOT__ImpParser_LF_ImpParser_bignumber_iso : rel_iso nat_iso Original.LF_DOT_ImpParser.LF.ImpParser.bignumber imported_Original_LF__DOT__ImpParser_LF_ImpParser_bignumber.
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.bignumber := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_bignumber := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.bignumber Original_LF__DOT__ImpParser_LF_ImpParser_bignumber_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.bignumber Imported.Original_LF__DOT__ImpParser_LF_ImpParser_bignumber Original_LF__DOT__ImpParser_LF_ImpParser_bignumber_iso := {}.