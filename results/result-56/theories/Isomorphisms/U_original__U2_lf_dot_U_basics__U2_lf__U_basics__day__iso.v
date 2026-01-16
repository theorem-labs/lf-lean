From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_day : Type := Imported.Original_LF__DOT__Basics_LF_Basics_day.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_day_iso : Iso Original.LF_DOT_Basics.LF.Basics.day imported_Original_LF__DOT__Basics_LF_Basics_day.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.day := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_day := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.day Original_LF__DOT__Basics_LF_Basics_day_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.day Imported.Original_LF__DOT__Basics_LF_Basics_day Original_LF__DOT__Basics_LF_Basics_day_iso := {}.