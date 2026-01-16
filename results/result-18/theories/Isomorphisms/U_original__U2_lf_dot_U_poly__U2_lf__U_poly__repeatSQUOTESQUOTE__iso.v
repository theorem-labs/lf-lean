From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_repeat'' : forall x : Type, x -> imported_nat -> imported_Original_LF__DOT__Poly_LF_Poly_list x := Imported.Original_LF__DOT__Poly_LF_Poly_repeat''.

(* Helper lemmas for reduction *)
Lemma imported_repeat''_O : forall (X : Type) (x : X),
  Imported.Original_LF__DOT__Poly_LF_Poly_repeat'' X x Imported.nat_O = 
  Imported.Original_LF__DOT__Poly_LF_Poly_list_nil X.
Proof. reflexivity. Qed.

Lemma imported_repeat''_S : forall (X : Type) (x : X) (n : Imported.nat),
  Imported.Original_LF__DOT__Poly_LF_Poly_repeat'' X x (Imported.nat_S n) = 
  Imported.Original_LF__DOT__Poly_LF_Poly_list_cons X x (Imported.Original_LF__DOT__Poly_LF_Poly_repeat'' X x n).
Proof. reflexivity. Qed.

Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_repeat''_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 ->
  forall (x5 : nat) (x6 : imported_nat),
  rel_iso nat_iso x5 x6 -> rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original.LF_DOT_Poly.LF.Poly.repeat'' x1 x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_repeat'' x4 x6).
Proof.
  intros x1 x2 hx x3 x4 Hx.
  fix IH 1.
  intros n1 n2 Hn.
  destruct n1 as [| n1'].
  - (* n1 = O *)
    destruct Hn as [Hn]. simpl in Hn.
    simpl.
    unfold imported_Original_LF__DOT__Poly_LF_Poly_repeat''.
    assert (Hn2 : n2 = Imported.nat_O).
    { apply eq_of_seq. apply IsoEq.eq_sym. exact Hn. }
    rewrite Hn2. rewrite imported_repeat''_O.
    apply Original_LF__DOT__Poly_LF_Poly_nil_iso.
  - (* n1 = S n1' *)
    destruct Hn as [Hn]. simpl in Hn.
    simpl.
    unfold imported_Original_LF__DOT__Poly_LF_Poly_repeat'' in *.
    assert (Hn2 : n2 = Imported.nat_S (to nat_iso n1')).
    { apply eq_of_seq. apply IsoEq.eq_sym. exact Hn. }
    rewrite Hn2. rewrite imported_repeat''_S.
    apply Original_LF__DOT__Poly_LF_Poly_cons_iso.
    + exact Hx.
    + apply IH. constructor. apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.repeat'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_repeat'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.repeat'' Original_LF__DOT__Poly_LF_Poly_repeat''_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.repeat'' Imported.Original_LF__DOT__Poly_LF_Poly_repeat'' Original_LF__DOT__Poly_LF_Poly_repeat''_iso := {}.
