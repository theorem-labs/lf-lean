From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.ex__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_in__split : forall (x : Type) (x0 : x) (x1 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Original_LF__DOT__Logic_LF_Logic_In x0 x1 ->
  imported_ex
    (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x =>
     imported_ex
       (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x =>
        imported_Corelib_Init_Logic_eq x1 (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_cons x0 H0)))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_in__split.
Instance Original_LF__DOT__IndProp_LF_IndProp_in__split_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (hx0 : rel_iso hx x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) (x7 : Original.LF_DOT_Logic.LF.Logic.In x3 x5) (x8 : imported_Original_LF__DOT__Logic_LF_Logic_In x4 x6),
  rel_iso
    {|
      to := Original_LF__DOT__Logic_LF_Logic_In_iso hx0 hx1;
      from := from (Original_LF__DOT__Logic_LF_Logic_In_iso hx0 hx1);
      to_from := fun x : imported_Original_LF__DOT__Logic_LF_Logic_In x4 x6 => to_from (Original_LF__DOT__Logic_LF_Logic_In_iso hx0 hx1) x;
      from_to := fun x : Original.LF_DOT_Logic.LF.Logic.In x3 x5 => seq_p_of_t (from_to (Original_LF__DOT__Logic_LF_Logic_In_iso hx0 hx1) x)
    |} x7 x8 ->
  rel_iso
    {|
      to :=
        ex_iso (fun l1 : Original.LF_DOT_Poly.LF.Poly.list x1 => exists l2 : Original.LF_DOT_Poly.LF.Poly.list x1, x5 = Original.LF_DOT_Poly.LF.Poly.app l1 (Original.LF_DOT_Poly.LF.Poly.cons x3 l2))
          (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
           imported_ex
             (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
              imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 H0))))
          (fun (x9 : Original.LF_DOT_Poly.LF.Poly.list x1) (x10 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx3 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x9 x10) =>
           ex_iso (fun l2 : Original.LF_DOT_Poly.LF.Poly.list x1 => x5 = Original.LF_DOT_Poly.LF.Poly.app x9 (Original.LF_DOT_Poly.LF.Poly.cons x3 l2))
             (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
              imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app x10 (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 H)))
             (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx4 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x11 x12) =>
              Corelib_Init_Logic_eq_iso hx1 (Original_LF__DOT__Poly_LF_Poly_app_iso hx3 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx4))));
      from :=
        from
          (ex_iso
             (fun l1 : Original.LF_DOT_Poly.LF.Poly.list x1 => exists l2 : Original.LF_DOT_Poly.LF.Poly.list x1, x5 = Original.LF_DOT_Poly.LF.Poly.app l1 (Original.LF_DOT_Poly.LF.Poly.cons x3 l2))
             (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
              imported_ex
                (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 H0))))
             (fun (x9 : Original.LF_DOT_Poly.LF.Poly.list x1) (x10 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx3 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x9 x10) =>
              ex_iso (fun l2 : Original.LF_DOT_Poly.LF.Poly.list x1 => x5 = Original.LF_DOT_Poly.LF.Poly.app x9 (Original.LF_DOT_Poly.LF.Poly.cons x3 l2))
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app x10 (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 H)))
                (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx4 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x11 x12) =>
                 Corelib_Init_Logic_eq_iso hx1 (Original_LF__DOT__Poly_LF_Poly_app_iso hx3 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx4)))));
      to_from :=
        fun
          x : imported_ex
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_ex
                   (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                    imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 H0)))) =>
        to_from
          (ex_iso
             (fun l1 : Original.LF_DOT_Poly.LF.Poly.list x1 => exists l2 : Original.LF_DOT_Poly.LF.Poly.list x1, x5 = Original.LF_DOT_Poly.LF.Poly.app l1 (Original.LF_DOT_Poly.LF.Poly.cons x3 l2))
             (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
              imported_ex
                (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 H0))))
             (fun (x9 : Original.LF_DOT_Poly.LF.Poly.list x1) (x10 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx3 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x9 x10) =>
              ex_iso (fun l2 : Original.LF_DOT_Poly.LF.Poly.list x1 => x5 = Original.LF_DOT_Poly.LF.Poly.app x9 (Original.LF_DOT_Poly.LF.Poly.cons x3 l2))
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app x10 (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 H)))
                (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx4 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x11 x12) =>
                 Corelib_Init_Logic_eq_iso hx1 (Original_LF__DOT__Poly_LF_Poly_app_iso hx3 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx4)))))
          x;
      from_to :=
        fun x : exists y l2 : Original.LF_DOT_Poly.LF.Poly.list x1, x5 = Original.LF_DOT_Poly.LF.Poly.app y (Original.LF_DOT_Poly.LF.Poly.cons x3 l2) =>
        seq_p_of_t
          (from_to
             (ex_iso
                (fun l1 : Original.LF_DOT_Poly.LF.Poly.list x1 => exists l2 : Original.LF_DOT_Poly.LF.Poly.list x1, x5 = Original.LF_DOT_Poly.LF.Poly.app l1 (Original.LF_DOT_Poly.LF.Poly.cons x3 l2))
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_ex
                   (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                    imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 H0))))
                (fun (x9 : Original.LF_DOT_Poly.LF.Poly.list x1) (x10 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx3 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x9 x10) =>
                 ex_iso (fun l2 : Original.LF_DOT_Poly.LF.Poly.list x1 => x5 = Original.LF_DOT_Poly.LF.Poly.app x9 (Original.LF_DOT_Poly.LF.Poly.cons x3 l2))
                   (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                    imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app x10 (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 H)))
                   (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx4 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x11 x12) =>
                    Corelib_Init_Logic_eq_iso hx1 (Original_LF__DOT__Poly_LF_Poly_app_iso hx3 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx4)))))
             x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.in_split x1 x3 x5 x7) (imported_Original_LF__DOT__IndProp_LF_IndProp_in__split x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.in_split := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_in__split := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.in_split Original_LF__DOT__IndProp_LF_IndProp_in__split_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.in_split Imported.Original_LF__DOT__IndProp_LF_IndProp_in__split Original_LF__DOT__IndProp_LF_IndProp_in__split_iso := {}.