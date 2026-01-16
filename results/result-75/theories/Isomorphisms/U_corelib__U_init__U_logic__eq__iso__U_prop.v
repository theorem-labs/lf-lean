From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original.
From IsomorphismChecker Require Imported.
(* Typeclasses Opaque rel_iso. *)

From IsomorphismChecker Require Export Isomorphisms.U_true__iso.

(* Helper: proof irrelevance for Prop eq expressed in SProp eq *)
Monomorphic Lemma prop_eq_proof_irrel {A : Type} {x y : A} (p q : x = y) : IsomorphismDefinitions.eq p q.
Proof.
  pose proof (Stdlib.Logic.ProofIrrelevance.proof_irrelevance _ p q) as H.
  destruct H. exact (IsomorphismDefinitions.eq_refl _).
Defined.

Monomorphic Definition imported_Corelib_Init_Logic_eq_Prop : forall x : SProp, x -> x -> SProp := @Imported.Corelib_Init_Logic_eq_Prop.

Monomorphic Instance Corelib_Init_Logic_eq_iso_Prop : (forall (x1 : Type) (x2 : SProp) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (H34 : @rel_iso x1 x2 hx x3 x4) (x5 : x1) (x6 : x2) (H56 : @rel_iso x1 x2 hx x5 x6),
   Iso (@Corelib.Init.Logic.eq x1 x3 x5) (@imported_Corelib_Init_Logic_eq_Prop x2 x4 x6)).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  destruct H34. destruct H56.
  unshelve eapply Build_Iso.
  - intro Heq. subst x5. apply Imported.Corelib_Init_Logic_eq_Prop_refl.
  - intro Heq.
    (* From SProp eq to Prop eq *)
    (* We need to show x3 = x5, given Heq : Corelib_Init_Logic_eq_Prop (to hx x3) (to hx x5) *)
    (* Use from_to to go back *)
    pose proof (from_to hx x3) as Hft3.
    pose proof (from_to hx x5) as Hft5.
    destruct Hft3. destruct Hft5.
    (* Now goal is: from hx (to hx x3) = from hx (to hx x5) *)
    (* Heq : Corelib_Init_Logic_eq_Prop (to hx x3) (to hx x5) *)
    apply (Imported.Corelib_Init_Logic_eq_Prop_recl x2 (to hx x3) 
           (fun z _ => from hx (to hx x3) = from hx z) 
           (Corelib.Init.Logic.eq_refl _) (to hx x5) Heq).
  - intro Heq. exact (IsomorphismDefinitions.eq_refl _).
  - intro Heq. apply prop_eq_proof_irrel.
Defined.

Instance: KnownConstant (@Imported.Corelib_Init_Logic_eq_Prop) := {}.
Instance: IsoStatementProofForWithSorts (HList.const Prop HList.nil) (@Corelib.Init.Logic.eq) Corelib_Init_Logic_eq_iso_Prop := {}.
Instance: IsoStatementProofBetween (@Corelib.Init.Logic.eq) (@Imported.Corelib_Init_Logic_eq_Prop) Corelib_Init_Logic_eq_iso_Prop := {}.
