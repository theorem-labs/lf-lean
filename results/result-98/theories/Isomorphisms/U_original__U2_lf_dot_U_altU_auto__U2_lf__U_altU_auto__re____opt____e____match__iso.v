From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__re____opt____e__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_re__opt__e__match : forall (x : Type) (x0 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x) (x1 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x1 x0 -> imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x1 (imported_Original_LF__DOT__AltAuto_LF_AltAuto_re__opt__e x0) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_re__opt__e__match.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_re__opt__e__match_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx0 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) (x7 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x5 x3) (x8 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x6 x4),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 hx0) x7 x8 ->
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 (Original_LF__DOT__AltAuto_LF_AltAuto_re__opt__e_iso hx0)) (Original.LF_DOT_AltAuto.LF.AltAuto.re_opt_e_match x1 x3 x5 x7)
    (imported_Original_LF__DOT__AltAuto_LF_AltAuto_re__opt__e__match x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.re_opt_e_match := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_re__opt__e__match := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.re_opt_e_match Original_LF__DOT__AltAuto_LF_AltAuto_re__opt__e__match_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.re_opt_e_match Imported.Original_LF__DOT__AltAuto_LF_AltAuto_re__opt__e__match Original_LF__DOT__AltAuto_LF_AltAuto_re__opt__e__match_iso := {}.