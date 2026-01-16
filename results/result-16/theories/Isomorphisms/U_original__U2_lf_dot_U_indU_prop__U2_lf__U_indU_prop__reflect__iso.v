From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_reflect : SProp -> imported_Original_LF__DOT__Basics_LF_Basics_bool -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect.

(* Helper: iso between False and Imported.False *)
Lemma iso_False_Imported_False : Iso False Imported.False.
Proof.
  apply Build_Iso with (to := fun f : False => match f return Imported.False with end) 
                       (from := fun f : Imported.False => match f return False with end);
  intro f; destruct f.
Defined.

(* Helper: extract P from reflect P true (for SProp) *)
Definition reflect_true_to_P (P : SProp) 
  (r : Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect P Imported.Original_LF__DOT__Basics_LF_Basics_bool_true) : P.
Proof.
  refine (match r in (Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect _ b) 
                return (match b with 
                        | Imported.Original_LF__DOT__Basics_LF_Basics_bool_true => P 
                        | Imported.Original_LF__DOT__Basics_LF_Basics_bool_false => Imported.False -> P 
                        end)
          with
          | Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect_ReflectT _ p => p
          | Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect_ReflectF _ np => fun f => match f with end
          end).
Defined.

(* Helper: extract Not P from reflect P false (for SProp) *)
Definition reflect_false_to_NotP (P : SProp) 
  (r : Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect P Imported.Original_LF__DOT__Basics_LF_Basics_bool_false) : Imported.Not P.
Proof.
  refine (match r in (Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect _ b) 
                return (match b with 
                        | Imported.Original_LF__DOT__Basics_LF_Basics_bool_true => Imported.False -> Imported.Not P
                        | Imported.Original_LF__DOT__Basics_LF_Basics_bool_false => Imported.Not P 
                        end)
          with
          | Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect_ReflectT _ p => fun f => match f with end
          | Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect_ReflectF _ np => np
          end).
Defined.

(* Forward direction: Original.reflect -> Imported.reflect *)
Definition reflect_to (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) 
  (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool)
  (H2 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4)
  (r : Original.LF_DOT_IndProp.LF.IndProp.reflect x1 x3) 
  : Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect x2 x4.
Proof.
  destruct H2.
  destruct r as [p | np]; cbv [Original_LF__DOT__Basics_LF_Basics_bool_iso to].
  - apply Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect_ReflectT.
    exact (H1.(to) p).
  - apply Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect_ReflectF.
    unfold Imported.Not.
    intro h.
    pose proof (np (H1.(from) h)) as contra.
    exact (iso_False_Imported_False.(to) contra).
Defined.

(* Backward direction: Imported.reflect -> Original.reflect *)
Definition reflect_from (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) 
  (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool)
  (H2 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4)
  (r : Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect x2 x4) 
  : Original.LF_DOT_IndProp.LF.IndProp.reflect x1 x3.
Proof.
  destruct H2.
  destruct x3; cbv [Original_LF__DOT__Basics_LF_Basics_bool_iso to] in r;
  [ apply Original.LF_DOT_IndProp.LF.IndProp.ReflectT;
    apply H1.(from);
    exact (@reflect_true_to_P x2 r)
  | apply Original.LF_DOT_IndProp.LF.IndProp.ReflectF;
    intro h;
    pose proof (@reflect_false_to_NotP x2 r) as np;
    pose proof (np (H1.(to) h)) as contra;
    exact (iso_False_Imported_False.(from) contra)
  ].
Defined.

Instance Original_LF__DOT__IndProp_LF_IndProp_reflect_iso 
  : forall (x1 : Prop) (x2 : SProp),
    Iso x1 x2 ->
    forall (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool),
    rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4 -> 
    Iso (Original.LF_DOT_IndProp.LF.IndProp.reflect x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_reflect x2 x4).
Proof.
  intros x1 x2 H1 x3 x4 H2.
  pose (t := @reflect_to x1 x2 H1 x3 x4 H2).
  pose (f := @reflect_from x1 x2 H1 x3 x4 H2).
  refine (@Build_Iso _ _ t f _ _).
  { intro r. exact IsomorphismDefinitions.eq_refl. }
  { intro r.
    apply seq_of_eq.
    apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance. }
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.reflect := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.reflect Original_LF__DOT__IndProp_LF_IndProp_reflect_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.reflect Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect Original_LF__DOT__IndProp_LF_IndProp_reflect_iso := {}.