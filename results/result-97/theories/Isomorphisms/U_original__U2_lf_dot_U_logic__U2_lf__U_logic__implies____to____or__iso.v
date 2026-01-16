From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Logic_LF_Logic_implies__to__or : SProp := Imported.Original_LF__DOT__Logic_LF_Logic_implies__to__or.
Instance Original_LF__DOT__Logic_LF_Logic_implies__to__or_iso : Iso Original.LF_DOT_Logic.LF.Logic.implies_to_or imported_Original_LF__DOT__Logic_LF_Logic_implies__to__or.
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.implies_to_or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_implies__to__or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.implies_to_or Original_LF__DOT__Logic_LF_Logic_implies__to__or_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.implies_to_or Imported.Original_LF__DOT__Logic_LF_Logic_implies__to__or Original_LF__DOT__Logic_LF_Logic_implies__to__or_iso := {}.