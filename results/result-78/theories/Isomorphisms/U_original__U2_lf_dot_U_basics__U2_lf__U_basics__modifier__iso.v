From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_modifier : Type := Imported.Original_LF__DOT__Basics_LF_Basics_modifier.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_modifier_iso : Iso Original.LF_DOT_Basics.LF.Basics.modifier imported_Original_LF__DOT__Basics_LF_Basics_modifier.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.modifier := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_modifier := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.modifier Original_LF__DOT__Basics_LF_Basics_modifier_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.modifier Imported.Original_LF__DOT__Basics_LF_Basics_modifier Original_LF__DOT__Basics_LF_Basics_modifier_iso := {}.