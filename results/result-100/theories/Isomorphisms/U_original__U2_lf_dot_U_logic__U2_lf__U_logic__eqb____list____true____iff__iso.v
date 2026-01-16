From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__eqb____list__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_eqb__list__true__iff : forall (x : Type) (x0 : x -> x -> imported_Original_LF__DOT__Basics_LF_Basics_bool),
  (forall x1 x2 : x, imported_iff (imported_Corelib_Init_Logic_eq (x0 x1 x2) imported_Original_LF__DOT__Basics_LF_Basics_true) (imported_Corelib_Init_Logic_eq x1 x2)) ->
  forall x2 x3 : imported_Original_LF__DOT__Poly_LF_Poly_list x,
  imported_iff (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Logic_LF_Logic_eqb__list (fun H H0 : x => x0 H H0) x2 x3) imported_Original_LF__DOT__Basics_LF_Basics_true)
    (imported_Corelib_Init_Logic_eq x2 x3) := Imported.Original_LF__DOT__Logic_LF_Logic_eqb__list__true__iff.
Instance Original_LF__DOT__Logic_LF_Logic_eqb__list__true__iff_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> x1 -> Original.LF_DOT_Basics.LF.Basics.bool) (x4 : x2 -> x2 -> imported_Original_LF__DOT__Basics_LF_Basics_bool)
    (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x3 x5 x7) (x4 x6 x8))
    (x5 : forall a1 a2 : x1, x3 a1 a2 = Original.LF_DOT_Basics.LF.Basics.true <-> a1 = a2)
    (x6 : forall x x0 : x2, imported_iff (imported_Corelib_Init_Logic_eq (x4 x x0) imported_Original_LF__DOT__Basics_LF_Basics_true) (imported_Corelib_Init_Logic_eq x x0)),
  (forall (x7 : x1) (x8 : x2) (hx1 : rel_iso hx x7 x8) (x9 : x1) (x10 : x2) (hx2 : rel_iso hx x9 x10),
   rel_iso
     {|
       to := iff_iso (Corelib_Init_Logic_eq_iso (hx0 x7 x8 hx1 x9 x10 hx2) Original_LF__DOT__Basics_LF_Basics_true_iso) (Corelib_Init_Logic_eq_iso hx1 hx2);
       from := from (iff_iso (Corelib_Init_Logic_eq_iso (hx0 x7 x8 hx1 x9 x10 hx2) Original_LF__DOT__Basics_LF_Basics_true_iso) (Corelib_Init_Logic_eq_iso hx1 hx2));
       to_from :=
         fun x : imported_iff (imported_Corelib_Init_Logic_eq (x4 x8 x10) imported_Original_LF__DOT__Basics_LF_Basics_true) (imported_Corelib_Init_Logic_eq x8 x10) =>
         to_from (iff_iso (Corelib_Init_Logic_eq_iso (hx0 x7 x8 hx1 x9 x10 hx2) Original_LF__DOT__Basics_LF_Basics_true_iso) (Corelib_Init_Logic_eq_iso hx1 hx2)) x;
       from_to :=
         fun x : x3 x7 x9 = Original.LF_DOT_Basics.LF.Basics.true <-> x7 = x9 =>
         seq_p_of_t (from_to (iff_iso (Corelib_Init_Logic_eq_iso (hx0 x7 x8 hx1 x9 x10 hx2) Original_LF__DOT__Basics_LF_Basics_true_iso) (Corelib_Init_Logic_eq_iso hx1 hx2)) x)
     |} (x5 x7 x9) (x6 x8 x10)) ->
  forall (x7 : Original.LF_DOT_Poly.LF.Poly.list x1) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8)
    (x9 : Original.LF_DOT_Poly.LF.Poly.list x1) (x10 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx3 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x9 x10),
  rel_iso
    {|
      to :=
        iff_iso
          (Corelib_Init_Logic_eq_iso
             (Original_LF__DOT__Logic_LF_Logic_eqb__list_iso x3 (fun H H0 : x2 => x4 H H0)
                (fun (x11 : x1) (x12 : x2) (hx4 : rel_iso hx x11 x12) (x13 : x1) (x14 : x2) (hx5 : rel_iso hx x13 x14) => hx0 x11 x12 hx4 x13 x14 hx5) hx2 hx3)
             Original_LF__DOT__Basics_LF_Basics_true_iso)
          (Corelib_Init_Logic_eq_iso hx2 hx3);
      from :=
        from
          (iff_iso
             (Corelib_Init_Logic_eq_iso
                (Original_LF__DOT__Logic_LF_Logic_eqb__list_iso x3 (fun H H0 : x2 => x4 H H0)
                   (fun (x11 : x1) (x12 : x2) (hx4 : rel_iso hx x11 x12) (x13 : x1) (x14 : x2) (hx5 : rel_iso hx x13 x14) => hx0 x11 x12 hx4 x13 x14 hx5) hx2 hx3)
                Original_LF__DOT__Basics_LF_Basics_true_iso)
             (Corelib_Init_Logic_eq_iso hx2 hx3));
      to_from :=
        fun
          x : imported_iff (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Logic_LF_Logic_eqb__list (fun H H0 : x2 => x4 H H0) x8 x10) imported_Original_LF__DOT__Basics_LF_Basics_true)
                (imported_Corelib_Init_Logic_eq x8 x10) =>
        to_from
          (iff_iso
             (Corelib_Init_Logic_eq_iso
                (Original_LF__DOT__Logic_LF_Logic_eqb__list_iso x3 (fun H H0 : x2 => x4 H H0)
                   (fun (x11 : x1) (x12 : x2) (hx4 : rel_iso hx x11 x12) (x13 : x1) (x14 : x2) (hx5 : rel_iso hx x13 x14) => hx0 x11 x12 hx4 x13 x14 hx5) hx2 hx3)
                Original_LF__DOT__Basics_LF_Basics_true_iso)
             (Corelib_Init_Logic_eq_iso hx2 hx3))
          x;
      from_to :=
        fun x : Original.LF_DOT_Logic.LF.Logic.eqb_list x3 x7 x9 = Original.LF_DOT_Basics.LF.Basics.true <-> x7 = x9 =>
        seq_p_of_t
          (from_to
             (iff_iso
                (Corelib_Init_Logic_eq_iso
                   (Original_LF__DOT__Logic_LF_Logic_eqb__list_iso x3 (fun H H0 : x2 => x4 H H0)
                      (fun (x11 : x1) (x12 : x2) (hx4 : rel_iso hx x11 x12) (x13 : x1) (x14 : x2) (hx5 : rel_iso hx x13 x14) => hx0 x11 x12 hx4 x13 x14 hx5) hx2 hx3)
                   Original_LF__DOT__Basics_LF_Basics_true_iso)
                (Corelib_Init_Logic_eq_iso hx2 hx3))
             x)
    |} (Original.LF_DOT_Logic.LF.Logic.eqb_list_true_iff x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Logic_LF_Logic_eqb__list__true__iff x4 x6 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.eqb_list_true_iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_eqb__list__true__iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.eqb_list_true_iff Original_LF__DOT__Logic_LF_Logic_eqb__list__true__iff_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.eqb_list_true_iff Imported.Original_LF__DOT__Logic_LF_Logic_eqb__list__true__iff Original_LF__DOT__Logic_LF_Logic_eqb__list__true__iff_iso := {}.