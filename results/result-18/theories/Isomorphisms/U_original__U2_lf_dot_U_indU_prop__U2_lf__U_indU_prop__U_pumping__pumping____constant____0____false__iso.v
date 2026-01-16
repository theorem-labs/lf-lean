From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_pumping__pumping____constant__iso Isomorphisms.__0__iso Isomorphisms.U_original__U_false__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__0__false : forall (x : Type) (x0 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x0) imported_0 -> imported_Original_False := Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__0__false.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__0__false_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx0 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3 x4) (x5 : Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x3 = 0)
    (x6 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x4) imported_0),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso hx0) _0_iso) x5 x6 ->
  rel_iso Original_False_iso (Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant_0_false x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__0__false x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant_0_false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__0__false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant_0_false Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__0__false_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant_0_false Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__0__false Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__0__false_iso := {}.