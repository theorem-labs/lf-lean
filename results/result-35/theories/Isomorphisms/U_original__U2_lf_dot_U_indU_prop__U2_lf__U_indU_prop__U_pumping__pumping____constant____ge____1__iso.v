From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_pumping__pumping____constant__iso Isomorphisms.__0__iso Isomorphisms.U_s__iso Isomorphisms.ge__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1 : forall (x : Type) (x0 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x), imported_ge (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x0) (imported_S imported_0) := Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx0 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3 x4),
  rel_iso (ge_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso hx0) (S_iso _0_iso)) (Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant_ge_1 x1 x3)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant_ge_1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant_ge_1 Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant_ge_1 Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1 Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1_iso := {}.