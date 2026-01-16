From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso Isomorphisms.U_nat__add__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_app__length' : forall (x : Type) (x0 x1 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_length (imported_Original_LF__DOT__Poly_LF_Poly_app x0 x1))
    (imported_Nat_add (imported_Original_LF__DOT__Poly_LF_Poly_length x0) (imported_Original_LF__DOT__Poly_LF_Poly_length x1)) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_app__length'.
Axiom Original_LF__DOT__AltAuto_LF_AltAuto_app__length'_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_length_iso (Original_LF__DOT__Poly_LF_Poly_app_iso hx0 hx1))
       (Nat_add_iso (Original_LF__DOT__Poly_LF_Poly_length_iso hx0) (Original_LF__DOT__Poly_LF_Poly_length_iso hx1)))
    (Original.LF_DOT_AltAuto.LF.AltAuto.app_length' x1 x3 x5) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_app__length' x4 x6).
Existing Instance Original_LF__DOT__AltAuto_LF_AltAuto_app__length'_iso.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.app_length' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_app__length' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.app_length' Original_LF__DOT__AltAuto_LF_AltAuto_app__length'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.app_length' Imported.Original_LF__DOT__AltAuto_LF_AltAuto_app__length' Original_LF__DOT__AltAuto_LF_AltAuto_app__length'_iso := {}.