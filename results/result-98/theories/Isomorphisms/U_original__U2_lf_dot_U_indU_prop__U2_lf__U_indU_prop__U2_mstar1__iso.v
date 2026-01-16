From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_star__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_MStar1 : forall (x : Type) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list x) (x1 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x0 x1 -> imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x0 (imported_Original_LF__DOT__IndProp_LF_IndProp_Star x1) := Imported.Original_LF__DOT__IndProp_LF_IndProp_MStar1.
Instance Original_LF__DOT__IndProp_LF_IndProp_MStar1_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4) (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx1 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x5 x6) (x7 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 x5)
    (x8 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 x6),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx1) x7 x8 ->
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 (Original_LF__DOT__IndProp_LF_IndProp_Star_iso hx1)) (Original.LF_DOT_IndProp.LF.IndProp.MStar1 x1 x3 x5 x7)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_MStar1 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.MStar1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_MStar1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.MStar1 Original_LF__DOT__IndProp_LF_IndProp_MStar1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.MStar1 Imported.Original_LF__DOT__IndProp_LF_IndProp_MStar1 Original_LF__DOT__IndProp_LF_IndProp_MStar1_iso := {}.