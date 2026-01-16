From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__bin__iso.

Monomorphic Definition imported_Original_LF__DOT__Induction_LF_Induction_Z : imported_Original_LF__DOT__Induction_LF_Induction_bin := Imported.Original_LF__DOT__Induction_LF_Induction_Z.
Monomorphic Instance Original_LF__DOT__Induction_LF_Induction_Z_iso : rel_iso Original_LF__DOT__Induction_LF_Induction_bin_iso Original.LF_DOT_Induction.LF.Induction.Z imported_Original_LF__DOT__Induction_LF_Induction_Z.
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.Z := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_Z := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.Z Original_LF__DOT__Induction_LF_Induction_Z_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.Z Imported.Original_LF__DOT__Induction_LF_Induction_Z Original_LF__DOT__Induction_LF_Induction_Z_iso := {}.