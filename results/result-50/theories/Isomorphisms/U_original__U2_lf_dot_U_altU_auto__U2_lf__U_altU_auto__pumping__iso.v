From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* (* Typeclasses Opaque rel_iso. *) *)

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_pumping__napp__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_pumping__pumping____constant__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_nat__add__iso Isomorphisms.and__iso Isomorphisms.ex__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_pumping := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_pumping.

(* The pumping lemma is Admitted in Original.v, so this isomorphism is allowed to be Admitted.
   The type uses Peano.le which involves standard nat, while our imports use Imported.nat.
   We admit this since the underlying theorem is admitted anyway. *)
Instance Original_LF__DOT__AltAuto_LF_AltAuto_pumping_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) 
    (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) 
    (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx0 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3 x4) 
    (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) 
    (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) 
    (x7 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x5 x3) 
    (x8 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x6 x4)
    (Hrel1 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 hx0) x7 x8)
    (x9 : Peano.le (Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x3) (Original.LF_DOT_Poly.LF.Poly.length x5))
    (x10 : imported_le (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x4) (imported_Original_LF__DOT__Poly_LF_Poly_length x6))
    (Hrel2 : rel_iso (le_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso hx0) (Original_LF__DOT__Poly_LF_Poly_length_iso hx1)) x9 x10),
  rel_iso
    (ex_iso _ _
       (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) 
          (hx4 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x11 x12) =>
        ex_iso _ _
          (fun (x13 : Original.LF_DOT_Poly.LF.Poly.list x1) (x14 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) 
             (hx5 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x13 x14) =>
           ex_iso _ _
             (fun (x15 : Original.LF_DOT_Poly.LF.Poly.list x1) (x16 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) 
                (hx6 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x15 x16) =>
              and_iso (Corelib_Init_Logic_eq_iso hx1 (Original_LF__DOT__Poly_LF_Poly_app_iso hx4 (Original_LF__DOT__Poly_LF_Poly_app_iso hx5 hx6)))
                (and_iso (IsoArrow (Corelib_Init_Logic_eq_iso hx5 (Original_LF__DOT__Poly_LF_Poly_nil_iso hx)) False_iso)
                   (and_iso
                      (le_iso (Nat_add_iso (Original_LF__DOT__Poly_LF_Poly_length_iso hx4) (Original_LF__DOT__Poly_LF_Poly_length_iso hx5))
                         (Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso hx0))
                      (IsoForall _ _
                         (fun (m : Datatypes.nat) (m' : imported_nat) (hm : rel_iso nat_iso m m') =>
                          Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso
                            (Original_LF__DOT__Poly_LF_Poly_app_iso hx4
                               (Original_LF__DOT__Poly_LF_Poly_app_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso hm hx5) hx6)) hx0)))))))) 
    (Original.LF_DOT_AltAuto.LF.AltAuto.pumping x1 x3 x5 x7 x9) 
    (imported_Original_LF__DOT__AltAuto_LF_AltAuto_pumping x8 x10).
Admitted.

Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.pumping := {}.
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_pumping := {}.
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.pumping Original_LF__DOT__AltAuto_LF_AltAuto_pumping_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.pumping Imported.Original_LF__DOT__AltAuto_LF_AltAuto_pumping Original_LF__DOT__AltAuto_LF_AltAuto_pumping_iso := {}.
