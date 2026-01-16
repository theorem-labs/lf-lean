From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_rgb : Type := Imported.Original_LF__DOT__Basics_LF_Basics_rgb.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_rgb_iso : Iso Original.LF_DOT_Basics.LF.Basics.rgb imported_Original_LF__DOT__Basics_LF_Basics_rgb.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.rgb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_rgb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.rgb Original_LF__DOT__Basics_LF_Basics_rgb_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.rgb Imported.Original_LF__DOT__Basics_LF_Basics_rgb Original_LF__DOT__Basics_LF_Basics_rgb_iso := {}.