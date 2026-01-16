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

Definition imported_Original_LF__DOT__Poly_LF_Poly_rev : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Poly_LF_Poly_list x := (@Imported.Original_LF__DOT__Poly_LF_Poly_rev).

(* Helper lemma: rev preserves the isomorphism *)
Lemma rev_iso_helper : forall (x1 x2 : Type) (hx : Iso x1 x2)
  (l : Original.LF_DOT_Poly.LF.Poly.list x1),
  IsomorphismDefinitions.eq 
    (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original.LF_DOT_Poly.LF.Poly.rev l))
    (Imported.Original_LF__DOT__Poly_LF_Poly_rev x2 
      (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) l)).
Proof.
  intros x1 x2 hx l.
  induction l as [|h t IH].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    (* LHS: to (app (rev t) [h]) *)
    (* RHS: Imported.rev (cons (to h) (to t)) *)
    apply (@IsoEq.eq_trans _ _ 
             (Imported.Original_LF__DOT__Poly_LF_Poly_app x2
                (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original.LF_DOT_Poly.LF.Poly.rev t))
                (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) 
                   (Original.LF_DOT_Poly.LF.Poly.cons h Original.LF_DOT_Poly.LF.Poly.nil))) _).
    { (* to (app (rev t) [h]) = app (to (rev t)) (to [h]) *)
      apply app_iso_helper. }
    { (* app (to (rev t)) (to [h]) = Imported.rev (cons (to h) (to t)) *)
      simpl.
      apply (@IsoEq.eq_trans _ _ 
               (Imported.Original_LF__DOT__Poly_LF_Poly_app x2
                  (Imported.Original_LF__DOT__Poly_LF_Poly_rev x2 (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) t))
                  (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x2 (to hx h)
                     (Imported.Original_LF__DOT__Poly_LF_Poly_list_nil x2))) _).
      { apply (IsoEq.f_equal (fun x => Imported.Original_LF__DOT__Poly_LF_Poly_app x2 x _)). exact IH. }
      { apply IsomorphismDefinitions.eq_refl. }
    }
Defined.

Instance Original_LF__DOT__Poly_LF_Poly_rev_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 ->
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original.LF_DOT_Poly.LF.Poly.rev x3) (imported_Original_LF__DOT__Poly_LF_Poly_rev x4).
Proof.
  intros x1 x2 hx x3 x4 Hx34.
  simpl in *.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_rev.
  apply (@IsoEq.eq_trans _ _
           (Imported.Original_LF__DOT__Poly_LF_Poly_rev x2 
              (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3)) _).
  - apply rev_iso_helper.
  - apply IsoEq.f_equal. exact Hx34.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.rev) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_rev) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.rev) Original_LF__DOT__Poly_LF_Poly_rev_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.rev) (@Imported.Original_LF__DOT__Poly_LF_Poly_rev) Original_LF__DOT__Poly_LF_Poly_rev_iso := {}.