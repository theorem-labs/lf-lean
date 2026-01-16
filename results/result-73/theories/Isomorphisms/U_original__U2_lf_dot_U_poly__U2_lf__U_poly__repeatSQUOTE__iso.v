From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_repeat' : forall x : Type, x -> imported_nat -> imported_Original_LF__DOT__Poly_LF_Poly_list x := Imported.Original_LF__DOT__Poly_LF_Poly_repeat'.

(* Helper: prove by induction on the nat argument *)
Lemma repeat'_iso_helper : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 ->
  forall (n : nat),
  IsomorphismDefinitions.eq 
    (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original.LF_DOT_Poly.LF.Poly.repeat' x1 x3 n))
    (imported_Original_LF__DOT__Poly_LF_Poly_repeat' x4 (to nat_iso n)).
Proof.
  intros x1 x2 hx x3 x4 Hx34 n.
  induction n as [|n' IHn'].
  - (* n = 0: repeat' returns nil *)
    simpl. apply IsomorphismDefinitions.eq_refl.
  - (* n = S n': repeat' returns cons x (repeat' x n') *)
    simpl (Original.LF_DOT_Poly.LF.Poly.repeat' _ _ _).
    simpl (to nat_iso (S n')).
    simpl (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) _).
    unfold imported_Original_LF__DOT__Poly_LF_Poly_repeat'.
    destruct Hx34 as [Hx34eq]. simpl in Hx34eq.
    (* Use transitivity to relate via an intermediate form *)
    apply (eq_trans (y := Imported.Original_LF__DOT__Poly_LF_Poly_cons x2 x4 (Imported.Original_LF__DOT__Poly_LF_Poly_repeat' x2 x4 (to nat_iso n')))).
    { apply f_equal2.
      - exact Hx34eq.
      - exact IHn'. }
    { apply IsomorphismDefinitions.eq_refl. }
Defined.

Instance Original_LF__DOT__Poly_LF_Poly_repeat'_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 ->
  forall (x5 : nat) (x6 : imported_nat),
  rel_iso nat_iso x5 x6 -> rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original.LF_DOT_Poly.LF.Poly.repeat' x1 x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_repeat' x4 x6).
Proof.
  intros x1 x2 hx x3 x4 Hx34 x5 x6 Hx56.
  constructor. simpl.
  destruct Hx56 as [Hx56eq]. simpl in Hx56eq.
  apply (eq_trans (@repeat'_iso_helper x1 x2 hx x3 x4 Hx34 x5)).
  unfold imported_Original_LF__DOT__Poly_LF_Poly_repeat'.
  apply f_equal.
  exact Hx56eq.
Defined.

Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.repeat' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_repeat' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.repeat' Original_LF__DOT__Poly_LF_Poly_repeat'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.repeat' Imported.Original_LF__DOT__Poly_LF_Poly_repeat' Original_LF__DOT__Poly_LF_Poly_repeat'_iso := {}.
