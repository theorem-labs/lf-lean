From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reg____exp__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant : forall x : Type, imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x -> imported_nat := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant).
Instance Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3 x4 ->
  rel_iso nat_iso (Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x4).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant) Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant) Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso := {}.