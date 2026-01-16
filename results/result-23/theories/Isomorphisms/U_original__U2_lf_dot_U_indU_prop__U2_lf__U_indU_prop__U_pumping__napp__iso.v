From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp : forall x : Type, imported_nat -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Poly_LF_Poly_list x := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp).

(* The imported napp uses brecOn, but we can prove this unfolds correctly *)
Lemma imported_napp_unfold : forall (X : Type) (n : Imported.nat) (l : Imported.Original_LF__DOT__Poly_LF_Poly_list X),
  Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp X (Imported.nat_S n) l =
  Imported.Original_LF__DOT__Poly_LF_Poly_app X l (Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp X n l).
Proof.
  intros X n l.
  unfold Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp.
  simpl.
  reflexivity.
Qed.

(* Helper lemma: to function on lists preserves napp *)
Lemma list_to_napp_compat : forall (x1 x2 : Type) (Hx : Iso x1 x2)
  (n : nat) (l : Original.LF_DOT_Poly.LF.Poly.list x1),
  IsomorphismDefinitions.eq
    (to (Original_LF__DOT__Poly_LF_Poly_list_iso Hx) (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp n l))
    (Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 (nat_to_imported n) (to (Original_LF__DOT__Poly_LF_Poly_list_iso Hx) l)).
Proof.
  intros x1 x2 Hx n l.
  induction n as [|n' IH].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    (* LHS: to (app l (napp n' l)) *)
    (* RHS: Imported.napp (S n') (to l) *)
    eapply eq_trans.
    + apply list_to_app_compat.
    + (* Now: Imported.app (to l) (to (napp n' l)) = Imported.napp (S n') (to l) *)
      (* By IH: to (napp n' l) = Imported.napp n' (to l) *)
      (* By imported_napp_unfold: Imported.napp (S n') (to l) = Imported.app (to l) (Imported.napp n' (to l)) *)
      rewrite imported_napp_unfold.
      apply f_equal2.
      * apply IsomorphismDefinitions.eq_refl.
      * exact IH.
Qed.

Instance Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : nat) (x4 : imported_nat),
  rel_iso nat_iso x3 x4 ->
  forall (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6 ->
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x4 x6).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  destruct H34 as [H34]. destruct H56 as [H56]. simpl in *.
  constructor. simpl.
  unfold imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp.
  eapply eq_trans.
  - apply list_to_napp_compat.
  - apply f_equal2; assumption.
Defined.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp) Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp) Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso := {}.
