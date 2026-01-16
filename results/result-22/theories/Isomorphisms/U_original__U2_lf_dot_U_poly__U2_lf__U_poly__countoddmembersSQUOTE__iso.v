From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__filter__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__odd__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_countoddmembers' : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat -> imported_nat := Imported.Original_LF__DOT__Poly_LF_Poly_countoddmembers'.
Instance Original_LF__DOT__Poly_LF_Poly_countoddmembers'_iso : forall (x1 : Original.LF_DOT_Poly.LF.Poly.list nat) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Poly.LF.Poly.countoddmembers' x1) (imported_Original_LF__DOT__Poly_LF_Poly_countoddmembers' x2).
Proof.
  intros x1 x2 Hx.
  unfold Original.LF_DOT_Poly.LF.Poly.countoddmembers'.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_countoddmembers'.
  unfold Imported.Original_LF__DOT__Poly_LF_Poly_countoddmembers'.
  apply (@Original_LF__DOT__Poly_LF_Poly_length_iso nat imported_nat nat_iso).
  apply (@Original_LF__DOT__Poly_LF_Poly_filter_iso nat imported_nat nat_iso _ _).
  - intros n1 n2 Hn.
    apply Original_LF__DOT__Basics_LF_Basics_odd_iso.
    exact Hn.
  - exact Hx.
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.countoddmembers' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_countoddmembers' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.countoddmembers' Original_LF__DOT__Poly_LF_Poly_countoddmembers'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.countoddmembers' Imported.Original_LF__DOT__Poly_LF_Poly_countoddmembers' Original_LF__DOT__Poly_LF_Poly_countoddmembers'_iso := {}.