From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Induction_LF_Induction_bin : Type := Imported.Original_LF__DOT__Induction_LF_Induction_bin.
Instance Original_LF__DOT__Induction_LF_Induction_bin_iso : Iso Original.LF_DOT_Induction.LF.Induction.bin imported_Original_LF__DOT__Induction_LF_Induction_bin.
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.bin Original_LF__DOT__Induction_LF_Induction_bin_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.bin Imported.Original_LF__DOT__Induction_LF_Induction_bin Original_LF__DOT__Induction_LF_Induction_bin_iso := {}.