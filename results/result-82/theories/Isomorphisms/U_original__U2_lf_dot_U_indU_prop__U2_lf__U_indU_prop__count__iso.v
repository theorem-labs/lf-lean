From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_count : imported_nat -> imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat -> imported_nat := Imported.Original_LF__DOT__IndProp_LF_IndProp_count.

(* Helper lemma: nat_to_imported preserves addition *)
Lemma nat_add_iso_helper : forall n m,
  IsomorphismDefinitions.eq 
    (nat_to_imported (Nat.add n m))
    (Imported.nat_add (nat_to_imported n) (nat_to_imported m)).
Proof.
  fix IH 1.
  intros [|n'] m.
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply (IsoEq.f_equal Imported.nat_S). apply IH.
Defined.

(* Helper for if-then-else conversion *)
Lemma if_eqb_match_compat : forall n h,
  IsomorphismDefinitions.eq
    (nat_to_imported (if Original.LF_DOT_Basics.LF.Basics.eqb n h then 1%nat else 0%nat))
    (Imported.Original_LF__DOT__Poly_LF_Poly_filter_match_1 (fun _ => Imported.nat)
       (Imported.Original_LF__DOT__Basics_LF_Basics_eqb (nat_to_imported n) (nat_to_imported h))
       (fun _ => Imported.nat_S Imported.nat_O)
       (fun _ => Imported.nat_O)).
Proof.
  intros n h.
  pose proof (eqb_iso_helper n h) as Heqb_iso.
  destruct (Original.LF_DOT_Basics.LF.Basics.eqb n h) eqn:Heqb.
  - (* true case *)
    simpl in Heqb_iso. simpl.
    destruct Heqb_iso. simpl.
    apply IsomorphismDefinitions.eq_refl.
  - (* false case *)
    simpl in Heqb_iso. simpl.
    destruct Heqb_iso. simpl.
    apply IsomorphismDefinitions.eq_refl.
Defined.

(* Helper: imported count on cons *)
Lemma imported_count_cons_eq : forall n h t,
  Imported.Original_LF__DOT__IndProp_LF_IndProp_count n 
    (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons Imported.nat h t) =
  Imported.nat_add 
    (Imported.Original_LF__DOT__Poly_LF_Poly_filter_match_1 (fun _ => Imported.nat)
       (Imported.Original_LF__DOT__Basics_LF_Basics_eqb n h)
       (fun _ => Imported.nat_S Imported.nat_O)
       (fun _ => Imported.nat_O))
    (Imported.Original_LF__DOT__IndProp_LF_IndProp_count n t).
Proof.
  intros. reflexivity.
Qed.

(* Main helper lemma *)
Lemma count_iso_helper : forall n l,
  IsomorphismDefinitions.eq 
    (nat_to_imported (Original.LF_DOT_IndProp.LF.IndProp.count n l))
    (Imported.Original_LF__DOT__IndProp_LF_IndProp_count (nat_to_imported n) (to (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) l)).
Proof.
  intros n.
  fix IH 1.
  intros [|h t].
  - (* nil case *)
    simpl.
    apply IsomorphismDefinitions.eq_refl.
  - (* cons case *)
    simpl.
    (* Rewrite the imported count on cons *)
    match goal with
    | |- IsomorphismDefinitions.eq _ ?rhs =>
        change rhs with (Imported.nat_add 
          (Imported.Original_LF__DOT__Poly_LF_Poly_filter_match_1 (fun _ => Imported.nat)
             (Imported.Original_LF__DOT__Basics_LF_Basics_eqb (nat_to_imported n) (nat_to_imported h))
             (fun _ => Imported.nat_S Imported.nat_O)
             (fun _ => Imported.nat_O))
          (Imported.Original_LF__DOT__IndProp_LF_IndProp_count (nat_to_imported n) (to (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) t)))
    end.
    eapply eq_trans.
    { apply nat_add_iso_helper. }
    eapply IsoEq.f_equal2.
    + (* The if-then-else part *)
      apply if_eqb_match_compat.
    + (* The recursive part *)
      exact (IH t).
Defined.

Instance Original_LF__DOT__IndProp_LF_IndProp_count_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Poly.LF.Poly.list nat) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x3 x4 -> rel_iso nat_iso (Original.LF_DOT_IndProp.LF.IndProp.count x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_count x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  simpl in *.
  simpl in *.
  destruct H12. destruct H34.
  apply count_iso_helper.
Defined.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.count := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_count := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.count Original_LF__DOT__IndProp_LF_IndProp_count_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.count Imported.Original_LF__DOT__IndProp_LF_IndProp_count Original_LF__DOT__IndProp_LF_IndProp_count_iso := {}.
