From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
From Stdlib Require Import Logic.ProofIrrelevance.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.U_original__U_false__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_In : forall x : Type, x -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> SProp := (@Imported.Original_LF__DOT__Logic_LF_Logic_In).

(* The In isomorphism between Original.In (Prop) and Imported.In (SProp).
   Both have the same logical structure:
   - nil -> False/Original_False
   - cons h t -> (h = x) \/ In x t
   
   The challenge is that eliminating SProp (Lean.Or) to Prop is not allowed.
   We use the sinhabitant axiom which allows extracting Prop from SInhabited.
   
   Key insight: For the backward direction (SProp -> Prop), we use:
   1. sinhabitant to extract from SInhabited
   2. Lean.Or can be eliminated to build SInhabited since SInhabited is SProp-like
*)

(* Convert IsomorphismDefinitions.eq to Imported.Eq *)
Definition seq_to_Imported_Eq {A : Type} {x y : A} (H : IsomorphismDefinitions.eq x y) : Imported.Eq A x y.
Proof. destruct H. apply Imported.Eq_refl. Defined.

(* Forward direction: Original.In -> Imported.In (no issues, Prop -> SProp) *)
Definition In_to {A B : Type} (iso_AB : Iso A B) (x : A) (y : B) (Hxy : rel_iso iso_AB x y)
         (l1 : Original.LF_DOT_Poly.LF.Poly.list A) 
         (l2 : imported_Original_LF__DOT__Poly_LF_Poly_list B)
         (Hl : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso iso_AB) l1 l2)
  : Original.LF_DOT_Logic.LF.Logic.In x l1 -> imported_Original_LF__DOT__Logic_LF_Logic_In y l2.
