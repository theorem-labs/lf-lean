From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__prod__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_pair : forall x x0 : Type, x -> x0 -> imported_Original_LF__DOT__Poly_LF_Poly_prod x x0 := (@Imported.Original_LF__DOT__Poly_LF_Poly_pair).
Instance Original_LF__DOT__Poly_LF_Poly_pair_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x1) (x6 : x2),
  rel_iso hx x5 x6 ->
  forall (x7 : x3) (x8 : x4),
  rel_iso hx0 x7 x8 -> rel_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso hx hx0) (Original.LF_DOT_Poly.LF.Poly.pair x5 x7) (imported_Original_LF__DOT__Poly_LF_Poly_pair x6 x8).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.pair) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_pair) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.pair) Original_LF__DOT__Poly_LF_Poly_pair_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.pair) (@Imported.Original_LF__DOT__Poly_LF_Poly_pair) Original_LF__DOT__Poly_LF_Poly_pair_iso := {}.