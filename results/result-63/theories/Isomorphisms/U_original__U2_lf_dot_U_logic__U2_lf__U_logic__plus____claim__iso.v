From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Logic_LF_Logic_plus__claim : SProp := Imported.Original_LF__DOT__Logic_LF_Logic_plus__claim.
Instance Original_LF__DOT__Logic_LF_Logic_plus__claim_iso : Iso Original.LF_DOT_Logic.LF.Logic.plus_claim imported_Original_LF__DOT__Logic_LF_Logic_plus__claim.
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.plus_claim := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_plus__claim := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.plus_claim Original_LF__DOT__Logic_LF_Logic_plus__claim_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.plus_claim Imported.Original_LF__DOT__Logic_LF_Logic_plus__claim Original_LF__DOT__Logic_LF_Logic_plus__claim_iso := {}.