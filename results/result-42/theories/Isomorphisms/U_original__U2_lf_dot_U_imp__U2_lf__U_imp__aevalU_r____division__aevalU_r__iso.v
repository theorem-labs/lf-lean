From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From Stdlib Require Import Logic.ProofIrrelevance.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aevalU_r____division__aexp__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR : imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp -> imported_nat -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR.

(* f_equal for Lean.eq *)
Definition lean_f_equal : forall (A B : Type) (f : A -> B) (x y : A), Lean.eq x y -> Lean.eq (f x) (f y) :=
  fun A B f x y H => match H with Lean.eq_refl => Lean.eq_refl end.

(* eq_sym for Lean.eq *)
Definition lean_eq_sym : forall (A : Type) (x y : A), Lean.eq x y -> Lean.eq y x :=
  fun A x y H => match H with Lean.eq_refl => Lean.eq_refl end.

(* eq_trans for Lean.eq *)
Definition lean_eq_trans : forall (A : Type) (x y z : A), Lean.eq x y -> Lean.eq y z -> Lean.eq x z :=
  fun A x y z H1 H2 => match H1 in Lean.eq _ y' return Lean.eq y' z -> Lean.eq x z with
  | Lean.eq_refl => fun H => H
  end H2.

(* Lean.eq versions of helper lemmas for Imported operations *)
Lemma imported_add_S : forall n m : Imported.nat,
  Lean.eq (Imported.add (Imported.nat_S n) m) (Imported.nat_S (Imported.add n m)).
Proof. intros. constructor. Qed.

Lemma imported_sub_O_l : forall m : Imported.nat,
  Lean.eq (Imported.sub Imported.nat_O m) Imported.nat_O.
Proof. intros []; constructor. Qed.

Lemma imported_sub_n_O : forall n : Imported.nat,
  Lean.eq (Imported.sub n Imported.nat_O) n.
Proof. intros []; constructor. Qed.

Lemma imported_sub_S : forall n m : Imported.nat,
  Lean.eq (Imported.sub (Imported.nat_S n) (Imported.nat_S m)) (Imported.sub n m).
Proof. intros. constructor. Qed.

Lemma imported_mul_S : forall n m : Imported.nat,
  Lean.eq (Imported.mul (Imported.nat_S n) m) (Imported.add m (Imported.mul n m)).
Proof. intros. constructor. Qed.