Proof.
  revert l2 Hl.
  induction l1 as [|h1 t1 IH]; intros l2 Hl H.
  - simpl in H. destruct H.
  - simpl in H.
    pose proof (proj_rel_iso Hl) as Hl'. simpl in Hl'.
    destruct H as [Heq | Hin].
    + subst h1.
      assert (imported_Original_LF__DOT__Logic_LF_Logic_In y 
                (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons B (to iso_AB x) 
                   (to (Original_LF__DOT__Poly_LF_Poly_list_iso iso_AB) t1))) as Hsrc.
      { simpl. apply Lean.Or_inl.
        pose proof (proj_rel_iso Hxy) as Hxy'. apply seq_to_Imported_Eq. exact Hxy'. }
      exact (eq_srect_nodep (fun l => imported_Original_LF__DOT__Logic_LF_Logic_In y l) Hsrc Hl').
    + assert (imported_Original_LF__DOT__Logic_LF_Logic_In y 
                (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons B (to iso_AB h1) 
                   (to (Original_LF__DOT__Poly_LF_Poly_list_iso iso_AB) t1))) as Hsrc.
      { simpl. apply Lean.Or_inr.
        apply IH. apply Build_rel_iso. apply IsomorphismDefinitions.eq_refl. exact Hin. }
      exact (eq_srect_nodep (fun l => imported_Original_LF__DOT__Logic_LF_Logic_In y l) Hsrc Hl').
Defined.

(* Backward direction helper: Convert Lean.Or to SInhabited of or *)
Definition Lean_Or_to_SInhabited_or {P Q : Prop} (H : Lean.Or (SInhabited P) (SInhabited Q)) : SInhabited (P \/ Q).
Proof.
  destruct H as [Hp | Hq].
  - apply sinhabits. left. exact (sinhabitant Hp).
  - apply sinhabits. right. exact (sinhabitant Hq).
Defined.

(* We need to convert Imported.Corelib_Init_Logic_eq to SInhabited of Prop eq *)
Definition Imported_Eq_to_SInhabited_eq {A : Type} {x y : A} (H : Imported.Corelib_Init_Logic_eq A x y) : SInhabited (x = y).
Proof.
  destruct H. apply sinhabits. reflexivity.
Defined.

(* Helper to eliminate Imported.Original_False to SInhabited *)
Definition Imported_Original_False_elim_SInhabited {P : Prop} (H : Imported.Original_False) : SInhabited P :=
  match H with end.

(* Backward direction: Imported.In -> Original.In 
   We build SInhabited (Original.In x l1) first, then use sinhabitant *)
Fixpoint In_from_SInhabited {A B : Type} (iso_AB : Iso A B) (x : A) (y : B) (Hxy : rel_iso iso_AB x y)
         (l1 : Original.LF_DOT_Poly.LF.Poly.list A) 
         (l2 : imported_Original_LF__DOT__Poly_LF_Poly_list B)
         (Hl : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso iso_AB) l1 l2)
         {struct l1}
  : imported_Original_LF__DOT__Logic_LF_Logic_In y l2 -> SInhabited (Original.LF_DOT_Logic.LF.Logic.In x l1).
Proof.
  destruct l1 as [|h1 t1].
  - (* nil case *)
    simpl. intro H.
    pose proof (proj_rel_iso Hl) as Hl'. simpl in Hl'.
    pose proof (eq_srect_nodep (fun l => imported_Original_LF__DOT__Logic_LF_Logic_In y l) H (eq_sym Hl)) as H'.
    simpl in H'.
    exact (Imported_Original_False_elim_SInhabited H').
  - (* cons case *)
    simpl. intro H.
    pose proof (proj_rel_iso Hl) as Hl'. simpl in Hl'.
    pose proof (eq_srect_nodep (fun l => imported_Original_LF__DOT__Logic_LF_Logic_In y l) H (eq_sym Hl)) as H'.
    simpl in H'.
    (* H' : Lean.Or (Imported.Corelib_Init_Logic_eq (to iso_AB h1) y) (imported_In y (to list_iso t1)) *)
    destruct H' as [Heq | Hin].
    + (* Corelib_Init_Logic_eq (to iso_AB h1) y -> SInhabited (h1 = x \/ In x t1) *)
      apply sinhabits. left.
      pose proof (proj_rel_iso Hxy) as Hxy'.
      destruct Heq.
      (* Hxy : eq (to iso_AB x) (to iso_AB h1) *)
      assert (from iso_AB (to iso_AB x) = from iso_AB (to iso_AB h1)) as Hfrom.
      { apply eq_of_seq. apply f_equal. exact Hxy. }
      rewrite (eq_of_seq (from_to iso_AB x)) in Hfrom.
      rewrite (eq_of_seq (from_to iso_AB h1)) in Hfrom.
      symmetry. exact Hfrom.
    + (* imported_In y (to list_iso t1) -> SInhabited (h1 = x \/ In x t1) *)
      apply sinhabits. right.
      apply sinhabitant.
      apply (In_from_SInhabited A B iso_AB x y Hxy t1 _ (IsomorphismDefinitions.eq_refl)).
      exact Hin.
Defined.

Definition In_from {A B : Type} (iso_AB : Iso A B) (x : A) (y : B) (Hxy : rel_iso iso_AB x y)
         (l1 : Original.LF_DOT_Poly.LF.Poly.list A) 
         (l2 : imported_Original_LF__DOT__Poly_LF_Poly_list B)
         (Hl : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso iso_AB) l1 l2)
  : imported_Original_LF__DOT__Logic_LF_Logic_In y l2 -> Original.LF_DOT_Logic.LF.Logic.In x l1 :=
  fun H => sinhabitant (@In_from_SInhabited A B iso_AB x y Hxy l1 l2 Hl H).

Instance Original_LF__DOT__Logic_LF_Logic_In_iso : (forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (_ : @rel_iso x1 x2 hx x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
     (_ : @rel_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx) x5 x6),
   Iso (@Original.LF_DOT_Logic.LF.Logic.In x1 x3 x5) (@imported_Original_LF__DOT__Logic_LF_Logic_In x2 x4 x6)).
Proof.
  intros x1 x2 hx x3 x4 Hx34 x5 x6 Hx56.
  unshelve eapply Build_Iso.
  - exact (@In_to x1 x2 hx x3 x4 Hx34 x5 x6 Hx56).
  - exact (@In_from x1 x2 hx x3 x4 Hx34 x5 x6 Hx56).
  - (* to_from: for SProp, trivial *)
    intro y. apply IsomorphismDefinitions.eq_refl.
  - (* from_to: for Prop, use proof_irrelevance *)
    intro y. apply seq_of_eq. apply proof_irrelevance.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Logic.LF.Logic.In) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Logic_LF_Logic_In) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Logic.LF.Logic.In) Original_LF__DOT__Logic_LF_Logic_In_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Logic.LF.Logic.In) (@Imported.Original_LF__DOT__Logic_LF_Logic_In) Original_LF__DOT__Logic_LF_Logic_In_iso := {}.