From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__re____not____empty__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.ex__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_re__not__empty__correct : forall (x : Type) (x0 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x),
  imported_iff (imported_ex (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x => imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match H x0))
    (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__IndProp_LF_IndProp_re__not__empty x0) imported_Original_LF__DOT__Basics_LF_Basics_true) := Imported.Original_LF__DOT__IndProp_LF_IndProp_re__not__empty__correct.
Instance Original_LF__DOT__IndProp_LF_IndProp_re__not__empty__correct_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx0 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3 x4),
  rel_iso
    {|
      to :=
        iff_iso
          (ex_iso (fun s : Original.LF_DOT_Poly.LF.Poly.list x1 => Original.LF_DOT_IndProp.LF.IndProp.exp_match s x3)
             (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 => imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match H x4)
             (fun (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) =>
              Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 hx0))
          (Corelib_Init_Logic_eq_iso (Original_LF__DOT__IndProp_LF_IndProp_re__not__empty_iso hx0) Original_LF__DOT__Basics_LF_Basics_true_iso);
      from :=
        from
          (iff_iso
             (ex_iso (fun s : Original.LF_DOT_Poly.LF.Poly.list x1 => Original.LF_DOT_IndProp.LF.IndProp.exp_match s x3)
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 => imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match H x4)
                (fun (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) =>
                 Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 hx0))
             (Corelib_Init_Logic_eq_iso (Original_LF__DOT__IndProp_LF_IndProp_re__not__empty_iso hx0) Original_LF__DOT__Basics_LF_Basics_true_iso));
      to_from :=
        fun
          x : imported_iff (imported_ex (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 => imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match H x4))
                (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__IndProp_LF_IndProp_re__not__empty x4) imported_Original_LF__DOT__Basics_LF_Basics_true) =>
        to_from
          (iff_iso
             (ex_iso (fun s : Original.LF_DOT_Poly.LF.Poly.list x1 => Original.LF_DOT_IndProp.LF.IndProp.exp_match s x3)
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 => imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match H x4)
                (fun (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) =>
                 Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 hx0))
             (Corelib_Init_Logic_eq_iso (Original_LF__DOT__IndProp_LF_IndProp_re__not__empty_iso hx0) Original_LF__DOT__Basics_LF_Basics_true_iso))
          x;
      from_to :=
        fun
          x : (exists s : Original.LF_DOT_Poly.LF.Poly.list x1, Original.LF_DOT_IndProp.LF.IndProp.exp_match s x3) <->
              Original.LF_DOT_IndProp.LF.IndProp.re_not_empty x3 = Original.LF_DOT_Basics.LF.Basics.true =>
        seq_p_of_t
          (from_to
             (iff_iso
                (ex_iso (fun s : Original.LF_DOT_Poly.LF.Poly.list x1 => Original.LF_DOT_IndProp.LF.IndProp.exp_match s x3)
                   (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 => imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match H x4)
                   (fun (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) =>
                    Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 hx0))
                (Corelib_Init_Logic_eq_iso (Original_LF__DOT__IndProp_LF_IndProp_re__not__empty_iso hx0) Original_LF__DOT__Basics_LF_Basics_true_iso))
             x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.re_not_empty_correct x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_re__not__empty__correct x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.re_not_empty_correct := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_re__not__empty__correct := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.re_not_empty_correct Original_LF__DOT__IndProp_LF_IndProp_re__not__empty__correct_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.re_not_empty_correct Imported.Original_LF__DOT__IndProp_LF_IndProp_re__not__empty__correct Original_LF__DOT__IndProp_LF_IndProp_re__not__empty__correct_iso := {}.