From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso.

(* Note: subseq is an empty inductive type in Original - has no constructors *)
(* The Imported version is now in SProp, specialized to nat *)
Definition imported_Original_LF__DOT__IndProp_LF_IndProp_subseq : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat -> imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_subseq.

(* Since both types are empty (no constructors), we can build an isomorphism *)
Instance Original_LF__DOT__IndProp_LF_IndProp_subseq_iso : forall (x1 : Original.LF_DOT_Poly.LF.Poly.list nat) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x1 x2 ->
  forall (x3 : Original.LF_DOT_Poly.LF.Poly.list nat) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x3 x4 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.subseq x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_subseq x2 x4).
Proof.
  intros x1 x2 Hx1 x3 x4 Hx3.
  unshelve eapply Build_Iso.
  { (* to: subseq x1 x3 -> imported_subseq x2 x4 *)
    intro H. destruct H. }
  { (* from: imported_subseq x2 x4 -> subseq x1 x3 *)
    intro H. apply sinhabitant. destruct H. }
  { (* to_from *)
    intro H. destruct H. }
  { (* from_to *)
    intro H. destruct H. }
Defined.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.subseq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_subseq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.subseq Original_LF__DOT__IndProp_LF_IndProp_subseq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.subseq Imported.Original_LF__DOT__IndProp_LF_IndProp_subseq Original_LF__DOT__IndProp_LF_IndProp_subseq_iso := {}.