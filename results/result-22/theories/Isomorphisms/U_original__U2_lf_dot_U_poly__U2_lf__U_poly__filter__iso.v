From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_filter : forall x : Type, (x -> imported_Original_LF__DOT__Basics_LF_Basics_bool) -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Poly_LF_Poly_list x := (@Imported.Original_LF__DOT__Poly_LF_Poly_filter).
Instance Original_LF__DOT__Poly_LF_Poly_filter_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Original.LF_DOT_Basics.LF.Basics.bool) (x4 : x2 -> imported_Original_LF__DOT__Basics_LF_Basics_bool),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x3 x5) (x4 x6)) ->
  forall (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6 ->
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original.LF_DOT_Poly.LF.Poly.filter x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_filter x4 x6).
Proof.
  intros x1 x2 hx test1 test2 Htest.
  fix IH 1.
  intros x5 x6 Hx.
  simpl in *.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_filter.
  simpl in *.
  destruct x5 as [| h t].
  - (* nil case *)
    apply (@IsoEq.eq_srect_nodep _ (Imported.Original_LF__DOT__Poly_LF_Poly_list_nil x2) (fun y => IsomorphismDefinitions.eq (Imported.Original_LF__DOT__Poly_LF_Poly_list_nil x2) (Imported.Original_LF__DOT__Poly_LF_Poly_filter x2 test2 y)) IsomorphismDefinitions.eq_refl x6 Hx).
  - (* cons case *)
    simpl.
    assert (Htest_h : IsomorphismDefinitions.eq (to Original_LF__DOT__Basics_LF_Basics_bool_iso (test1 h)) (test2 (to hx h))).
    { apply Htest. simpl. apply IsomorphismDefinitions.eq_refl. }
    apply (@IsoEq.eq_srect_nodep _ (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x2 (to hx h) (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) t)) (fun y => IsomorphismDefinitions.eq 
        (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (if test1 h then Original.LF_DOT_Poly.LF.Poly.cons h (Original.LF_DOT_Poly.LF.Poly.filter test1 t) else Original.LF_DOT_Poly.LF.Poly.filter test1 t))
        (Imported.Original_LF__DOT__Poly_LF_Poly_filter x2 test2 y))).
    + apply (@IsoEq.eq_srect_r _ (to Original_LF__DOT__Basics_LF_Basics_bool_iso (test1 h))
        (fun b => IsomorphismDefinitions.eq
          (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (if test1 h then Original.LF_DOT_Poly.LF.Poly.cons h (Original.LF_DOT_Poly.LF.Poly.filter test1 t) else Original.LF_DOT_Poly.LF.Poly.filter test1 t))
          (Imported.Original_LF__DOT__Basics_LF_Basics_bool_casesOn (fun _ => _) b _ _))).
      * destruct (test1 h); simpl.
        -- apply (IsoEq.f_equal2 (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x2)).
           ++ apply IsomorphismDefinitions.eq_refl.
           ++ apply IH. apply IsomorphismDefinitions.eq_refl.
        -- apply IH. apply IsomorphismDefinitions.eq_refl.
      * exact (IsoEq.eq_sym Htest_h).
    + exact Hx.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.filter) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_filter) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.filter) Original_LF__DOT__Poly_LF_Poly_filter_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.filter) (@Imported.Original_LF__DOT__Poly_LF_Poly_filter) Original_LF__DOT__Poly_LF_Poly_filter_iso := {}.