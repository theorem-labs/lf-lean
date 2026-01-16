From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__bin____to____nat__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__nat____to____bin__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_nat__bin__nat : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Induction_LF_Induction_bin__to__nat (imported_Original_LF__DOT__Induction_LF_Induction_nat__to__bin x)) x := Imported.Original_LF__DOT__Induction_LF_Induction_nat__bin__nat.
Instance Original_LF__DOT__Induction_LF_Induction_nat__bin__nat_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Induction_LF_Induction_bin__to__nat_iso (Original_LF__DOT__Induction_LF_Induction_nat__to__bin_iso hx)) hx)
    (Original.LF_DOT_Induction.LF.Induction.nat_bin_nat x1) (imported_Original_LF__DOT__Induction_LF_Induction_nat__bin__nat x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.nat_bin_nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_nat__bin__nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.nat_bin_nat Original_LF__DOT__Induction_LF_Induction_nat__bin__nat_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.nat_bin_nat Imported.Original_LF__DOT__Induction_LF_Induction_nat__bin__nat Original_LF__DOT__Induction_LF_Induction_nat__bin__nat_iso := {}.