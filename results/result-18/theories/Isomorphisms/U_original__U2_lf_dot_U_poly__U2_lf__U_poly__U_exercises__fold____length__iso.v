From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso Isomorphisms.__0__iso Isomorphisms.U_s__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_nat := (@Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length).

(* Reduction lemmas *)
Lemma imported_fold_length_nil : forall (X : Type),
  Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length X (Imported.Original_LF__DOT__Poly_LF_Poly_list_nil X) = Imported.nat_O.
Proof. reflexivity. Qed.

Lemma imported_fold_length_cons : forall (X : Type) (h : X) (t : Imported.Original_LF__DOT__Poly_LF_Poly_list X),
  Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length X (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons X h t) = 
  Imported.nat_S (Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length X t).
Proof. reflexivity. Qed.

Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 ->
  rel_iso nat_iso (Original.LF_DOT_Poly.LF.Poly.Exercises.fold_length x3) (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length x4).
Proof.
  intros x1 x2 hx.
  fix IH 1.
  intros l1 l2 Hl.
  destruct l1 as [| h1 t1].
  - (* nil case *)
    destruct Hl as [Hl]. simpl in Hl.
    simpl.
    unfold imported_Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length.
    assert (Hl2 : l2 = Imported.Original_LF__DOT__Poly_LF_Poly_list_nil x2).
    { apply eq_of_seq. apply IsoEq.eq_sym. exact Hl. }
    rewrite Hl2. rewrite imported_fold_length_nil.
    apply _0_iso.
  - (* cons case *)
    destruct Hl as [Hl]. simpl in Hl.
    simpl.
    unfold imported_Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length in *.
    assert (Hl2 : l2 = (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x2 (to hx h1) (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) t1))).
    { apply eq_of_seq. apply IsoEq.eq_sym. exact Hl. }
    rewrite Hl2. rewrite imported_fold_length_cons.
    apply S_iso.
    apply IH. constructor. apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.Exercises.fold_length) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.Exercises.fold_length) Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.Exercises.fold_length) (@Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length) Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length_iso := {}.