From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__merge__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_all__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__filter__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_merge__filter : forall (x : Type) (x0 : x -> imported_Original_LF__DOT__Basics_LF_Basics_bool) (x1 x2 x3 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_merge x2 x3 x1 ->
  imported_Original_LF__DOT__Logic_LF_Logic_All (fun H : x => imported_Corelib_Init_Logic_eq (x0 H) imported_Original_LF__DOT__Basics_LF_Basics_true) x2 ->
  imported_Original_LF__DOT__Logic_LF_Logic_All (fun H : x => imported_Corelib_Init_Logic_eq (x0 H) imported_Original_LF__DOT__Basics_LF_Basics_false) x3 ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_filter (fun H : x => x0 H) x1) x2 := Imported.Original_LF__DOT__IndProp_LF_IndProp_merge__filter.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_merge__filter_iso : forall (x1 : Set) (x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Original.LF_DOT_Basics.LF.Basics.bool) (x4 : x2 -> imported_Original_LF__DOT__Basics_LF_Basics_bool)
    (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x3 x5) (x4 x6)) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1)
    (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) (x7 : Original.LF_DOT_Poly.LF.Poly.list x1)
    (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8) (x9 : Original.LF_DOT_Poly.LF.Poly.list x1)
    (x10 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx3 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x9 x10) (x11 : Original.LF_DOT_IndProp.LF.IndProp.merge x7 x9 x5)
    (x12 : imported_Original_LF__DOT__IndProp_LF_IndProp_merge x8 x10 x6),
  rel_iso (relax_Iso_Ts_Ps (Original_LF__DOT__IndProp_LF_IndProp_merge_iso hx2 hx3 hx1)) x11 x12 ->
  forall (x13 : Original.LF_DOT_Logic.LF.Logic.All (fun n : x1 => x3 n = Original.LF_DOT_Basics.LF.Basics.true) x7)
    (x14 : imported_Original_LF__DOT__Logic_LF_Logic_All (fun H : x2 => imported_Corelib_Init_Logic_eq (x4 H) imported_Original_LF__DOT__Basics_LF_Basics_true) x8),
  rel_iso
    (relax_Iso_Ts_Ps
       (Original_LF__DOT__Logic_LF_Logic_All_iso (fun n : x1 => x3 n = Original.LF_DOT_Basics.LF.Basics.true)
          (fun H : x2 => imported_Corelib_Init_Logic_eq (x4 H) imported_Original_LF__DOT__Basics_LF_Basics_true)
          (fun (x15 : x1) (x16 : x2) (hx5 : rel_iso hx x15 x16) => Corelib_Init_Logic_eq_iso (hx0 x15 x16 hx5) Original_LF__DOT__Basics_LF_Basics_true_iso) hx2))
    x13 x14 ->
  forall (x15 : Original.LF_DOT_Logic.LF.Logic.All (fun n : x1 => x3 n = Original.LF_DOT_Basics.LF.Basics.false) x9)
    (x16 : imported_Original_LF__DOT__Logic_LF_Logic_All (fun H : x2 => imported_Corelib_Init_Logic_eq (x4 H) imported_Original_LF__DOT__Basics_LF_Basics_false) x10),
  rel_iso
    (relax_Iso_Ts_Ps
       (Original_LF__DOT__Logic_LF_Logic_All_iso (fun n : x1 => x3 n = Original.LF_DOT_Basics.LF.Basics.false)
          (fun H : x2 => imported_Corelib_Init_Logic_eq (x4 H) imported_Original_LF__DOT__Basics_LF_Basics_false)
          (fun (x17 : x1) (x18 : x2) (hx6 : rel_iso hx x17 x18) => Corelib_Init_Logic_eq_iso (hx0 x17 x18 hx6) Original_LF__DOT__Basics_LF_Basics_false_iso) hx3))
    x15 x16 ->
  rel_iso
    (relax_Iso_Ts_Ps (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_filter_iso x3 (fun H : x2 => x4 H) (fun (x17 : x1) (x18 : x2) (hx7 : rel_iso hx x17 x18) => hx0 x17 x18 hx7) hx1) hx2))
    (Original.LF_DOT_IndProp.LF.IndProp.merge_filter x1 x3 x5 x7 x9 x11 x13 x15) (imported_Original_LF__DOT__IndProp_LF_IndProp_merge__filter x4 x12 x14 x16).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.merge_filter := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_merge__filter := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.merge_filter Original_LF__DOT__IndProp_LF_IndProp_merge__filter_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.merge_filter Imported.Original_LF__DOT__IndProp_LF_IndProp_merge__filter Original_LF__DOT__IndProp_LF_IndProp_merge__filter_iso := {}.