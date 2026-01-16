From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__bin__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Induction_LF_Induction_nat__to__bin : imported_nat -> imported_Original_LF__DOT__Induction_LF_Induction_bin := Imported.Original_LF__DOT__Induction_LF_Induction_nat__to__bin.
Monomorphic Instance Original_LF__DOT__Induction_LF_Induction_nat__to__bin_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  rel_iso Original_LF__DOT__Induction_LF_Induction_bin_iso (Original.LF_DOT_Induction.LF.Induction.nat_to_bin x1) (imported_Original_LF__DOT__Induction_LF_Induction_nat__to__bin x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.nat_to_bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_nat__to__bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.nat_to_bin Original_LF__DOT__Induction_LF_Induction_nat__to__bin_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.nat_to_bin Imported.Original_LF__DOT__Induction_LF_Induction_nat__to__bin Original_LF__DOT__Induction_LF_Induction_nat__to__bin_iso := {}.