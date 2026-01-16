From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Basics_LF_Basics_bin : Type := Imported.Original_LF__DOT__Basics_LF_Basics_bin.
Instance Original_LF__DOT__Basics_LF_Basics_bin_iso : Iso Original.LF_DOT_Basics.LF.Basics.bin imported_Original_LF__DOT__Basics_LF_Basics_bin.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.bin Original_LF__DOT__Basics_LF_Basics_bin_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.bin Imported.Original_LF__DOT__Basics_LF_Basics_bin Original_LF__DOT__Basics_LF_Basics_bin_iso := {}.