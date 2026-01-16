From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__map__iso Isomorphisms.and__iso Isomorphisms.ex__iso Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_In__map__iff : forall (x x0 : Type) (x1 : x -> x0) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list x) (x3 : x0),
  imported_iff (imported_Original_LF__DOT__Logic_LF_Logic_In x3 (imported_Original_LF__DOT__Poly_LF_Poly_map (fun H : x => x1 H) x2))
    (imported_ex (fun H : x => imported_and (imported_Corelib_Init_Logic_eq (x1 H) x3) (imported_Original_LF__DOT__Logic_LF_Logic_In H x2))) := Imported.Original_LF__DOT__Logic_LF_Logic_In__map__iff.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_In__map__iff_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x1 -> x3) (x6 : x2 -> x4) (hx1 : forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso hx0 (x5 x7) (x6 x8))
    (x7 : Original.LF_DOT_Poly.LF.Poly.list x1) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8) (x9 : x3) 
    (x10 : x4) (hx3 : rel_iso hx0 x9 x10),
  rel_iso
    (relax_Iso_Ts_Ps
       (iff_iso
          (Original_LF__DOT__Logic_LF_Logic_In_iso hx3 (Original_LF__DOT__Poly_LF_Poly_map_iso x5 (fun H : x2 => x6 H) (fun (x11 : x1) (x12 : x2) (hx4 : rel_iso hx x11 x12) => hx1 x11 x12 hx4) hx2))
          (ex_iso (fun x : x1 => x5 x = x9 /\ Original.LF_DOT_Logic.LF.Logic.In x x7)
             (fun H : x2 => imported_and (imported_Corelib_Init_Logic_eq (x6 H) x10) (imported_Original_LF__DOT__Logic_LF_Logic_In H x8))
             (fun (x11 : x1) (x12 : x2) (hx4 : rel_iso hx x11 x12) => and_iso (Corelib_Init_Logic_eq_iso (hx1 x11 x12 hx4) hx3) (Original_LF__DOT__Logic_LF_Logic_In_iso hx4 hx2)))))
    (Original.LF_DOT_Logic.LF.Logic.In_map_iff x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Logic_LF_Logic_In__map__iff x6 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.In_map_iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_In__map__iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.In_map_iff Original_LF__DOT__Logic_LF_Logic_In__map__iff_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.In_map_iff Imported.Original_LF__DOT__Logic_LF_Logic_In__map__iff Original_LF__DOT__Logic_LF_Logic_In__map__iff_iso := {}.