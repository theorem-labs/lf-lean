From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
 (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__option__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_None : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_option x := (@Imported.Original_LF__DOT__Poly_LF_Poly_None).
Instance Original_LF__DOT__Poly_LF_Poly_None_iso : forall (x1 x2 : Type) (hx : Iso x1 x2), rel_iso (Original_LF__DOT__Poly_LF_Poly_option_iso hx) Original.LF_DOT_Poly.LF.Poly.None (imported_Original_LF__DOT__Poly_LF_Poly_None x2).
Proof.
  intros x1 x2 hx.
  unfold rel_iso.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_None.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.None) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_None) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.None) Original_LF__DOT__Poly_LF_Poly_None_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.None) (@Imported.Original_LF__DOT__Poly_LF_Poly_None) Original_LF__DOT__Poly_LF_Poly_None_iso := {}.