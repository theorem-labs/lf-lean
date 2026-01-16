From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original.
From IsomorphismChecker Require Imported.
(* Typeclasses Opaque rel_iso. *)

From IsomorphismChecker Require Export Isomorphisms.U_true__iso.

Monomorphic Definition imported_Corelib_Init_Logic_eq : forall x : Type, x -> x -> SProp := @Imported.Corelib_Init_Logic_eq.

(* Helper: convert from standard eq to SProp eq *)
Monomorphic Definition prop_eq_to_sprop_eq {A : Type} {x y : A} (H : x = y) : Imported.Corelib_Init_Logic_eq A x y :=
  match H with
  | Corelib.Init.Logic.eq_refl => Imported.Corelib_Init_Logic_eq_refl A x
  end.

(* Helper: convert from SProp eq to standard eq *)
Monomorphic Definition sprop_eq_to_prop_eq {A : Type} {x y : A} (H : Imported.Corelib_Init_Logic_eq A x y) : x = y :=
  Imported.Corelib_Init_Logic_eq_recl A x (fun z _ => x = z) (Corelib.Init.Logic.eq_refl x) y H.

(* Helper: proof irrelevance for Prop eq expressed in SProp eq *)
(* We use the fact that Stdlib.Logic.ProofIrrelevance.proof_irrelevance is allowed *)
Monomorphic Lemma prop_eq_proof_irrel {A : Type} {x y : A} (p q : x = y) : IsomorphismDefinitions.eq p q.
Proof.
  pose proof (Stdlib.Logic.ProofIrrelevance.proof_irrelevance _ p q) as H.
  destruct H. exact (IsomorphismDefinitions.eq_refl _).
Defined.

(* This is an isomorphism between Prop eq and SProp eq *)
(* The isomorphism is valid because both represent propositional equality *)
Monomorphic Instance Corelib_Init_Logic_eq_iso : (forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (H34 : @rel_iso x1 x2 hx x3 x4) (x5 : x1) (x6 : x2) (H56 : @rel_iso x1 x2 hx x5 x6),
   Iso (@Corelib.Init.Logic.eq x1 x3 x5) (@imported_Corelib_Init_Logic_eq x2 x4 x6)).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  (* Destruct H34 and H56 to get the underlying equalities *)
  destruct H34 as [H34]. destruct H56 as [H56].
  simpl in H34, H56.
  apply eq_of_seq in H34. apply eq_of_seq in H56.
  subst x4 x6.
  (* Now goal: Iso (x3 = x5) (Imported.Corelib_Init_Logic_eq (to hx x3) (to hx x5)) *)
  unshelve eapply Build_Iso.
  - (* to: x3 = x5 -> Imported.Corelib_Init_Logic_eq (to hx x3) (to hx x5) *)
    intro Heq. subst x5. apply Imported.Corelib_Init_Logic_eq_refl.
  - (* from: Imported.Corelib_Init_Logic_eq (to hx x3) (to hx x5) -> x3 = x5 *)
    intro Heq.
    pose proof (sprop_eq_to_prop_eq Heq) as H.
    pose proof (Corelib.Init.Logic.f_equal (from hx) H) as H'.
    pose proof (from_to hx x3) as Hft3.
    pose proof (from_to hx x5) as Hft5.
    apply eq_of_seq in Hft3. apply eq_of_seq in Hft5.
    rewrite Hft3 in H'. rewrite Hft5 in H'.
    exact H'.
  - (* to_from *)
    intro Heq. exact (IsomorphismDefinitions.eq_refl _).
  - (* from_to *)
    intro Heq.
    (* Use proof irrelevance for Prop equalities *)
    apply prop_eq_proof_irrel.
Defined.

Instance: KnownConstant (@Corelib.Init.Logic.eq) := {}.
Instance: KnownConstant (@Imported.Corelib_Init_Logic_eq) := {}.
Instance: IsoStatementProofFor (@Corelib.Init.Logic.eq) Corelib_Init_Logic_eq_iso := {}.
Instance: IsoStatementProofBetween (@Corelib.Init.Logic.eq) (@Imported.Corelib_Init_Logic_eq) Corelib_Init_Logic_eq_iso := {}.

(* Make the Prop version available to clients who import this file *)
From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso__U_prop.
