From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_letter : Type := Imported.Original_LF__DOT__Basics_LF_Basics_letter.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_letter_iso : Iso Original.LF_DOT_Basics.LF.Basics.letter imported_Original_LF__DOT__Basics_LF_Basics_letter.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.letter := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_letter := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.letter Original_LF__DOT__Basics_LF_Basics_letter_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.letter Imported.Original_LF__DOT__Basics_LF_Basics_letter Original_LF__DOT__Basics_LF_Basics_letter_iso := {}.