From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_list123''' : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat := Imported.Original_LF__DOT__Poly_LF_Poly_list123'''.
Instance Original_LF__DOT__Poly_LF_Poly_list123'''_iso : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) Original.LF_DOT_Poly.LF.Poly.list123''' imported_Original_LF__DOT__Poly_LF_Poly_list123'''.
Proof.
  constructor. simpl.
  simpl.
  (* Original.LF_DOT_Poly.LF.Poly.list123''' = [1;2;3] = cons 1 (cons 2 (cons 3 nil)) using Original.LF_DOT_Poly.LF.Poly.cons and Original.LF_DOT_Poly.LF.Poly.nil *)
  (* We need to show that to (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) Original.LF_DOT_Poly.LF.Poly.list123''' = Imported.Original_LF__DOT__Poly_LF_Poly_list123''' *)
  (* Both should evaluate to cons 1 (cons 2 (cons 3 nil)) in their respective types *)
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.list123''' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_list123''' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.list123''' Original_LF__DOT__Poly_LF_Poly_list123'''_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.list123''' Imported.Original_LF__DOT__Poly_LF_Poly_list123''' Original_LF__DOT__Poly_LF_Poly_list123'''_iso := {}.