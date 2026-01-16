From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__re____chars__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_in__re__match : forall (x : Type) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list x) (x1 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x) (x2 : x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x0 x1 ->
  imported_Original_LF__DOT__Logic_LF_Logic_In x2 x0 -> imported_Original_LF__DOT__Logic_LF_Logic_In x2 (imported_Original_LF__DOT__IndProp_LF_IndProp_re__chars x1) := Imported.Original_LF__DOT__IndProp_LF_IndProp_in__re__match.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_in__re__match_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4) (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx1 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x5 x6) (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) (x9 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 x5)
    (x10 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 x6),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx1) x9 x10 ->
  forall (x11 : Original.LF_DOT_Logic.LF.Logic.In x7 x3) (x12 : imported_Original_LF__DOT__Logic_LF_Logic_In x8 x4),
  rel_iso (Original_LF__DOT__Logic_LF_Logic_In_iso hx2 hx0) x11 x12 ->
  rel_iso (Original_LF__DOT__Logic_LF_Logic_In_iso hx2 (Original_LF__DOT__IndProp_LF_IndProp_re__chars_iso hx1)) (Original.LF_DOT_IndProp.LF.IndProp.in_re_match x1 x3 x5 x7 x9 x11)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_in__re__match x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.in_re_match := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_in__re__match := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.in_re_match Original_LF__DOT__IndProp_LF_IndProp_in__re__match_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.in_re_match Imported.Original_LF__DOT__IndProp_LF_IndProp_in__re__match Original_LF__DOT__IndProp_LF_IndProp_in__re__match_iso := {}.