(* Correspondence between Coq and Imported arithmetic *)
Fixpoint add_comm_iso (n m : Datatypes.nat) : 
  Lean.eq (nat_to_imported (n + m)) (Imported.add (nat_to_imported n) (nat_to_imported m)) :=
  match n with
  | O => Lean.eq_refl
  | S n' => 
      let IH := add_comm_iso n' m in
      let H := imported_add_S (nat_to_imported n') (nat_to_imported m) in
      @lean_eq_trans Imported.nat _ _ _
        (@lean_f_equal Imported.nat Imported.nat Imported.nat_S _ _ IH)
        (@lean_eq_sym Imported.nat _ _ H)
  end.

Fixpoint sub_comm_iso (n m : Datatypes.nat) :
  Lean.eq (nat_to_imported (n - m)) (Imported.sub (nat_to_imported n) (nat_to_imported m)) :=
  match n with
  | O => @lean_eq_sym Imported.nat _ _ (imported_sub_O_l (nat_to_imported m))
  | S n' =>
      match m with
      | O => @lean_eq_sym Imported.nat _ _ (imported_sub_n_O (nat_to_imported (S n')))
      | S m' =>
          let IH := sub_comm_iso n' m' in
          @lean_eq_trans Imported.nat _ _ _ IH
            (@lean_eq_sym Imported.nat _ _ (imported_sub_S (nat_to_imported n') (nat_to_imported m')))
      end
  end.

Fixpoint mul_comm_iso (n m : Datatypes.nat) :
  Lean.eq (nat_to_imported (n * m)) (Imported.mul (nat_to_imported n) (nat_to_imported m)) :=
  match n with
  | O => Lean.eq_refl
  | S n' =>
      let IH := mul_comm_iso n' m in
      let add_eq := add_comm_iso m (n' * m) in
      let mul_s := imported_mul_S (nat_to_imported n') (nat_to_imported m) in
      @lean_eq_trans Imported.nat _ _ _
        (@lean_eq_trans Imported.nat _ _ _ add_eq
          (@lean_f_equal Imported.nat Imported.nat 
             (Imported.add (nat_to_imported m)) _ _ IH))
        (@lean_eq_sym Imported.nat _ _ mul_s)
  end.

(* gt correspondence: n > 0 -> Imported.gt n' nat_O *)
(* In Original: n > 0 means 0 < n 
   In Imported: gt n O means n > 0 with constructors:
     gt_gt_succ : gt (S n) O
     gt_gt_step : gt m n -> gt (S m) (S n)
   
   So we need to convert 0 < n to Imported.gt (nat_to_imported n) nat_O *)

(* n > 0 means S 0 <= n, i.e., 1 <= n *)
Fixpoint gt_zero_to_imported (n : Datatypes.nat) (H : n > 0) : 
  Imported.gt (nat_to_imported n) Imported.nat_O.
Proof.
  destruct n.
  - (* n = 0: impossible since 0 > 0 is false *)
    inversion H.
  - (* n = S n': need to show gt (nat_S (nat_to_imported n')) nat_O *)
    simpl. apply Imported.gt_gt_succ.
Defined.

(* Eq correspondence for nat *)
Definition eq_to_imported (n m : Datatypes.nat) (H : n = m) :
  Imported.Eq Imported.nat (nat_to_imported n) (nat_to_imported m) :=
  match H with Logic.eq_refl => Imported.Eq_refl _ _ end.

(* Helper: transport along Lean.eq for Type *)
Definition lean_transport {A : Type} {P : A -> Type} {x y : A} (eq : Lean.eq x y) : P x -> P y :=
  match eq with Lean.eq_refl => fun p => p end.

(* Helper: transport along Lean.eq for SProp *)
Definition lean_transport_sprop {A : Type} {P : A -> SProp} {x y : A} (eq : Lean.eq x y) : P x -> P y :=
  match eq with Lean.eq_refl => fun p => p end.

(* Convert Original.aevalR to Imported version *)
Fixpoint aevalR_to_imported (e : Original.LF_DOT_Imp.LF.Imp.aevalR_division.aexp) (n : Datatypes.nat)
  (H : Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR e n) {struct H} :
  Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR (aexp_to_imported e) (nat_to_imported n).
Proof.
  destruct H as [ n0 | a1 a2 n1 n2 ev1 ev2 | a1 a2 n1 n2 ev1 ev2 | a1 a2 n1 n2 ev1 ev2 | a1 a2 n1 n2 n3 ev1 ev2 gt_n2 eq_mul ].
  - (* E_ANum *)
    apply Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR_E_ANum.
  - (* E_APlus *)
    simpl.
    apply (@lean_transport_sprop _ (fun x => Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR _ x) _ _
             (@lean_eq_sym _ _ _ (add_comm_iso n1 n2))).
    exact (Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR_E_APlus _ _ _ _ 
             (aevalR_to_imported _ _ ev1) (aevalR_to_imported _ _ ev2)).
  - (* E_AMinus *)
    simpl.
    apply (@lean_transport_sprop _ (fun x => Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR _ x) _ _
             (@lean_eq_sym _ _ _ (sub_comm_iso n1 n2))).
    exact (Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR_E_AMinus _ _ _ _ 
             (aevalR_to_imported _ _ ev1) (aevalR_to_imported _ _ ev2)).
  - (* E_AMult *)
    simpl.
    apply (@lean_transport_sprop _ (fun x => Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR _ x) _ _
             (@lean_eq_sym _ _ _ (mul_comm_iso n1 n2))).
    exact (Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR_E_AMult _ _ _ _ 
             (aevalR_to_imported _ _ ev1) (aevalR_to_imported _ _ ev2)).
  - (* E_ADiv *)
    simpl.
    pose (IH1 := aevalR_to_imported _ _ ev1).
    pose (IH2 := aevalR_to_imported _ _ ev2).
    pose (gt_prf := @gt_zero_to_imported n2 gt_n2).
    pose (mul_eq := mul_comm_iso n2 n3).
    pose (eq_prf := @eq_to_imported (n2 * n3) n1 eq_mul).
    (* Need to transport eq_prf along mul_eq - Imported.Eq is in SProp *)
    pose (eq_prf' := @lean_transport_sprop _ (fun x => Imported.Eq _ x (nat_to_imported n1)) _ _ mul_eq eq_prf).
    exact (Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR_E_ADiv _ _ _ _ _ IH1 IH2 gt_prf eq_prf').
Defined.

(* The main isomorphism *)
(* We need: Iso (Prop) (SProp) where
   - to : Original.aevalR x1 x3 -> Imported.aevalR ...
   - from : Imported.aevalR ... -> Original.aevalR x1 x3
   
   For 'to', we use aevalR_to_imported.
   For 'from', we need sinhabitant. *)

(* The key lemma: Original.aevalR e n = inhabited (Imported.aevalR ...) as Props.
   
   This follows from the axiom eq_SInhabited_inhabited and SInhabited_Prop_injective:
   - eq_SInhabited_inhabited : SInhabited (inhabited X) = X for X : SProp
   - SInhabited_Prop_injective : SInhabited p = SInhabited q -> p = q for p, q : Prop
   
   Strategy:
   1. Show SInhabited (Original.aevalR e n) = SInhabited (inhabited (Imported.aevalR ...))
   2. Apply SInhabited_Prop_injective to get Original.aevalR e n = inhabited (Imported.aevalR ...)
   
   For step 1, we need SInhabited (Original.aevalR e n) = Imported.aevalR ...
   (using eq_SInhabited_inhabited: SInhabited (inhabited X) = X)
   
   This essentially requires showing the two SProp types are equal, which follows
   from the structural identity of the two inductives. *)

(* The key insight is that we have:
   - Original.aevalR e n : Prop
   - Imported.aevalR (to e) (to n) : SProp
   
   We use iso_inhabited_p : forall A : SProp, Iso A (inhabited A)
   
   This gives us: Iso (Imported.aevalR ...) (inhabited (Imported.aevalR ...))
   
   So the isomorphism we need is:
   Iso (Original.aevalR e n) (Imported.aevalR (to e) (to n))
   
   which is the same as (via iso_inhabited_p):
   Iso (Original.aevalR e n) (inhabited (Imported.aevalR (to e) (to n)))
   
   For Props, we have:
   - Forward: Original.aevalR e n -> inhabited (Imported.aevalR ...) 
     (using aevalR_to_imported + inhabits)
   - Backward: inhabited (Imported.aevalR ...) -> Original.aevalR e n
     (using inhabitant + ... but inhabitant gives us back the SProp value)
   
   The backward direction requires:
   - Imported.aevalR ... -> Original.aevalR e n
   
   Since we can't eliminate SProp to Prop directly, we use:
   - sinhabitant : forall A : Prop, SInhabited A -> A
   
   So we need: Imported.aevalR ... -> SInhabited (Original.aevalR e n)
   
   Since SInhabited is in SProp, this elimination is allowed!
*)

(* Helper lemma: 0 <= n *)
Lemma le_0_n : forall n : Datatypes.nat, (0 <= n)%nat.
Proof. intros n. induction n as [|n' IHn']; [apply le_n | apply le_S; exact IHn']. Qed.

(* Convert Imported.gt to SInhabited of Coq gt *)
(* This works because SInhabited is in SProp *)
Fixpoint gt_to_SInhabited (n m : Imported.nat) (H : Imported.gt n m) {struct H} :
  SInhabited (nat_from_imported n > nat_from_imported m).
Proof.
  destruct H as [n' | m' n' H'].
  - (* gt_gt_succ: gt (nat_S n') nat_O *)
    (* We need to prove: S (nat_from_imported n') > 0 *)
    (* i.e., 0 < S (nat_from_imported n') *)
    (* i.e., 1 <= S (nat_from_imported n') *)
    simpl. apply sinhabits. unfold Peano.gt, Peano.lt. 
    apply le_n_S. apply le_0_n.
  - (* gt_gt_step: gt m' n' -> gt (nat_S m') (nat_S n') *)
    simpl. 
    pose (IH := gt_to_SInhabited _ _ H').
    (* IH : SInhabited (nat_from_imported m' > nat_from_imported n') *)
    (* We need: SInhabited (S (nat_from_imported m') > S (nat_from_imported n')) *)
    (* Use sinhabitant to extract the proof, then wrap with sinhabits *)
    apply sinhabits. 
    pose (prf := @sinhabitant (nat_from_imported m' > nat_from_imported n') IH).
    unfold Peano.gt, Peano.lt in *. apply le_n_S. exact prf.
Defined.

(* Convert Imported.Eq to SInhabited of Coq eq *)
Definition Eq_to_SInhabited {A : Type} (x y : A) (H : Imported.Eq A x y) :
  SInhabited (x = y).
Proof.
  destruct H. apply sinhabits. reflexivity.
Defined.

(* Correspondence lemmas for arithmetic - we need SInhabited versions *)
Lemma add_from_iso' : forall (n m : Imported.nat),
  nat_from_imported (Imported.add n m) = (nat_from_imported n + nat_from_imported m)%nat.
Proof.
  fix IH 1. intros n m. destruct n.
  - simpl. reflexivity.
  - change (Imported.add (Imported.nat_S n) m) with (Imported.nat_S (Imported.add n m)).
    simpl. f_equal. apply IH.
Qed.

Lemma sub_from_iso' : forall (n m : Imported.nat),
  nat_from_imported (Imported.sub n m) = (nat_from_imported n - nat_from_imported m)%nat.
Proof.
  fix IH 1. intros n m. destruct n.
  - destruct m; simpl; reflexivity.
  - destruct m.
    + simpl. reflexivity.
    + change (Imported.sub (Imported.nat_S n) (Imported.nat_S m)) with (Imported.sub n m).
      simpl. apply IH.
Qed.

Lemma mul_from_iso' : forall (n m : Imported.nat),
  nat_from_imported (Imported.mul n m) = (nat_from_imported n * nat_from_imported m)%nat.
Proof.
  fix IH 1. intros n m. destruct n.
  - simpl. reflexivity.
  - change (Imported.mul (Imported.nat_S n) m) with (Imported.add m (Imported.mul n m)).
    transitivity ((nat_from_imported m + nat_from_imported (Imported.mul n m))%nat).
    + apply add_from_iso'.
    + simpl. f_equal. apply IH.
Qed.

(* Helper to transport along eq *)
Definition eq_rect_r {A : Type} {x : A} (P : A -> Type) (H : P x) {y : A} (e : y = x) : P y :=
  match e in (_ = z) return P z -> P y with Logic.eq_refl => fun h => h end H.

(* Now the key: convert Imported.aevalR to SInhabited (Original.aevalR) *)
Fixpoint aevalR_to_SInhabited 
  (e : Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp) (n : Imported.nat)
  (H : Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR e n) {struct H} :
  SInhabited (Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR (aexp_from_imported e) (nat_from_imported n)).
Proof.
  destruct H as [ n0 | a1 a2 n1 n2 ev1 ev2 | a1 a2 n1 n2 ev1 ev2 | a1 a2 n1 n2 ev1 ev2 | a1 a2 n1 n2 n3 ev1 ev2 gt_n2 eq_mul ].
  - (* E_ANum *)
    apply sinhabits. apply Original.LF_DOT_Imp.LF.Imp.aevalR_division.E_ANum.
  - (* E_APlus *)
    pose (IH1 := aevalR_to_SInhabited _ _ ev1).
    pose (IH2 := aevalR_to_SInhabited _ _ ev2).
    apply sinhabits.
    simpl.
    set (e' := Original.LF_DOT_Imp.LF.Imp.aevalR_division.APlus (aexp_from_imported a1) (aexp_from_imported a2)).
    apply (eq_rect_r (fun k => Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR e' k) 
             (Original.LF_DOT_Imp.LF.Imp.aevalR_division.E_APlus _ _ _ _ (@sinhabitant _ IH1) (@sinhabitant _ IH2))
             (add_from_iso' n1 n2)).
  - (* E_AMinus *)
    pose (IH1 := aevalR_to_SInhabited _ _ ev1).
    pose (IH2 := aevalR_to_SInhabited _ _ ev2).
    apply sinhabits.
    simpl.
    set (e' := Original.LF_DOT_Imp.LF.Imp.aevalR_division.AMinus (aexp_from_imported a1) (aexp_from_imported a2)).
    apply (eq_rect_r (fun k => Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR e' k) 
             (Original.LF_DOT_Imp.LF.Imp.aevalR_division.E_AMinus _ _ _ _ (@sinhabitant _ IH1) (@sinhabitant _ IH2))
             (sub_from_iso' n1 n2)).
  - (* E_AMult *)
    pose (IH1 := aevalR_to_SInhabited _ _ ev1).
    pose (IH2 := aevalR_to_SInhabited _ _ ev2).
    apply sinhabits.
    simpl.
    set (e' := Original.LF_DOT_Imp.LF.Imp.aevalR_division.AMult (aexp_from_imported a1) (aexp_from_imported a2)).
    apply (eq_rect_r (fun k => Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR e' k) 
             (Original.LF_DOT_Imp.LF.Imp.aevalR_division.E_AMult _ _ _ _ (@sinhabitant _ IH1) (@sinhabitant _ IH2))
             (mul_from_iso' n1 n2)).
  - (* E_ADiv *)
    pose (IH1 := aevalR_to_SInhabited a1 n1 ev1).
    pose (IH2 := aevalR_to_SInhabited a2 n2 ev2).
    (* gt_n2 : Imported.gt n2 Imported.nat_O *)
    pose (gt_prf := @gt_to_SInhabited n2 Imported.nat_O gt_n2).
    (* eq_mul : Imported.Eq Imported.nat (Imported.mul n2 n3) n1 *)
    pose (eq_prf := @Eq_to_SInhabited Imported.nat (Imported.mul n2 n3) n1 eq_mul).
    apply sinhabits.
    simpl.
    pose (gt_real := @sinhabitant _ gt_prf).
    pose (eq_real := @sinhabitant _ eq_prf).
    (* eq_real : Imported.mul n2 n3 = n1 in Imported.nat
       We need: nat_from_imported n2 * nat_from_imported n3 = nat_from_imported n1 *)
    (* Convert eq_real to the right form without using destruct *)
    pose (eq_real' := 
      match eq_real in (_ = y) return (Nat.mul (nat_from_imported n2) (nat_from_imported n3) = nat_from_imported y) with
      | Logic.eq_refl => Logic.eq_sym (mul_from_iso' n2 n3)
      end).
    exact (Original.LF_DOT_Imp.LF.Imp.aevalR_division.E_ADiv 
             (aexp_from_imported a1) (aexp_from_imported a2)
             (nat_from_imported n1) (nat_from_imported n2) (nat_from_imported n3)
             (@sinhabitant _ IH1) (@sinhabitant _ IH2) gt_real eq_real').
Defined.

(* Lemmas about round-tripping *)
Fixpoint nat_from_to_eq (n : Datatypes.nat) : nat_from_imported (nat_to_imported n) = n :=
  match n with
  | O => Logic.eq_refl
  | S n' => Logic.f_equal S (nat_from_to_eq n')
  end.

(* Helper for f_equal2 *)
Definition my_f_equal2 {A B C : Type} (f : A -> B -> C) {x1 y1 : A} {x2 y2 : B}
  (H1 : x1 = y1) (H2 : x2 = y2) : f x1 x2 = f y1 y2 :=
  match H1 in (_ = y) return f x1 x2 = f y y2 with
  | Logic.eq_refl => match H2 in (_ = z) return f x1 x2 = f x1 z with
                     | Logic.eq_refl => Logic.eq_refl
                     end
  end.

Fixpoint aexp_from_to_eq (e : Original.LF_DOT_Imp.LF.Imp.aevalR_division.aexp) :
  aexp_from_imported (aexp_to_imported e) = e :=
  match e with
  | Original.LF_DOT_Imp.LF.Imp.aevalR_division.ANum n => Logic.f_equal _ (nat_from_to_eq n)
  | Original.LF_DOT_Imp.LF.Imp.aevalR_division.APlus a1 a2 => 
      my_f_equal2 Original.LF_DOT_Imp.LF.Imp.aevalR_division.APlus (aexp_from_to_eq a1) (aexp_from_to_eq a2)
  | Original.LF_DOT_Imp.LF.Imp.aevalR_division.AMinus a1 a2 => 
      my_f_equal2 Original.LF_DOT_Imp.LF.Imp.aevalR_division.AMinus (aexp_from_to_eq a1) (aexp_from_to_eq a2)
  | Original.LF_DOT_Imp.LF.Imp.aevalR_division.AMult a1 a2 => 
      my_f_equal2 Original.LF_DOT_Imp.LF.Imp.aevalR_division.AMult (aexp_from_to_eq a1) (aexp_from_to_eq a2)
  | Original.LF_DOT_Imp.LF.Imp.aevalR_division.ADiv a1 a2 => 
      my_f_equal2 Original.LF_DOT_Imp.LF.Imp.aevalR_division.ADiv (aexp_from_to_eq a1) (aexp_from_to_eq a2)
  end.

(* Now the final conversion with the right types *)
Definition aevalR_from_imported (e : Original.LF_DOT_Imp.LF.Imp.aevalR_division.aexp) (n : Datatypes.nat)
  (H : Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR (aexp_to_imported e) (nat_to_imported n)) :
  Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR e n.
Proof.
  set (e' := aexp_to_imported e).
  set (n' := nat_to_imported n).
  change (aexp_to_imported e) with e' in H.
  change (nat_to_imported n) with n' in H.
  pose proof (@aevalR_to_SInhabited e' n' H) as H'.
  pose proof (@sinhabitant _ H') as prf.
  subst e' n'.
  rewrite <- (aexp_from_to_eq e).
  rewrite <- (nat_from_to_eq n).
  exact prf.
Defined.

Instance Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.aevalR_division.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_iso x1 x2 ->
  forall (x3 : Datatypes.nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  unfold rel_iso in H12, H34. simpl in H12, H34.
  destruct H12. destruct H34.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR.
  apply relax_Iso_Ps_Ts.
  exact (@Build_Iso@{Prop SProp; Set Set}
    (Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR x1 x3)
    (Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR (aexp_to_imported x1) (nat_to_imported x3))
    (fun p => @aevalR_to_imported x1 x3 p)
    (fun sp => @aevalR_from_imported x1 x3 sp)
    (fun sp => IsomorphismDefinitions.eq_refl)
    (fun p => IsoEq.seq_of_peq (proof_irrelevance _ _ p))).
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR_iso := {}.
