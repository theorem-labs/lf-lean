From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso Isomorphisms.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__nonzeros__iso.

Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros__app : forall x x0 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros (imported_Original_LF__DOT__Poly_LF_Poly_app x x0))
    (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros x) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros x0)) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros__app.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros__app_iso : forall (x1 : Original.LF_DOT_Poly.LF.Poly.list nat) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat) (hx : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x1 x2)
    (x3 : Original.LF_DOT_Poly.LF.Poly.list nat) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat) (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x3 x4),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros_iso (Original_LF__DOT__Poly_LF_Poly_app_iso hx hx0))
       (Original_LF__DOT__Poly_LF_Poly_app_iso (Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros_iso hx) (Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros_iso hx0)))
    (Original.LF_DOT_AltAuto.LF.AltAuto.nonzeros_app x1 x3) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros__app x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.nonzeros_app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros__app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.nonzeros_app Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros__app_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.nonzeros_app Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros__app Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros__app_iso := {}.