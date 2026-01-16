From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__bin____to____nat__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__incr__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Induction_LF_Induction_bin__to__nat__pres__incr : forall x : imported_Original_LF__DOT__Induction_LF_Induction_bin,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Induction_LF_Induction_bin__to__nat (imported_Original_LF__DOT__Induction_LF_Induction_incr x))
    (imported_Nat_add (imported_S imported_0) (imported_Original_LF__DOT__Induction_LF_Induction_bin__to__nat x)) := Imported.Original_LF__DOT__Induction_LF_Induction_bin__to__nat__pres__incr.
Monomorphic Instance Original_LF__DOT__Induction_LF_Induction_bin__to__nat__pres__incr_iso : forall (x1 : Original.LF_DOT_Induction.LF.Induction.bin) (x2 : imported_Original_LF__DOT__Induction_LF_Induction_bin) (hx : rel_iso Original_LF__DOT__Induction_LF_Induction_bin_iso x1 x2),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Induction_LF_Induction_bin__to__nat_iso (Original_LF__DOT__Induction_LF_Induction_incr_iso hx))
       (Nat_add_iso (S_iso _0_iso) (Original_LF__DOT__Induction_LF_Induction_bin__to__nat_iso hx)))
    (Original.LF_DOT_Induction.LF.Induction.bin_to_nat_pres_incr x1) (imported_Original_LF__DOT__Induction_LF_Induction_bin__to__nat__pres__incr x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.bin_to_nat_pres_incr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_bin__to__nat__pres__incr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.bin_to_nat_pres_incr Original_LF__DOT__Induction_LF_Induction_bin__to__nat__pres__incr_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.bin_to_nat_pres_incr Imported.Original_LF__DOT__Induction_LF_Induction_bin__to__nat__pres__incr Original_LF__DOT__Induction_LF_Induction_bin__to__nat__pres__incr_iso := {}.