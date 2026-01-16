From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_existsb : forall x : Type, (x -> imported_Original_LF__DOT__Basics_LF_Basics_bool) -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Basics_LF_Basics_bool := (@Imported.Original_LF__DOT__Tactics_LF_Tactics_existsb).
Instance Original_LF__DOT__Tactics_LF_Tactics_existsb_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Original.LF_DOT_Basics.LF.Basics.bool) (x4 : x2 -> imported_Original_LF__DOT__Basics_LF_Basics_bool),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x3 x5) (x4 x6)) ->
  forall (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Tactics.LF.Tactics.existsb x3 x5) (imported_Original_LF__DOT__Tactics_LF_Tactics_existsb x4 x6).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Tactics.LF.Tactics.existsb) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Tactics_LF_Tactics_existsb) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Tactics.LF.Tactics.existsb) Original_LF__DOT__Tactics_LF_Tactics_existsb_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Tactics.LF.Tactics.existsb) (@Imported.Original_LF__DOT__Tactics_LF_Tactics_existsb) Original_LF__DOT__Tactics_LF_Tactics_existsb_iso := {}.