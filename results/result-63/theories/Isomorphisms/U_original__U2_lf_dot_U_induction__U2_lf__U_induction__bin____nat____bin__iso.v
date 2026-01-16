From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__bin____to____nat__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__nat____to____bin__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__normalize__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_bin__nat__bin : forall x : imported_Original_LF__DOT__Induction_LF_Induction_bin,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Induction_LF_Induction_nat__to__bin (imported_Original_LF__DOT__Induction_LF_Induction_bin__to__nat x))
    (imported_Original_LF__DOT__Induction_LF_Induction_normalize x) := Imported.Original_LF__DOT__Induction_LF_Induction_bin__nat__bin.
Instance Original_LF__DOT__Induction_LF_Induction_bin__nat__bin_iso : forall (x1 : Original.LF_DOT_Induction.LF.Induction.bin) (x2 : imported_Original_LF__DOT__Induction_LF_Induction_bin) (hx : rel_iso Original_LF__DOT__Induction_LF_Induction_bin_iso x1 x2),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Induction_LF_Induction_nat__to__bin_iso (Original_LF__DOT__Induction_LF_Induction_bin__to__nat_iso hx))
       (Original_LF__DOT__Induction_LF_Induction_normalize_iso hx))
    (Original.LF_DOT_Induction.LF.Induction.bin_nat_bin x1) (imported_Original_LF__DOT__Induction_LF_Induction_bin__nat__bin x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.bin_nat_bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_bin__nat__bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.bin_nat_bin Original_LF__DOT__Induction_LF_Induction_bin__nat__bin_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.bin_nat_bin Imported.Original_LF__DOT__Induction_LF_Induction_bin__nat__bin Original_LF__DOT__Induction_LF_Induction_bin__nat__bin_iso := {}.