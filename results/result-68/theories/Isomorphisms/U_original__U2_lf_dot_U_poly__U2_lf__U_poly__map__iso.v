From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_map : forall x x0 : Type, (x -> x0) -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Poly_LF_Poly_list x0 := (@Imported.Original_LF__DOT__Poly_LF_Poly_map).

(* Helper lemma for map isomorphism - prove by induction on Original list *)
Lemma map_iso_helper : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) 
  (f1 : x1 -> x3) (f2 : x2 -> x4),
  (forall (a : x1) (b : x2), rel_iso hx a b -> rel_iso hx0 (f1 a) (f2 b)) ->
  forall l : Original.LF_DOT_Poly.LF.Poly.list x1,
  IsomorphismDefinitions.eq
    (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx0) (Original.LF_DOT_Poly.LF.Poly.map f1 l))
    (Imported.Original_LF__DOT__Poly_LF_Poly_map x2 x4 f2 (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) l)).
Proof.
  intros x1 x2 hx x3 x4 hx0 f1 f2 Hf.
  fix IH 1.
  intros l.
  destruct l as [|h t].
  { (* nil case *)
    simpl.
    apply IsomorphismDefinitions.eq_refl. }
  { (* cons case *)
    simpl.
    (* LHS: Imported.cons (to hx0 (f1 h)) (to list_iso (map f1 t)) *)
    (* RHS: Imported.map f2 (Imported.cons (to hx h) (to list_iso t)) 
            = Imported.cons (f2 (to hx h)) (Imported.map f2 (to list_iso t)) *)
    eapply IsoEq.eq_trans.
    { (* Step 1: show LHS = cons (f2 (to hx h)) (to list_iso (map f1 t)) using Hf *)
      apply IsoEq.f_equal2.
      { apply Hf. constructor. simpl. apply IsomorphismDefinitions.eq_refl. }
      { apply IsomorphismDefinitions.eq_refl. } }
    { (* Step 2: show cons (f2 (to hx h)) (to list_iso (map f1 t)) = cons (f2 (to hx h)) (Imported.map f2 (to list_iso t)) *)
      eapply IsoEq.eq_trans.
      { apply IsoEq.f_equal2.
        { apply IsomorphismDefinitions.eq_refl. }
        { apply IH. } }
      { (* Now we need to show map f2 (cons ...) = cons ... (map f2 ...) *)
        apply IsoEq.eq_sym.
        apply IsomorphismDefinitions.eq_refl. } } }
Qed.

Instance Original_LF__DOT__Poly_LF_Poly_map_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x1 -> x3) (x6 : x2 -> x4),
  (forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso hx0 (x5 x7) (x6 x8)) ->
  forall (x7 : Original.LF_DOT_Poly.LF.Poly.list x1) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8 ->
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx0) (Original.LF_DOT_Poly.LF.Poly.map x5 x7) (imported_Original_LF__DOT__Poly_LF_Poly_map x6 x8).
Proof.
  intros x1 x2 hx x3 x4 hx0 f1 f2 Hf l1 l2 Hl.
  constructor.
  simpl in *.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_map.
  simpl in *.
  (* We need to show: to (map f1 l1) = Imported.map f2 l2 *)
  (* We know: to l1 = l2 (from Hl) *)
  (* First, use the helper lemma *)
  pose proof (@map_iso_helper x1 x2 hx x3 x4 hx0 f1 f2 (fun a b Hr => proj_rel_iso (Hf a b Hr)) l1) as Hmap.
  simpl in Hmap.
  eapply IsoEq.eq_trans.
  { exact Hmap. }
  { (* Now show Imported.map f2 (to l1) = Imported.map f2 l2 *)
    apply (IsoEq.f_equal (Imported.Original_LF__DOT__Poly_LF_Poly_map x2 x4 f2)).
    exact (proj_rel_iso Hl). }
Qed.

Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.map) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_map) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.map) Original_LF__DOT__Poly_LF_Poly_map_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.map) (@Imported.Original_LF__DOT__Poly_LF_Poly_map) Original_LF__DOT__Poly_LF_Poly_map_iso := {}.