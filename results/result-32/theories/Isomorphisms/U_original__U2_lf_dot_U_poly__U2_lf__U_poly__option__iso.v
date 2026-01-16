From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
 (* for speed *)


Definition imported_Original_LF__DOT__Poly_LF_Poly_option : Type -> Type := Imported.Original_LF__DOT__Poly_LF_Poly_option.
Instance Original_LF__DOT__Poly_LF_Poly_option_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_Poly.LF.Poly.option x1) (imported_Original_LF__DOT__Poly_LF_Poly_option x2).
Proof.
  intros x1 x2 Hx.
  unshelve eapply Build_Iso.
  - (* to: Original.option x1 -> Imported.option x2 *)
    intro o.
    destruct o as [a|].
    + exact (Imported.Original_LF__DOT__Poly_LF_Poly_option_Some x2 (to Hx a)).
    + exact (Imported.Original_LF__DOT__Poly_LF_Poly_option_None x2).
  - (* from: Imported.option x2 -> Original.option x1 *)
    intro o.
    destruct o as [|a].
    + exact Original.LF_DOT_Poly.LF.Poly.None.
    + exact (Original.LF_DOT_Poly.LF.Poly.Some (from Hx a)).
  - (* to_from *)
    intro o.
    destruct o as [|a].
    + simpl. apply IsomorphismDefinitions.eq_refl.
    + simpl. apply (IsoEq.f_equal (Imported.Original_LF__DOT__Poly_LF_Poly_option_Some x2) (to_from Hx a)).
  - (* from_to *)
    intro o.
    destruct o as [a|].
    + simpl. apply (IsoEq.f_equal Original.LF_DOT_Poly.LF.Poly.Some (from_to Hx a)).
    + simpl. apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.option Original_LF__DOT__Poly_LF_Poly_option_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.option Imported.Original_LF__DOT__Poly_LF_Poly_option Original_LF__DOT__Poly_LF_Poly_option_iso := {}.