From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_fold : forall x x0 : Type, (x -> x0 -> x0) -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> x0 -> x0 := (@Imported.Original_LF__DOT__Poly_LF_Poly_fold).

(* Helper: fold on imported list reduces correctly *)
Lemma imported_fold_nil : forall (X Y : Type) (f : X -> Y -> Y) (b : Y),
  @Imported.Original_LF__DOT__Poly_LF_Poly_fold X Y f (Imported.Original_LF__DOT__Poly_LF_Poly_list_nil X) b = b.
Proof. reflexivity. Qed.

Lemma imported_fold_cons : forall (X Y : Type) (f : X -> Y -> Y) (h : X) (t : Imported.Original_LF__DOT__Poly_LF_Poly_list X) (b : Y),
  @Imported.Original_LF__DOT__Poly_LF_Poly_fold X Y f (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons X h t) b = 
  f h (@Imported.Original_LF__DOT__Poly_LF_Poly_fold X Y f t b).
Proof. reflexivity. Qed.

(* Main isomorphism *)
Instance Original_LF__DOT__Poly_LF_Poly_fold_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : IsoOrSortRelaxed x3 x4) (x5 : x1 -> x3 -> x3) (x6 : x2 -> x4 -> x4),
  (forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> forall (x9 : x3) (x10 : x4), rel_iso_sort hx0 x9 x10 -> rel_iso_sort hx0 (x5 x7 x9) (x6 x8 x10)) ->
  forall (x7 : Original.LF_DOT_Poly.LF.Poly.list x1) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8 ->
  forall (x9 : x3) (x10 : x4), rel_iso_sort hx0 x9 x10 -> rel_iso_sort hx0 (Original.LF_DOT_Poly.LF.Poly.fold x5 x7 x9) (imported_Original_LF__DOT__Poly_LF_Poly_fold x6 x8 x10).
Proof.
  intros x1 x2 hx x3 x4 hx0 f1 f2 Hf.
  fix IH 1.
  intros l1 l2 Hl b1 b2 Hb.
  destruct l1 as [| h1 t1].
  - (* nil case *)
    destruct Hl as [Hl]. simpl in Hl.
    simpl.
    unfold imported_Original_LF__DOT__Poly_LF_Poly_fold.
    assert (Hl2 : l2 = Imported.Original_LF__DOT__Poly_LF_Poly_list_nil x2).
    { apply eq_of_seq. apply IsoEq.eq_sym. exact Hl. }
    rewrite Hl2.
    rewrite imported_fold_nil.
    exact Hb.
  - (* cons case *)
    destruct Hl as [Hl]. simpl in Hl.
    simpl.
    unfold imported_Original_LF__DOT__Poly_LF_Poly_fold in *.
    assert (Hl2 : l2 = (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x2 (to hx h1) (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) t1))).
    { apply eq_of_seq. apply IsoEq.eq_sym. exact Hl. }
    rewrite Hl2.
    rewrite imported_fold_cons.
    apply Hf.
    + constructor. apply IsomorphismDefinitions.eq_refl.
    + apply IH.
      * constructor. apply IsomorphismDefinitions.eq_refl.
      * exact Hb.
Defined.

Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.fold) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_fold) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.fold) Original_LF__DOT__Poly_LF_Poly_fold_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.fold) (@Imported.Original_LF__DOT__Poly_LF_Poly_fold) Original_LF__DOT__Poly_LF_Poly_fold_iso := {}.
