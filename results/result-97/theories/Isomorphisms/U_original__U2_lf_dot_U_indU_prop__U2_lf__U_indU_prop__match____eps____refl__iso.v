From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__match____eps__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__refl____matches____eps__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_match__eps__refl : forall x : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii,
  imported_Original_LF__DOT__IndProp_LF_IndProp_reflect (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_Ascii_ascii) x)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_match__eps x) := Imported.Original_LF__DOT__IndProp_LF_IndProp_match__eps__refl.
Instance Original_LF__DOT__IndProp_LF_IndProp_match__eps__refl_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii)
    (hx : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x1 x2),
  rel_iso
    (relax_Iso_Ts_Ps
       (Original_LF__DOT__IndProp_LF_IndProp_reflect_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_nil_iso Ascii_ascii_iso) hx)
          (Original_LF__DOT__IndProp_LF_IndProp_match__eps_iso hx)))
    (Original.LF_DOT_IndProp.LF.IndProp.match_eps_refl x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_match__eps__refl x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.match_eps_refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_match__eps__refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.match_eps_refl Original_LF__DOT__IndProp_LF_IndProp_match__eps__refl_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.match_eps_refl Imported.Original_LF__DOT__IndProp_LF_IndProp_match__eps__refl Original_LF__DOT__IndProp_LF_IndProp_match__eps__refl_iso := {}.