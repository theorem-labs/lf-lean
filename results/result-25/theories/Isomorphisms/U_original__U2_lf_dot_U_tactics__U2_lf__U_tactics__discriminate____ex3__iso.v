From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_discriminate__ex3 : forall (x : Type) (x0 x1 x2 : x) (x3 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Original_LF__DOT__Poly_LF_Poly_list x ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_cons x0 (imported_Original_LF__DOT__Poly_LF_Poly_cons x1 x3)) (imported_Original_LF__DOT__Poly_LF_Poly_nil x) ->
  imported_Corelib_Init_Logic_eq x0 x2 := Imported.Original_LF__DOT__Tactics_LF_Tactics_discriminate__ex3.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_discriminate__ex3_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (hx0 : rel_iso hx x3 x4) (x5 : x1) (x6 : x2) (hx1 : rel_iso hx x5 x6) (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8)
    (x9 : Original.LF_DOT_Poly.LF.Poly.list x1) (x10 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx3 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x9 x10)
    (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x11 x12 ->
  forall (x13 : Original.LF_DOT_Poly.LF.Poly.cons x3 (Original.LF_DOT_Poly.LF.Poly.cons x5 x9) = Original.LF_DOT_Poly.LF.Poly.nil)
    (x14 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 (imported_Original_LF__DOT__Poly_LF_Poly_cons x6 x10)) (imported_Original_LF__DOT__Poly_LF_Poly_nil x2)),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx1 hx3)) (Original_LF__DOT__Poly_LF_Poly_nil_iso hx)) x13 x14 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx0 hx2) (Original.LF_DOT_Tactics.LF.Tactics.discriminate_ex3 x1 x3 x5 x7 x9 x11 x13) (imported_Original_LF__DOT__Tactics_LF_Tactics_discriminate__ex3 x8 x12 x14).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.discriminate_ex3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_discriminate__ex3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.discriminate_ex3 Original_LF__DOT__Tactics_LF_Tactics_discriminate__ex3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.discriminate_ex3 Imported.Original_LF__DOT__Tactics_LF_Tactics_discriminate__ex3 Original_LF__DOT__Tactics_LF_Tactics_discriminate__ex3_iso := {}.