From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_pal : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> SProp := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_pal).
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_pal_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.pal x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_pal x4).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.pal) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_pal) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.pal) Original_LF__DOT__IndProp_LF_IndProp_pal_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.pal) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_pal) Original_LF__DOT__IndProp_LF_IndProp_pal_iso := {}.