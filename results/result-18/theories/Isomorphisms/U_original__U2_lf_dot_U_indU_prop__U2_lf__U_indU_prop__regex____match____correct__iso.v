From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__matches____regex__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__regex____match__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_regex__match__correct : forall (x : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii) (x0 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
  imported_Original_LF__DOT__IndProp_LF_IndProp_reflect (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x x0) (imported_Original_LF__DOT__IndProp_LF_IndProp_regex__match x x0) := Imported.Original_LF__DOT__IndProp_LF_IndProp_regex__match__correct.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_regex__match__correct_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.string) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii)
    (hx : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii)
    (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii) (hx0 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x3 x4),
  rel_iso
    (relax_Iso_Ts_Ps (Original_LF__DOT__IndProp_LF_IndProp_reflect_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx hx0) (Original_LF__DOT__IndProp_LF_IndProp_regex__match_iso hx hx0)))
    (Original.LF_DOT_IndProp.LF.IndProp.regex_match_correct x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_regex__match__correct x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.regex_match_correct := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_regex__match__correct := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.regex_match_correct Original_LF__DOT__IndProp_LF_IndProp_regex__match__correct_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.regex_match_correct Imported.Original_LF__DOT__IndProp_LF_IndProp_regex__match__correct Original_LF__DOT__IndProp_LF_IndProp_regex__match__correct_iso := {}.