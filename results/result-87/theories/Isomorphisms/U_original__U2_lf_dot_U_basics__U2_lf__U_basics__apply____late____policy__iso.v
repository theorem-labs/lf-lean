From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__grade__iso Isomorphisms.nat__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__ltb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__lower____grade__iso Isomorphisms.__0__iso Isomorphisms.U_s__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_apply__late__policy : imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_grade -> imported_Original_LF__DOT__Basics_LF_Basics_grade := Imported.Original_LF__DOT__Basics_LF_Basics_apply__late__policy.

(* Helper lemma: if-then-else is isomorphic to bool__rec_match_1 *)
Definition bool_match_iso : forall (T1 : Type) (T2 : Type) (iso : Iso T1 T2)
  (b1 : Original.LF_DOT_Basics.LF.Basics.bool) (b2 : imported_Original_LF__DOT__Basics_LF_Basics_bool)
  (hb : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso b1 b2)
  (t1 : T1) (t2 : T2) (ht : rel_iso iso t1 t2)
  (f1 : T1) (f2 : T2) (hf : rel_iso iso f1 f2),
  rel_iso iso 
    (if b1 then t1 else f1)
    (Imported.Original_LF__DOT__Basics_LF_Basics_bool__rec_match_1 
       (fun _ => T2) b2 (fun _ => t2) (fun _ => f2)).
Proof.
  intros.
  unfold Imported.Original_LF__DOT__Basics_LF_Basics_bool__rec_match_1.
  unfold Imported.Original_LF__DOT__Basics_LF_Basics_bool_casesOn.
  destruct b1; destruct hb as [hb_eq]; simpl in hb_eq;
  pose proof (eq_of_seq hb_eq) as Heq; subst b2; simpl.
  - exact ht.
  - exact hf.
Defined.

Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_apply__late__policy_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Basics.LF.Basics.grade) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_grade),
  rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso x3 x4 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso (Original.LF_DOT_Basics.LF.Basics.apply_late_policy x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_apply__late__policy x2 x4).
Proof.
  intros x1 x2 hx x3 x4 hx0.
  unfold Original.LF_DOT_Basics.LF.Basics.apply_late_policy.
  unfold imported_Original_LF__DOT__Basics_LF_Basics_apply__late__policy.
  unfold Imported.Original_LF__DOT__Basics_LF_Basics_apply__late__policy.
  (* Use the bool_match_iso lemma three times for the nested if-then-else *)
  apply bool_match_iso.
  - apply Original_LF__DOT__Basics_LF_Basics_ltb_iso; [exact hx | apply (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))))].
  - exact hx0.
  - apply bool_match_iso.
    + apply Original_LF__DOT__Basics_LF_Basics_ltb_iso; [exact hx | apply (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))))))))))))].
    + apply Original_LF__DOT__Basics_LF_Basics_lower__grade_iso; exact hx0.
    + apply bool_match_iso.
      * apply Original_LF__DOT__Basics_LF_Basics_ltb_iso; [exact hx | apply (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))))))))))))))))].
      * apply Original_LF__DOT__Basics_LF_Basics_lower__grade_iso. apply Original_LF__DOT__Basics_LF_Basics_lower__grade_iso; exact hx0.
      * apply Original_LF__DOT__Basics_LF_Basics_lower__grade_iso. apply Original_LF__DOT__Basics_LF_Basics_lower__grade_iso. apply Original_LF__DOT__Basics_LF_Basics_lower__grade_iso; exact hx0.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.apply_late_policy := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_apply__late__policy := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.apply_late_policy Original_LF__DOT__Basics_LF_Basics_apply__late__policy_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.apply_late_policy Imported.Original_LF__DOT__Basics_LF_Basics_apply__late__policy Original_LF__DOT__Basics_LF_Basics_apply__late__policy_iso := {}.