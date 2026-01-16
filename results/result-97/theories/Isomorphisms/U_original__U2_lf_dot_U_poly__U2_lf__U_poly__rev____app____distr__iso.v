From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__rev__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_rev__app__distr : forall (x : Type) (x0 x1 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_rev (imported_Original_LF__DOT__Poly_LF_Poly_app x0 x1))
    (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__Poly_LF_Poly_rev x1) (imported_Original_LF__DOT__Poly_LF_Poly_rev x0)) := Imported.Original_LF__DOT__Poly_LF_Poly_rev__app__distr.
Instance Original_LF__DOT__Poly_LF_Poly_rev__app__distr_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_rev_iso (Original_LF__DOT__Poly_LF_Poly_app_iso hx0 hx1))
       (Original_LF__DOT__Poly_LF_Poly_app_iso (Original_LF__DOT__Poly_LF_Poly_rev_iso hx1) (Original_LF__DOT__Poly_LF_Poly_rev_iso hx0)))
    (Original.LF_DOT_Poly.LF.Poly.rev_app_distr x1 x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_rev__app__distr x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.rev_app_distr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_rev__app__distr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.rev_app_distr Original_LF__DOT__Poly_LF_Poly_rev__app__distr_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.rev_app_distr Imported.Original_LF__DOT__Poly_LF_Poly_rev__app__distr Original_LF__DOT__Poly_LF_Poly_rev__app__distr_iso := {}.