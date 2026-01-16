From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_all__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__forallb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_forallb__true__iff : forall (x : Type) (x0 : x -> imported_Original_LF__DOT__Basics_LF_Basics_bool) (x1 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_iff (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Logic_LF_Logic_forallb (fun H : x => x0 H) x1) imported_Original_LF__DOT__Basics_LF_Basics_true)
    (imported_Original_LF__DOT__Logic_LF_Logic_All (fun H : x => imported_Corelib_Init_Logic_eq (x0 H) imported_Original_LF__DOT__Basics_LF_Basics_true) x1) := Imported.Original_LF__DOT__Logic_LF_Logic_forallb__true__iff.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_forallb__true__iff_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Original.LF_DOT_Basics.LF.Basics.bool) (x4 : x2 -> imported_Original_LF__DOT__Basics_LF_Basics_bool)
    (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x3 x5) (x4 x6)) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1)
    (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6),
  rel_iso
    (relax_Iso_Ts_Ps
       (iff_iso
          (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Logic_LF_Logic_forallb_iso x3 (fun H : x2 => x4 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx0 x7 x8 hx2) hx1)
             Original_LF__DOT__Basics_LF_Basics_true_iso)
          (Original_LF__DOT__Logic_LF_Logic_All_iso (fun x : x1 => x3 x = Original.LF_DOT_Basics.LF.Basics.true)
             (fun H : x2 => imported_Corelib_Init_Logic_eq (x4 H) imported_Original_LF__DOT__Basics_LF_Basics_true)
             (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => Corelib_Init_Logic_eq_iso (hx0 x7 x8 hx2) Original_LF__DOT__Basics_LF_Basics_true_iso) hx1)))
    (Original.LF_DOT_Logic.LF.Logic.forallb_true_iff x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_forallb__true__iff x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.forallb_true_iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_forallb__true__iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.forallb_true_iff Original_LF__DOT__Logic_LF_Logic_forallb__true__iff_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.forallb_true_iff Imported.Original_LF__DOT__Logic_LF_Logic_forallb__true__iff Original_LF__DOT__Logic_LF_Logic_forallb__true__iff_iso := {}.