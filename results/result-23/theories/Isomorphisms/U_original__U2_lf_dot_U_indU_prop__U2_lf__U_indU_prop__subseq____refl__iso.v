From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__subseq__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_subseq__refl : forall x : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat, imported_Original_LF__DOT__IndProp_LF_IndProp_subseq x x := Imported.Original_LF__DOT__IndProp_LF_IndProp_subseq__refl.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_subseq__refl_iso : forall (x1 : Original.LF_DOT_Poly.LF.Poly.list nat) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat) (hx : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x1 x2),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_subseq_iso hx hx) (Original.LF_DOT_IndProp.LF.IndProp.subseq_refl x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_subseq__refl x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.subseq_refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_subseq__refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.subseq_refl Original_LF__DOT__IndProp_LF_IndProp_subseq__refl_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.subseq_refl Imported.Original_LF__DOT__IndProp_LF_IndProp_subseq__refl Original_LF__DOT__IndProp_LF_IndProp_subseq__refl_iso := {}.