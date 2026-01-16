From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_double__negation__elimination : SProp := Imported.Original_LF__DOT__Logic_LF_Logic_double__negation__elimination.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_double__negation__elimination_iso : Iso Original.LF_DOT_Logic.LF.Logic.double_negation_elimination imported_Original_LF__DOT__Logic_LF_Logic_double__negation__elimination.
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.double_negation_elimination := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_double__negation__elimination := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.double_negation_elimination Original_LF__DOT__Logic_LF_Logic_double__negation__elimination_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.double_negation_elimination Imported.Original_LF__DOT__Logic_LF_Logic_double__negation__elimination Original_LF__DOT__Logic_LF_Logic_double__negation__elimination_iso := {}.