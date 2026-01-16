From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__bin__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_bin__to__nat : imported_Original_LF__DOT__Induction_LF_Induction_bin -> imported_nat := Imported.Original_LF__DOT__Induction_LF_Induction_bin__to__nat.
Instance Original_LF__DOT__Induction_LF_Induction_bin__to__nat_iso : forall (x1 : Original.LF_DOT_Induction.LF.Induction.bin) (x2 : imported_Original_LF__DOT__Induction_LF_Induction_bin),
  rel_iso Original_LF__DOT__Induction_LF_Induction_bin_iso x1 x2 ->
  rel_iso nat_iso (Original.LF_DOT_Induction.LF.Induction.bin_to_nat x1) (imported_Original_LF__DOT__Induction_LF_Induction_bin__to__nat x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.bin_to_nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_bin__to__nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.bin_to_nat Original_LF__DOT__Induction_LF_Induction_bin__to__nat_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.bin_to_nat Imported.Original_LF__DOT__Induction_LF_Induction_bin__to__nat Original_LF__DOT__Induction_LF_Induction_bin__to__nat_iso := {}.