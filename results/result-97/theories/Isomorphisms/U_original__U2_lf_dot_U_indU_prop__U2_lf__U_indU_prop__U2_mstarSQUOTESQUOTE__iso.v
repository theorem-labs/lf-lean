From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_star__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__fold__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.and__iso Isomorphisms.ex__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_MStar'' : forall (x : Type) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list x) (x1 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x0 (imported_Original_LF__DOT__IndProp_LF_IndProp_Star x1) ->
  imported_ex
    (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list (imported_Original_LF__DOT__Poly_LF_Poly_list x) =>
     imported_and
       (imported_Corelib_Init_Logic_eq x0
          (imported_Original_LF__DOT__Poly_LF_Poly_fold (fun H0 H1 : imported_Original_LF__DOT__Poly_LF_Poly_list x => imported_Original_LF__DOT__Poly_LF_Poly_app H0 H1) H
             (imported_Original_LF__DOT__Poly_LF_Poly_nil x)))
       (forall a' : imported_Original_LF__DOT__Poly_LF_Poly_list x, imported_Original_LF__DOT__Logic_LF_Logic_In a' H -> imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match a' x1)) := Imported.Original_LF__DOT__IndProp_LF_IndProp_MStar''.
Instance Original_LF__DOT__IndProp_LF_IndProp_MStar''_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4) (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx1 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x5 x6) (x7 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 (Original.LF_DOT_IndProp.LF.IndProp.Star x5))
    (x8 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 (imported_Original_LF__DOT__IndProp_LF_IndProp_Star x6)),
  rel_iso (relax_Iso_Ts_Ps (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 (Original_LF__DOT__IndProp_LF_IndProp_Star_iso hx1))) x7 x8 ->
  rel_iso
    (relax_Iso_Ts_Ps
       (ex_iso
          (fun ss : Original.LF_DOT_Poly.LF.Poly.list (Original.LF_DOT_Poly.LF.Poly.list x1) =>
           x3 = Original.LF_DOT_Poly.LF.Poly.fold Original.LF_DOT_Poly.LF.Poly.app ss Original.LF_DOT_Poly.LF.Poly.nil /\
           (forall s' : Original.LF_DOT_Poly.LF.Poly.list x1, Original.LF_DOT_Logic.LF.Logic.In s' ss -> Original.LF_DOT_IndProp.LF.IndProp.exp_match s' x5))
          (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list (imported_Original_LF__DOT__Poly_LF_Poly_list x2) =>
           imported_and
             (imported_Corelib_Init_Logic_eq x4
                (imported_Original_LF__DOT__Poly_LF_Poly_fold (fun H0 H1 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 => imported_Original_LF__DOT__Poly_LF_Poly_app H0 H1) H
                   (imported_Original_LF__DOT__Poly_LF_Poly_nil x2)))
             (forall a' : imported_Original_LF__DOT__Poly_LF_Poly_list x2, imported_Original_LF__DOT__Logic_LF_Logic_In a' H -> imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match a' x6))
          (fun (x9 : Original.LF_DOT_Poly.LF.Poly.list (Original.LF_DOT_Poly.LF.Poly.list x1)) (x10 : imported_Original_LF__DOT__Poly_LF_Poly_list (imported_Original_LF__DOT__Poly_LF_Poly_list x2))
             (hx3 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx)) x9 x10) =>
           and_iso
             (Corelib_Init_Logic_eq_iso hx0
                (unwrap_sprop
                   (Original_LF__DOT__Poly_LF_Poly_fold_iso (IsoIso (Original_LF__DOT__Poly_LF_Poly_list_iso hx)) Original.LF_DOT_Poly.LF.Poly.app
                      (fun H H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 => imported_Original_LF__DOT__Poly_LF_Poly_app H H0)
                      (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx4 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x11 x12)
                         (x13 : Original.LF_DOT_Poly.LF.Poly.list x1) (x14 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
                         (hx5 : rel_iso_sort (IsoIso (Original_LF__DOT__Poly_LF_Poly_list_iso hx)) x13 x14) =>
                       {| unwrap_sprop := Original_LF__DOT__Poly_LF_Poly_app_iso hx4 (unwrap_sprop hx5) |})
                      hx3 Original.LF_DOT_Poly.LF.Poly.nil (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) {| unwrap_sprop := Original_LF__DOT__Poly_LF_Poly_nil_iso hx |})))
             (IsoForall (fun a : Original.LF_DOT_Poly.LF.Poly.list x1 => Original.LF_DOT_Logic.LF.Logic.In a x9 -> Original.LF_DOT_IndProp.LF.IndProp.exp_match a x5)
                (fun a' : imported_Original_LF__DOT__Poly_LF_Poly_list x2 => imported_Original_LF__DOT__Logic_LF_Logic_In a' x10 -> imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match a' x6)
                (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx4 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x11 x12) =>
                 IsoArrow (Original_LF__DOT__Logic_LF_Logic_In_iso hx4 hx3) (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx4 hx1))))))
    (Original.LF_DOT_IndProp.LF.IndProp.MStar'' x1 x3 x5 x7) (imported_Original_LF__DOT__IndProp_LF_IndProp_MStar'' x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.MStar'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_MStar'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.MStar'' Original_LF__DOT__IndProp_LF_IndProp_MStar''_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.MStar'' Imported.Original_LF__DOT__IndProp_LF_IndProp_MStar'' Original_LF__DOT__IndProp_LF_IndProp_MStar''_iso := {}.