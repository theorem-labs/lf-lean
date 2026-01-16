From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_rev : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Poly_LF_Poly_list x := @Imported.Original_LF__DOT__Poly_LF_Poly_rev.

(* Helper lemma: the to function on lists preserves rev *)
Lemma list_to_rev_compat : forall (x1 x2 : Type) (Hx : Iso x1 x2)
  (l : Original.LF_DOT_Poly.LF.Poly.list x1),
  IsomorphismDefinitions.eq
    (to (Original_LF__DOT__Poly_LF_Poly_list_iso Hx) (Original.LF_DOT_Poly.LF.Poly.rev l))
    (Imported.Original_LF__DOT__Poly_LF_Poly_rev x2 (to (Original_LF__DOT__Poly_LF_Poly_list_iso Hx) l)).
Proof.
  intros x1 x2 Hx l.
  induction l as [|h t IH].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    (* to (app (rev t) [h]) = imported_rev (cons (to h) (to t)) *)
    (* = app (imported_rev (to t)) [to h] *)
    eapply eq_trans.
    + apply list_to_app_compat.
    + apply (f_equal2 (Imported.Original_LF__DOT__Poly_LF_Poly_app x2)).
      * exact IH.
      * simpl. apply IsomorphismDefinitions.eq_refl.
Qed.

Instance Original_LF__DOT__Poly_LF_Poly_rev_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 ->
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original.LF_DOT_Poly.LF.Poly.rev x3) (imported_Original_LF__DOT__Poly_LF_Poly_rev x4).
Proof.
  intros x1 x2 hx x3 x4 Hrel.
  apply Build_rel_iso.
  destruct Hrel as [Hrel].
  simpl.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_rev.
  eapply eq_trans.
  - apply list_to_rev_compat.
  - apply f_equal. exact Hrel.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.rev) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant imported_Original_LF__DOT__Poly_LF_Poly_rev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.rev) Original_LF__DOT__Poly_LF_Poly_rev_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.rev) imported_Original_LF__DOT__Poly_LF_Poly_rev Original_LF__DOT__Poly_LF_Poly_rev_iso := {}.