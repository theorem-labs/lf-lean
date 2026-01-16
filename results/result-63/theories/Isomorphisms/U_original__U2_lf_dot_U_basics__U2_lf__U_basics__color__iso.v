From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Basics_LF_Basics_color : Type := Imported.Original_LF__DOT__Basics_LF_Basics_color.
Instance Original_LF__DOT__Basics_LF_Basics_color_iso : Iso Original.LF_DOT_Basics.LF.Basics.color imported_Original_LF__DOT__Basics_LF_Basics_color.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.color := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_color := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.color Original_LF__DOT__Basics_LF_Basics_color_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.color Imported.Original_LF__DOT__Basics_LF_Basics_color Original_LF__DOT__Basics_LF_Basics_color_iso := {}.