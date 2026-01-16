From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* (* Typeclasses Opaque rel_iso. *) *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__option__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Some : forall x : Type, x -> imported_Original_LF__DOT__Poly_LF_Poly_option x := (@Imported.Original_LF__DOT__Poly_LF_Poly_Some).
Instance Original_LF__DOT__Poly_LF_Poly_Some_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> rel_iso (Original_LF__DOT__Poly_LF_Poly_option_iso hx) (Original.LF_DOT_Poly.LF.Poly.Some x3) (imported_Original_LF__DOT__Poly_LF_Poly_Some x4).
Proof.
  intros x1 x2 hx x3 x4 H.
  destruct H34 as [H34]. destruct H56 as [H56].
  constructor.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_Some.
  simpl in *.
  apply (IsoEq.f_equal (Imported.Original_LF__DOT__Poly_LF_Poly_option_Some x2) H).
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.Some) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_Some) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.Some) Original_LF__DOT__Poly_LF_Poly_Some_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.Some) (@Imported.Original_LF__DOT__Poly_LF_Poly_Some) Original_LF__DOT__Poly_LF_Poly_Some_iso := {}.