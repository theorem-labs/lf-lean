From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__combine__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__pair__iso Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__split__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_combine__split : forall (x x0 : Type) (x1 : imported_Original_LF__DOT__Poly_LF_Poly_list (imported_Original_LF__DOT__Poly_LF_Poly_prod x x0)) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list x)
    (x3 : imported_Original_LF__DOT__Poly_LF_Poly_list x0),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Tactics_LF_Tactics_split x1) (imported_Original_LF__DOT__Poly_LF_Poly_pair x2 x3) ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_combine x2 x3) x1 := Imported.Original_LF__DOT__Tactics_LF_Tactics_combine__split.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_combine__split_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list (Original.LF_DOT_Poly.LF.Poly.prod x1 x3))
    (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list (imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4))
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso hx hx0)) x5 x6) (x7 : Original.LF_DOT_Poly.LF.Poly.list x1)
    (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8) (x9 : Original.LF_DOT_Poly.LF.Poly.list x3)
    (x10 : imported_Original_LF__DOT__Poly_LF_Poly_list x4) (hx3 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx0) x9 x10)
    (x11 : Original.LF_DOT_Tactics.LF.Tactics.split x5 = Original.LF_DOT_Poly.LF.Poly.pair x7 x9)
    (x12 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Tactics_LF_Tactics_split x6) (imported_Original_LF__DOT__Poly_LF_Poly_pair x8 x10)),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Tactics_LF_Tactics_split_iso hx1) (Original_LF__DOT__Poly_LF_Poly_pair_iso hx2 hx3)) x11 x12 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_combine_iso hx2 hx3) hx1) (Original.LF_DOT_Tactics.LF.Tactics.combine_split x1 x3 x5 x7 x9 x11)
    (imported_Original_LF__DOT__Tactics_LF_Tactics_combine__split x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.combine_split := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_combine__split := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.combine_split Original_LF__DOT__Tactics_LF_Tactics_combine__split_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.combine_split Imported.Original_LF__DOT__Tactics_LF_Tactics_combine__split Original_LF__DOT__Tactics_LF_Tactics_combine__split_iso := {}.