From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In : forall x : Type, x -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 ->
  forall (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In Imported.Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In_iso := {}.