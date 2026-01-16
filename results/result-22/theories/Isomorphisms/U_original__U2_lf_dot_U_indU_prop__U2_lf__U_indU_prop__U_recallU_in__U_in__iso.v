From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In : forall x : Type, x -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In.

(* We need to build an Iso between Prop and SProp. 
   The key observation is that:
   1. Original.In uses standard list, =, \/, False
   2. Imported.In uses imported list, Eq, Or, Original_False
   
   Both have the same logical structure, just in different universes.
   Since both are proof-irrelevant propositions, we can use the
   SInhabited/sinhabitant approach to bridge the gap.
*)

(* First, define mutual conversion functions by recursion on the list structure *)
Fixpoint In_to_Imported {A B : Type} (hx : Iso A B) (x : A) (l : Original.LF_DOT_Poly.LF.Poly.list A) 
  : Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In A x l -> 
    Imported.Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In B (to hx x) (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) l) :=
  match l as l0 return Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In A x l0 -> 
    Imported.Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In B (to hx x) (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) l0) with
  | Original.LF_DOT_Poly.LF.Poly.nil => fun H => match H with end
  | Original.LF_DOT_Poly.LF.Poly.cons h t => fun H =>
      match H with
      | or_introl Heq => 
          (* h = x, need Eq (to hx h) (to hx x) *)
          match Heq in (_ = y) return Lean.Or (Imported.Eq B (to hx h) (to hx y)) _ with
          | Logic.eq_refl => Lean.Or_inl _ _ (Imported.Eq_refl B (to hx h))
          end
      | or_intror Hin =>
          Lean.Or_inr _ _ (In_to_Imported hx x t Hin)
      end
  end.

(* For the reverse direction, we need a different approach since we can't 
   eliminate SProp into Prop directly. We use SInhabited to bridge the gap. *)

(* Helper: to is injective for isomorphisms *)
Definition to_injective {A B : Type} (hx : Iso A B) (h x : A) (Heq : to hx h = to hx x) : h = x :=
  Logic.eq_trans (Logic.eq_sym (from_to_tteq hx h)) 
    (Logic.eq_trans (Logic.f_equal (from hx) Heq) (from_to_tteq hx x)).

(* First, we show the implication in SProp (producing SInhabited of the Prop) *)
Fixpoint In_from_Imported_SInhabited {A B : Type} (hx : Iso A B) (x : A) (l : Original.LF_DOT_Poly.LF.Poly.list A)
  : Imported.Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In B (to hx x) (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) l) ->
    SInhabited (Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In A x l) :=
  match l as l0 return 
    Imported.Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In B (to hx x) (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) l0) ->
    SInhabited (Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In A x l0) with
  | Original.LF_DOT_Poly.LF.Poly.nil => fun H => match H with end
  | Original.LF_DOT_Poly.LF.Poly.cons h t => fun H =>
      match H with
      | Lean.Or_inl _ _ Heq => 
          (* Heq : Eq B (to hx h) (to hx x), need h = x *)
          match Heq in (Imported.Eq _ _ y) return (y = to hx x -> SInhabited (h = x \/ _)) with
          | Imported.Eq_refl _ _ => fun (pf : to hx h = to hx x) => 
              sinhabits (or_introl (to_injective hx h x pf))
          end Logic.eq_refl
      | Lean.Or_inr _ _ Hin =>
          sinhabits (or_intror (sinhabitant (In_from_Imported_SInhabited hx x t Hin)))
      end
  end.

Definition In_from_Imported {A B : Type} (hx : Iso A B) (x : A) (l : Original.LF_DOT_Poly.LF.Poly.list A)
  : Imported.Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In B (to hx x) (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) l) ->
    Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In A x l :=
  fun H => sinhabitant (In_from_Imported_SInhabited hx x l H).

Instance Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 ->
  forall (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In x4 x6).
Proof.
  intros x1 x2 hx x3 x4 Hx34 x5 x6 Hx56.
  (* Use rel_iso (which is eq in SProp) to get standard equality *)
  unfold rel_iso in Hx34, Hx56.
  assert (Heq4 : x4 = to hx x3) by (apply Logic.eq_sym; apply eq_of_seq; exact Hx34).
  assert (Heq6 : x6 = to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5) by (apply Logic.eq_sym; apply eq_of_seq; exact Hx56).
  rewrite Heq4, Heq6. clear Heq4 Heq6 Hx34 Hx56 x4 x6.
  
  unshelve eapply Build_Iso.
  - (* to *) exact (In_to_Imported hx x3 x5).
  - (* from *) exact (In_from_Imported hx x3 x5).
  - (* to_from: for SProp results, always eq_refl *) 
    intro. apply IsomorphismDefinitions.eq_refl.
  - (* from_to: for Prop results, use proof irrelevance *) 
    intro x.
    apply IsoEq.seq_of_peq_t.
    apply ProofIrrelevance.proof_irrelevance.
Defined.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.RecallIn.In Imported.Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In Original_LF__DOT__IndProp_LF_IndProp_RecallIn_In_iso := {}.