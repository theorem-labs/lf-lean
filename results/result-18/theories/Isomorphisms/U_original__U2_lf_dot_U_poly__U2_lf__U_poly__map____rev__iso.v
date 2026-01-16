From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__map__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__rev__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_map__rev : forall (x x0 : Type) (x1 : x -> x0) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_map (fun x3 : x => x1 x3) (imported_Original_LF__DOT__Poly_LF_Poly_rev x2))
    (imported_Original_LF__DOT__Poly_LF_Poly_rev (imported_Original_LF__DOT__Poly_LF_Poly_map (fun x3 : x => x1 x3) x2)) := Imported.Original_LF__DOT__Poly_LF_Poly_map__rev.
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_map__rev_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x1 -> x3) (x6 : x2 -> x4) (hx1 : forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso hx0 (x5 x7) (x6 x8))
    (x7 : Original.LF_DOT_Poly.LF.Poly.list x1) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8),
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Poly_LF_Poly_map_iso x5 (fun x : x2 => x6 x) (fun (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) => hx1 x9 x10 hx3) (Original_LF__DOT__Poly_LF_Poly_rev_iso hx2))
       (Original_LF__DOT__Poly_LF_Poly_rev_iso (Original_LF__DOT__Poly_LF_Poly_map_iso x5 (fun x : x2 => x6 x) (fun (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) => hx1 x9 x10 hx3) hx2)))
    (Original.LF_DOT_Poly.LF.Poly.map_rev x1 x3 x5 x7) (imported_Original_LF__DOT__Poly_LF_Poly_map__rev x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.map_rev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_map__rev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.map_rev Original_LF__DOT__Poly_LF_Poly_map__rev_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.map_rev Imported.Original_LF__DOT__Poly_LF_Poly_map__rev Original_LF__DOT__Poly_LF_Poly_map__rev_iso := {}.