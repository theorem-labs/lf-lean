From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_r__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__fU_r__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_R__equiv__fR : forall x x0 x1 : imported_nat, imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_R x x0 x1) (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__IndProp_LF_IndProp_fR x x0) x1) := Imported.Original_LF__DOT__IndProp_LF_IndProp_R__equiv__fR.
Instance Original_LF__DOT__IndProp_LF_IndProp_R__equiv__fR_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6),
  rel_iso
    {|
      to := iff_iso (Original_LF__DOT__IndProp_LF_IndProp_R_iso hx hx0 hx1) (Corelib_Init_Logic_eq_iso (Original_LF__DOT__IndProp_LF_IndProp_fR_iso hx hx0) hx1);
      from := from (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_R_iso hx hx0 hx1) (Corelib_Init_Logic_eq_iso (Original_LF__DOT__IndProp_LF_IndProp_fR_iso hx hx0) hx1));
      to_from :=
        fun x : imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_R x2 x4 x6) (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__IndProp_LF_IndProp_fR x2 x4) x6) =>
        to_from (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_R_iso hx hx0 hx1) (Corelib_Init_Logic_eq_iso (Original_LF__DOT__IndProp_LF_IndProp_fR_iso hx hx0) hx1)) x;
      from_to :=
        fun x : Original.LF_DOT_IndProp.LF.IndProp.R x1 x3 x5 <-> Original.LF_DOT_IndProp.LF.IndProp.fR x1 x3 = x5 =>
        seq_p_of_t (from_to (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_R_iso hx hx0 hx1) (Corelib_Init_Logic_eq_iso (Original_LF__DOT__IndProp_LF_IndProp_fR_iso hx hx0) hx1)) x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.R_equiv_fR x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_R__equiv__fR x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.R_equiv_fR := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_R__equiv__fR := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.R_equiv_fR Original_LF__DOT__IndProp_LF_IndProp_R__equiv__fR_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.R_equiv_fR Imported.Original_LF__DOT__IndProp_LF_IndProp_R__equiv__fR Original_LF__DOT__IndProp_LF_IndProp_R__equiv__fR_iso := {}.