From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_star__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_star__app : forall (x : Type) (x0 x1 : imported_Original_LF__DOT__Poly_LF_Poly_list x) (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x0 (imported_Original_LF__DOT__IndProp_LF_IndProp_Star x2) ->
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x1 (imported_Original_LF__DOT__IndProp_LF_IndProp_Star x2) ->
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_app x0 x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_Star x2) := Imported.Original_LF__DOT__IndProp_LF_IndProp_star__app.
Instance Original_LF__DOT__IndProp_LF_IndProp_star__app_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) (x7 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x8 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx2 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x7 x8) (x9 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 (Original.LF_DOT_IndProp.LF.IndProp.Star x7))
    (x10 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 (imported_Original_LF__DOT__IndProp_LF_IndProp_Star x8)),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 (Original_LF__DOT__IndProp_LF_IndProp_Star_iso hx2)) x9 x10 ->
  forall (x11 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x5 (Original.LF_DOT_IndProp.LF.IndProp.Star x7))
    (x12 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x6 (imported_Original_LF__DOT__IndProp_LF_IndProp_Star x8)),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 (Original_LF__DOT__IndProp_LF_IndProp_Star_iso hx2)) x11 x12 ->
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_app_iso hx0 hx1) (Original_LF__DOT__IndProp_LF_IndProp_Star_iso hx2))
    (Original.LF_DOT_IndProp.LF.IndProp.star_app x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__IndProp_LF_IndProp_star__app x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.star_app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_star__app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.star_app Original_LF__DOT__IndProp_LF_IndProp_star__app_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.star_app Imported.Original_LF__DOT__IndProp_LF_IndProp_star__app Original_LF__DOT__IndProp_LF_IndProp_star__app_iso := {}.