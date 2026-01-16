From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib.Logic Require Import ProofIrrelevance.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *)


Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq : forall x : Type, x -> x -> SProp := (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq).

(* Helper: transport imported eq along equality *)
Definition imported_eq_subst : forall (X : Type) (a b c : X),
  IsomorphismDefinitions.eq a b -> IsomorphismDefinitions.eq a c ->
  Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq X b c.
Proof.
  intros X a b c Hab Hac.
  destruct Hab. destruct Hac.
  exact (Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_eq_refl X a).
Defined.

(* Helper: transport original eq along equality *)
Definition original_eq_subst : forall (X : Type) (a b c : X),
  IsomorphismDefinitions.eq a b -> IsomorphismDefinitions.eq a c ->
  Original.LF_DOT_ProofObjects.LF.ProofObjects.eq b c.
Proof.
  intros X a b c Hab Hac.
  destruct Hab. destruct Hac.
  exact (Original.LF_DOT_ProofObjects.LF.ProofObjects.eq_refl a).
Defined.

(* Both eq types are SProp, so any two inhabitants are equal.
   We need to show they're isomorphic - since both are propositions in SProp,
   we just need to show they're logically equivalent. *)

(* Define the to function *)
Definition eq_iso_to (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) 
  (H34 : IsomorphismDefinitions.eq (to hx x3) x4) (x5 : x1) (x6 : x2)
  (H56 : IsomorphismDefinitions.eq (to hx x5) x6) :
  Original.LF_DOT_ProofObjects.LF.ProofObjects.eq x3 x5 ->
  Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x2 x4 x6.
Proof.
  intro Heq. destruct Heq as [x].
  exact (@imported_eq_subst x2 (to hx x) x4 x6 H34 H56).
Defined.

(* Define the from function *)
Definition eq_iso_from (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) 
  (H34 : IsomorphismDefinitions.eq (to hx x3) x4) (x5 : x1) (x6 : x2)
  (H56 : IsomorphismDefinitions.eq (to hx x5) x6) :
  Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x2 x4 x6 ->
  Original.LF_DOT_ProofObjects.LF.ProofObjects.eq x3 x5.
Proof.
  intro Heq. destruct Heq.
  apply (@original_eq_subst x1 (from hx x4) x3 x5).
  - eapply eq_trans. apply f_equal. apply eq_sym. exact H34. apply from_to.
  - eapply eq_trans. apply f_equal. apply eq_sym. exact H56. apply from_to.
Defined.

(* Helper to convert Prop equality to IsomorphismDefinitions.eq for the roundtrip *)
Lemma prop_eq_to_iso_eq : forall (A : Prop) (x y : A), IsomorphismDefinitions.eq x y.
Proof.
  intros A x y.
  pose proof (proof_irrelevance A x y) as H.
  destruct H.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (Original.LF_DOT_ProofObjects.LF.ProofObjects.eq x3 x5) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x4 x6).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  destruct H34 as [H34']. destruct H56 as [H56']. simpl in *.
  unfold imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq.
  exact (@Build_Iso 
    (Original.LF_DOT_ProofObjects.LF.ProofObjects.eq x3 x5)
    (Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x2 x4 x6)
    (@eq_iso_to x1 x2 hx x3 x4 H34' x5 x6 H56')
    (@eq_iso_from x1 x2 hx x3 x4 H34' x5 x6 H56')
    (fun _ => IsomorphismDefinitions.eq_refl) (* SProp is proof irrelevant *)
    (fun e => @prop_eq_to_iso_eq (Original.LF_DOT_ProofObjects.LF.ProofObjects.eq x3 x5) 
                (@eq_iso_from x1 x2 hx x3 x4 H34' x5 x6 H56' (@eq_iso_to x1 x2 hx x3 x4 H34' x5 x6 H56' e)) 
                e)). (* Prop needs proof_irrelevance *)
Defined.
Instance: KnownConstant (@Original.LF_DOT_ProofObjects.LF.ProofObjects.eq) := {}.
Instance: KnownConstant (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq) := {}.
Instance: IsoStatementProofFor (@Original.LF_DOT_ProofObjects.LF.ProofObjects.eq) Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_ProofObjects.LF.ProofObjects.eq) (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq) Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso := {}.