From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_countoddmembers' : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat -> imported_nat := Imported.Original_LF__DOT__Poly_LF_Poly_countoddmembers'.
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_countoddmembers'_iso : forall (x1 : Original.LF_DOT_Poly.LF.Poly.list nat) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Poly.LF.Poly.countoddmembers' x1) (imported_Original_LF__DOT__Poly_LF_Poly_countoddmembers' x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.countoddmembers' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_countoddmembers' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.countoddmembers' Original_LF__DOT__Poly_LF_Poly_countoddmembers'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.countoddmembers' Imported.Original_LF__DOT__Poly_LF_Poly_countoddmembers' Original_LF__DOT__Poly_LF_Poly_countoddmembers'_iso := {}.