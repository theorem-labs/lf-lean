From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_app : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Poly_LF_Poly_list x := Imported.Original_LF__DOT__Poly_LF_Poly_app.

(* Helper lemma: the to function on lists preserves app *)
Lemma list_to_app_compat : forall (x1 x2 : Type) (Hx : Iso x1 x2)
  (l1 l2 : Original.LF_DOT_Poly.LF.Poly.list x1),
  IsomorphismDefinitions.eq
    (to (Original_LF__DOT__Poly_LF_Poly_list_iso Hx) (Original.LF_DOT_Poly.LF.Poly.app l1 l2))
    (Imported.Original_LF__DOT__Poly_LF_Poly_app x2 (to (Original_LF__DOT__Poly_LF_Poly_list_iso Hx) l1) (to (Original_LF__DOT__Poly_LF_Poly_list_iso Hx) l2)).
Proof.
  intros x1 x2 Hx l1 l2.
  induction l1 as [|h t IH].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply (IsoEq.f_equal2 (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x2)).
    + apply IsomorphismDefinitions.eq_refl.
    + exact IH.
Qed.

Instance Original_LF__DOT__Poly_LF_Poly_app_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 ->
  forall (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6 ->
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original.LF_DOT_Poly.LF.Poly.app x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_app x4 x6).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  constructor. simpl.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_app.
  eapply eq_trans.
  - apply list_to_app_compat.
  - apply f_equal2; assumption.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.app) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.app) Original_LF__DOT__Poly_LF_Poly_app_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.app) Imported.Original_LF__DOT__Poly_LF_Poly_app Original_LF__DOT__Poly_LF_Poly_app_iso := {}.