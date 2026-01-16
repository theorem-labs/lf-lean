From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Basics_LF_Basics_comparison : Type := Imported.Original_LF__DOT__Basics_LF_Basics_comparison.
Instance Original_LF__DOT__Basics_LF_Basics_comparison_iso : Iso Original.LF_DOT_Basics.LF.Basics.comparison imported_Original_LF__DOT__Basics_LF_Basics_comparison.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.comparison := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_comparison := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.comparison Original_LF__DOT__Basics_LF_Basics_comparison_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.comparison Imported.Original_LF__DOT__Basics_LF_Basics_comparison Original_LF__DOT__Basics_LF_Basics_comparison_iso := {}.