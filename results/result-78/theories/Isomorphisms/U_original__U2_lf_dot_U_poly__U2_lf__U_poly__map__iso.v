From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_map : forall x x0 : Type, (x -> x0) -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Poly_LF_Poly_list x0 := (@Imported.Original_LF__DOT__Poly_LF_Poly_map).

(* Key lemma: map commutes with to *)
Lemma map_commutes_with_to : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) 
                              (f1 : x1 -> x3) (f2 : x2 -> x4),
  (forall a : x1, IsomorphismDefinitions.eq (hx0 (f1 a)) (f2 (hx a))) ->
  forall l : Original.LF_DOT_Poly.LF.Poly.list x1,
    IsomorphismDefinitions.eq 
      ((to (Original_LF__DOT__Poly_LF_Poly_list_iso hx0)) (Original.LF_DOT_Poly.LF.Poly.map f1 l))
      (Imported.Original_LF__DOT__Poly_LF_Poly_map x2 x4 f2 ((to (Original_LF__DOT__Poly_LF_Poly_list_iso hx)) l)).
Proof.
  intros x1 x2 hx x3 x4 hx0 f1 f2 Hf l.
  induction l as [|h t IH]; [apply IsomorphismDefinitions.eq_refl | simpl].
  apply (IsoEq.f_equal2 (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x4) (Hf h) IH).
Qed.

Instance Original_LF__DOT__Poly_LF_Poly_map_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x1 -> x3) (x6 : x2 -> x4),
  (forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso hx0 (x5 x7) (x6 x8)) ->
  forall (x7 : Original.LF_DOT_Poly.LF.Poly.list x1) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8 ->
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx0) (Original.LF_DOT_Poly.LF.Poly.map x5 x7) (imported_Original_LF__DOT__Poly_LF_Poly_map x6 x8).
Proof.
  intros x1 x2 hx x3 x4 hx0 f1 f2 Hf l1 l2 Hl.
  (* unfold rel_iso *) in *.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_map.
  assert (Hf' : forall a : x1, IsomorphismDefinitions.eq (hx0 (f1 a)) (f2 (hx a))).
  { intro a. apply (Hf a (hx a) (IsomorphismDefinitions.eq_refl)). }
  pose proof (@map_commutes_with_to x1 x2 hx x3 x4 hx0 f1 f2 Hf' l1) as Hcomm.
  apply (IsoEq.eq_trans Hcomm).
  apply (IsoEq.f_equal (Imported.Original_LF__DOT__Poly_LF_Poly_map x2 x4 f2) Hl).
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.map) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_map) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.map) Original_LF__DOT__Poly_LF_Poly_map_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.map) (@Imported.Original_LF__DOT__Poly_LF_Poly_map) Original_LF__DOT__Poly_LF_Poly_map_iso := {}.