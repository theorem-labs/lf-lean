From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__option__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_nth__error : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_nat -> imported_Original_LF__DOT__Poly_LF_Poly_option x := (@Imported.Original_LF__DOT__Poly_LF_Poly_nth__error).

(* Helper lemma: nth_error commutes with the isomorphism *)
Lemma nth_error_iso_helper : forall (x1 x2 : Type) (hx : Iso x1 x2) 
  (l : Original.LF_DOT_Poly.LF.Poly.list x1) (n : nat),
  IsomorphismDefinitions.eq 
    (Original_LF__DOT__Poly_LF_Poly_option_iso hx (Original.LF_DOT_Poly.LF.Poly.nth_error l n))
    (Imported.Original_LF__DOT__Poly_LF_Poly_nth__error x2 (Original_LF__DOT__Poly_LF_Poly_list_iso hx l) (nat_iso n)).
Proof.
  intros x1 x2 hx l.
  induction l as [|h t IHt]; intro n.
  - (* nil case *)
    simpl.
    destruct n; simpl; apply IsomorphismDefinitions.eq_refl.
  - (* cons case *)
    simpl.
    destruct n as [|n'].
    + simpl.
      apply (IsoEq.f_equal (Imported.Original_LF__DOT__Poly_LF_Poly_option_Some x2)).
      apply IsomorphismDefinitions.eq_refl.
    + simpl.
      apply IHt.
Defined.

Instance Original_LF__DOT__Poly_LF_Poly_nth__error_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 ->
  forall (x5 : nat) (x6 : imported_nat),
  rel_iso nat_iso x5 x6 -> rel_iso (Original_LF__DOT__Poly_LF_Poly_option_iso hx) (Original.LF_DOT_Poly.LF.Poly.nth_error x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_nth__error x4 x6).
Proof.
  intros x1 x2 hx x3 x4 Hlist x5 x6 Hnat.
  (*simpl in *.
  (* Use eq_srect to substitute using the SProp equalities *)
  apply (@IsoEq.eq_srect _ (Original_LF__DOT__Poly_LF_Poly_list_iso hx x3) 
    (fun x4' => IsomorphismDefinitions.eq 
      (Original_LF__DOT__Poly_LF_Poly_option_iso hx (Original.LF_DOT_Poly.LF.Poly.nth_error x3 x5))
      (Imported.Original_LF__DOT__Poly_LF_Poly_nth__error x2 x4' x6))).
  apply (@IsoEq.eq_srect _ (nat_iso x5)
    (fun x6' => IsomorphismDefinitions.eq 
      (Original_LF__DOT__Poly_LF_Poly_option_iso hx (Original.LF_DOT_Poly.LF.Poly.nth_error x3 x5))
      (Imported.Original_LF__DOT__Poly_LF_Poly_nth__error x2 (Original_LF__DOT__Poly_LF_Poly_list_iso hx x3) x6'))).
  apply nth_error_iso_helper.
  - exact Hnat.
  - exact Hlist.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.nth_error) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_nth__error) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.nth_error) Original_LF__DOT__Poly_LF_Poly_nth__error_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.nth_error) (@Imported.Original_LF__DOT__Poly_LF_Poly_nth__error) Original_LF__DOT__Poly_LF_Poly_nth__error_iso := {}.