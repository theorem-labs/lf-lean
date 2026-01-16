From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* (*  *) *) *) (* for speed *)


Definition imported_Original_LF__DOT__Poly_LF_Poly_prod : Type -> Type -> Type := Imported.Original_LF__DOT__Poly_LF_Poly_prod.
Instance Original_LF__DOT__Poly_LF_Poly_prod_iso : forall x1 x2 : Type, Iso x1 x2 -> forall x3 x4 : Type, Iso x3 x4 -> Iso (Original.LF_DOT_Poly.LF.Poly.prod x1 x3) (imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4).
Proof.
  intros x1 x2 Hx x3 x4 Hy.
  unshelve eapply Build_Iso.
  - (* to: Original.prod x1 x3 -> Imported.prod x2 x4 *)
    intro p.
    destruct p as [a b].
    exact (Imported.Original_LF__DOT__Poly_LF_Poly_prod_mk x2 x4 (to Hx a) (to Hy b)).
  - (* from: Imported.prod x2 x4 -> Original.prod x1 x3 *)
    intro p.
    destruct p as [a b].
    exact (Original.LF_DOT_Poly.LF.Poly.pair (from Hx a) (from Hy b)).
  - (* to_from *)
    intro p.
    destruct p as [a b].
    simpl.
    apply (IsoEq.f_equal2 (Imported.Original_LF__DOT__Poly_LF_Poly_prod_mk x2 x4) (to_from Hx a) (to_from Hy b)).
  - (* from_to *)
    intro p.
    destruct p as [a b].
    simpl.
    apply (IsoEq.f_equal2 (@Original.LF_DOT_Poly.LF.Poly.pair x1 x3) (from_to Hx a) (from_to Hy b)).
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.prod := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_prod := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.prod Original_LF__DOT__Poly_LF_Poly_prod_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.prod Imported.Original_LF__DOT__Poly_LF_Poly_prod Original_LF__DOT__Poly_LF_Poly_prod_iso := {}.