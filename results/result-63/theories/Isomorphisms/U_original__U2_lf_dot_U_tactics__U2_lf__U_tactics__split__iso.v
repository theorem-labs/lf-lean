From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__prod__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_split : forall x x0 : Type,
  imported_Original_LF__DOT__Poly_LF_Poly_list (imported_Original_LF__DOT__Poly_LF_Poly_prod x x0) ->
  imported_Original_LF__DOT__Poly_LF_Poly_prod (imported_Original_LF__DOT__Poly_LF_Poly_list x) (imported_Original_LF__DOT__Poly_LF_Poly_list x0) := (@Imported.Original_LF__DOT__Tactics_LF_Tactics_split).
Instance Original_LF__DOT__Tactics_LF_Tactics_split_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list (Original.LF_DOT_Poly.LF.Poly.prod x1 x3))
    (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list (imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4)),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso hx hx0)) x5 x6 ->
  rel_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original_LF__DOT__Poly_LF_Poly_list_iso hx0)) (Original.LF_DOT_Tactics.LF.Tactics.split x5)
    (imported_Original_LF__DOT__Tactics_LF_Tactics_split x6).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Tactics.LF.Tactics.split) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Tactics_LF_Tactics_split) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Tactics.LF.Tactics.split) Original_LF__DOT__Tactics_LF_Tactics_split_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Tactics.LF.Tactics.split) (@Imported.Original_LF__DOT__Tactics_LF_Tactics_split) Original_LF__DOT__Tactics_LF_Tactics_split_iso := {}.