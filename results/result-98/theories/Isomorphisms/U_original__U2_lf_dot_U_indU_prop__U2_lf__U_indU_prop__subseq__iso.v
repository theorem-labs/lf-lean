From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_subseq : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat -> imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_subseq.
Instance Original_LF__DOT__IndProp_LF_IndProp_subseq_iso : forall (x1 : Original.LF_DOT_Poly.LF.Poly.list nat) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x1 x2 ->
  forall (x3 : Original.LF_DOT_Poly.LF.Poly.list nat) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x3 x4 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.subseq x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_subseq x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.subseq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_subseq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.subseq Original_LF__DOT__IndProp_LF_IndProp_subseq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.subseq Imported.Original_LF__DOT__IndProp_LF_IndProp_subseq Original_LF__DOT__IndProp_LF_IndProp_subseq_iso := {}.