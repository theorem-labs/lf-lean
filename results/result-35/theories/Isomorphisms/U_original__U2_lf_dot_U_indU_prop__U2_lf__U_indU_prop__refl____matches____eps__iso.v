From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_ascii__ascii__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reflect__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_refl__matches__eps : (imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__Basics_LF_Basics_bool) -> SProp := fun x : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__Basics_LF_Basics_bool =>
  forall a' : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii,
  imported_Original_LF__DOT__IndProp_LF_IndProp_reflect (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_Ascii_ascii) a') (x a').
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_refl__matches__eps_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii -> Original.LF_DOT_Basics.LF.Basics.bool)
    (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__Basics_LF_Basics_bool),
  (forall (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
   rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x3 x4 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x1 x3) (x2 x4)) ->
  Iso (Original.LF_DOT_IndProp.LF.IndProp.refl_matches_eps x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_refl__matches__eps x2)
  := fun (x1 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii -> Original.LF_DOT_Basics.LF.Basics.bool)
    (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__Basics_LF_Basics_bool)
    (hx : forall (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
          rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x3 x4 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x1 x3) (x2 x4)) =>
  IsoForall
    (fun a : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii =>
     Original.LF_DOT_IndProp.LF.IndProp.reflect (Original.LF_DOT_IndProp.LF.IndProp.exp_match Original.LF_DOT_Poly.LF.Poly.nil a) (x1 a))
    (fun x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii =>
     imported_Original_LF__DOT__IndProp_LF_IndProp_reflect (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_Ascii_ascii) x4) (x2 x4))
    (fun (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii)
       (hx0 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x3 x4) =>
     relax_Iso_Ts_Ps
       (Original_LF__DOT__IndProp_LF_IndProp_reflect_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_nil_iso Ascii_ascii_iso) hx0) (hx x3 x4 hx0))).

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.refl_matches_eps := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_refl__matches__eps := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.refl_matches_eps Original_LF__DOT__IndProp_LF_IndProp_refl__matches__eps_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.refl_matches_eps Imported.Original_LF__DOT__IndProp_LF_IndProp_refl__matches__eps Original_LF__DOT__IndProp_LF_IndProp_refl__matches__eps_iso := {}.