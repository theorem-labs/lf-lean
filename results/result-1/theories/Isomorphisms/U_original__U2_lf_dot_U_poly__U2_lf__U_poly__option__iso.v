From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. (* for speed *) *)


Definition imported_Original_LF__DOT__Poly_LF_Poly_option : Type -> Type := Imported.Original_LF__DOT__Poly_LF_Poly_option.
Instance Original_LF__DOT__Poly_LF_Poly_option_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_Poly.LF.Poly.option x1) (imported_Original_LF__DOT__Poly_LF_Poly_option x2).
Proof.
  intros x1 x2 Hx.
  unshelve eapply Build_Iso.
  - (* to: Original.option x1 -> Imported.option x2 *)
    intro o.
    destruct o as [v|].
    + exact (Imported.Original_LF__DOT__Poly_LF_Poly_option_Some x2 (to Hx v)).
    + exact (Imported.Original_LF__DOT__Poly_LF_Poly_option_None x2).
  - (* from: Imported.option x2 -> Original.option x1 *)
    intro o.
    destruct o as [v|].
    + exact (Original.LF_DOT_Poly.LF.Poly.Some (from Hx v)).
    + exact Original.LF_DOT_Poly.LF.Poly.None.
  - (* to_from *)
    intro o.
    destruct o as [v|].
    + simpl. apply (IsoEq.f_equal (Imported.Original_LF__DOT__Poly_LF_Poly_option_Some x2) (to_from Hx v)).
    + simpl. apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intro o.
    destruct o as [v|].
    + simpl. apply (IsoEq.f_equal Original.LF_DOT_Poly.LF.Poly.Some (from_to Hx v)).
    + simpl. apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.option Original_LF__DOT__Poly_LF_Poly_option_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.option Imported.Original_LF__DOT__Poly_LF_Poly_option Original_LF__DOT__Poly_LF_Poly_option_iso := {}.