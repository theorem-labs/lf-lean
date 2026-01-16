From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__prod__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_combine : forall x x0 : Type,
  imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Poly_LF_Poly_list x0 -> imported_Original_LF__DOT__Poly_LF_Poly_list (imported_Original_LF__DOT__Poly_LF_Poly_prod x x0) := (@Imported.Original_LF__DOT__Poly_LF_Poly_combine).

Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_combine_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6 ->
  forall (x7 : Original.LF_DOT_Poly.LF.Poly.list x3) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x4),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx0) x7 x8 ->
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso hx hx0)) (Original.LF_DOT_Poly.LF.Poly.combine x5 x7)
    (imported_Original_LF__DOT__Poly_LF_Poly_combine x6 x8).
Proof.
  intros x1 x2 hx x3 x4 hx0 l1 l1' Hl1 l2 l2' Hl2.
  destruct Hl1 as [Hl1].
  destruct Hl2 as [Hl2].
  constructor.
  (* Use induction on l1 *)
  revert l1' l2 l2' Hl1 Hl2.
  induction l1 as [| h1 t1 IH]; intros l1' l2 l2' Hl1 Hl2.
  - (* nil case *)
    destruct Hl1 using IsomorphismDefinitions.eq_sind.
    simpl. apply IsomorphismDefinitions.eq_refl.
  - (* cons case *)
    destruct Hl1 using IsomorphismDefinitions.eq_sind. simpl.
    destruct l2 as [| h2 t2].
    + (* l2 = nil *)
      destruct Hl2 using IsomorphismDefinitions.eq_sind.
      simpl. apply IsomorphismDefinitions.eq_refl.
    + (* l2 = cons *)
      destruct Hl2 using IsomorphismDefinitions.eq_sind.
      simpl.
      apply (IsoEq.f_equal2 (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons _)).
      * simpl. apply IsomorphismDefinitions.eq_refl.
      * apply IH; constructor; apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.combine) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_combine) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.combine) Original_LF__DOT__Poly_LF_Poly_combine_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.combine) (@Imported.Original_LF__DOT__Poly_LF_Poly_combine) Original_LF__DOT__Poly_LF_Poly_combine_iso := {}.