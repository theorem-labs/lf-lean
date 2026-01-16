From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_app__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_ascii__ascii__iso Isomorphisms.and__iso Isomorphisms.ex__iso Isomorphisms.iff__iso Isomorphisms.or__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_app__ne : forall (x : imported_Ascii_ascii) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii) (x1 x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
  imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x x0) (imported_Original_LF__DOT__IndProp_LF_IndProp_App x1 x2))
    (imported_or
       (imported_and (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_Ascii_ascii) x1)
          (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x x0) x2))
       (imported_ex
          (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii =>
           imported_ex
             (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii =>
              imported_and (imported_Corelib_Init_Logic_eq x0 (imported_Original_LF__DOT__Poly_LF_Poly_app H H0))
                (imported_and (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x H) x1)
                   (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match H0 x2)))))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_app__ne.
Instance Original_LF__DOT__IndProp_LF_IndProp_app__ne_iso : forall (x1 : Ascii.ascii) (x2 : imported_Ascii_ascii) (hx : rel_iso Ascii_ascii_iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii)
    (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii) (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x3 x4)
    (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii)
    (hx1 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x5 x6) (x7 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii)
    (x8 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii) (hx2 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x7 x8),
  rel_iso
    (relax_Iso_Ts_Ps
       (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx hx0) (Original_LF__DOT__IndProp_LF_IndProp_App_iso hx1 hx2))
          (or_iso
             (and_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_nil_iso Ascii_ascii_iso) hx1)
                (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx hx0) hx2))
             (ex_iso
                (fun s0 : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii =>
                 exists s1 : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii,
                   x3 = Original.LF_DOT_Poly.LF.Poly.app s0 s1 /\
                   Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.cons x1 s0) x5 /\ Original.LF_DOT_IndProp.LF.IndProp.exp_match s1 x7)
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii =>
                 imported_ex
                   (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii =>
                    imported_and (imported_Corelib_Init_Logic_eq x4 (imported_Original_LF__DOT__Poly_LF_Poly_app H H0))
                      (imported_and (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 H) x6)
                         (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match H0 x8))))
                (fun (x9 : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii) (x10 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii)
                   (hx3 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x9 x10) =>
                 ex_iso
                   (fun s1 : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii =>
                    x3 = Original.LF_DOT_Poly.LF.Poly.app x9 s1 /\
                    Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.cons x1 x9) x5 /\ Original.LF_DOT_IndProp.LF.IndProp.exp_match s1 x7)
                   (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii =>
                    imported_and (imported_Corelib_Init_Logic_eq x4 (imported_Original_LF__DOT__Poly_LF_Poly_app x10 H))
                      (imported_and (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 x10) x6)
                         (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match H x8)))
                   (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii)
                      (hx4 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x11 x12) =>
                    and_iso (Corelib_Init_Logic_eq_iso hx0 (Original_LF__DOT__Poly_LF_Poly_app_iso hx3 hx4))
                      (and_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx hx3) hx1) (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx4 hx2))))))))
    (Original.LF_DOT_IndProp.LF.IndProp.app_ne x1 x3 x5 x7) (imported_Original_LF__DOT__IndProp_LF_IndProp_app__ne x2 x4 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.app_ne := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_app__ne := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.app_ne Original_LF__DOT__IndProp_LF_IndProp_app__ne_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.app_ne Imported.Original_LF__DOT__IndProp_LF_IndProp_app__ne Original_LF__DOT__IndProp_LF_IndProp_app__ne_iso := {}.