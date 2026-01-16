From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_ascii__ascii__iso Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_is__der : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Ascii_ascii -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> SProp := fun (x : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii) (x0 : imported_Ascii_ascii) (x1 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii) =>
  forall a' : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii,
  imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x0 a') x) (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match a' x1).
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_is__der_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x1 x2 ->
  forall (x3 : Ascii.ascii) (x4 : imported_Ascii_ascii),
  rel_iso Ascii_ascii_iso x3 x4 ->
  forall (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x5 x6 ->
  Iso (Original.LF_DOT_IndProp.LF.IndProp.is_der x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_is__der x2 x4 x6)
  := fun (x1 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii)
    (hx : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x1 x2) (x3 : Ascii.ascii) (x4 : imported_Ascii_ascii) (hx0 : rel_iso Ascii_ascii_iso x3 x4)
    (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii)
    (hx1 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x5 x6) =>
  IsoForall
    (fun a : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii =>
     Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.cons x3 a) x1 <-> Original.LF_DOT_IndProp.LF.IndProp.exp_match a x5)
    (fun x8 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii =>
     imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 x8) x2) (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x8 x6))
    (fun (x7 : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii)
       (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x7 x8) =>
     relax_Iso_Ts_Ps (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx2) hx) (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx2 hx1))).

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.is_der := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_is__der := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.is_der Original_LF__DOT__IndProp_LF_IndProp_is__der_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.is_der Imported.Original_LF__DOT__IndProp_LF_IndProp_is__der Original_LF__DOT__IndProp_LF_IndProp_is__der_iso := {}.