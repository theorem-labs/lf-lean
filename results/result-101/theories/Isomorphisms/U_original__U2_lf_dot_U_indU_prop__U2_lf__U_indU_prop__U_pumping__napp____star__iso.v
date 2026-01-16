From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_pumping__napp__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_star__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__star : forall (x : Type) (x0 : imported_nat) (x1 x2 : imported_Original_LF__DOT__Poly_LF_Poly_list x) (x3 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x1 x3 ->
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2 (imported_Original_LF__DOT__IndProp_LF_IndProp_Star x3) ->
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x0 x1) x2)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_Star x3) := Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__star.
Instance Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__star_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1)
    (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) (x7 : Original.LF_DOT_Poly.LF.Poly.list x1)
    (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8) (x9 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1)
    (x10 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2) (hx3 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x9 x10)
    (x11 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x5 x9) (x12 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x6 x10),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 hx3) x11 x12 ->
  forall (x13 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x7 (Original.LF_DOT_IndProp.LF.IndProp.Star x9))
    (x14 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x8 (imported_Original_LF__DOT__IndProp_LF_IndProp_Star x10)),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx2 (Original_LF__DOT__IndProp_LF_IndProp_Star_iso hx3)) x13 x14 ->
  rel_iso
    (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_app_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso hx0 hx1) hx2)
       (Original_LF__DOT__IndProp_LF_IndProp_Star_iso hx3))
    (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp_star x1 x3 x5 x7 x9 x11 x13) (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__star x4 x12 x14).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp_star := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__star := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp_star Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__star_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp_star Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__star Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__star_iso := {}.