From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original.
From IsomorphismChecker Require Imported.
(* (* Typeclasses Opaque rel_iso. *) *)

From IsomorphismChecker Require Export Isomorphisms.U_true__iso.

(* Imported.Corelib_Init_Logic_eq_Prop is for SProp arguments *)
Definition imported_Corelib_Init_Logic_eq_Prop : forall x : SProp, x -> x -> SProp := @Imported.Corelib_Init_Logic_eq_Prop.

(* For SProp arguments, we use a simpler approach since all SProp proofs are equal *)
(* When x1 : Type and x2 : SProp, and we have an Iso, equality in x1 maps to equality in x2 (SProp) *)
(* In practice x1 will be Prop (since the hint mentions HList.const Prop), so we can use proof irrelevance *)

(* Helper: transport along SProp eq *)
Definition transport_sprop {A : SProp} {P : A -> Type} {x y : A} 
  (e : Imported.Corelib_Init_Logic_eq_Prop A x y) (px : P x) : P y :=
  match e with
  | Imported.Corelib_Init_Logic_eq_Prop_refl _ _ => px
  end.

Instance Corelib_Init_Logic_eq_iso_Prop : (forall (x1 : Type) (x2 : SProp) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (_ : @rel_iso x1 x2 hx x3 x4) (x5 : x1) (x6 : x2) (_ : @rel_iso x1 x2 hx x5 x6),
   Iso (@Corelib.Init.Logic.eq x1 x3 x5) (@imported_Corelib_Init_Logic_eq_Prop x2 x4 x6)).
Proof.
  intros x1 x2 hx x3 x4 [H34] x5 x6 [H56].
  unshelve eapply Build_Iso.
  - (* to: x3 = x5 -> imported_Corelib_Init_Logic_eq_Prop x4 x6 *)
    intro Heq. simpl in *.
    destruct H34. destruct H56. destruct Heq.
    exact (Imported.Corelib_Init_Logic_eq_Prop_refl _ _).
  - (* from: imported_Corelib_Init_Logic_eq_Prop x4 x6 -> x3 = x5 *)
    intro Hseq. simpl in *.
    destruct H34. destruct H56.
    (* Hseq : Corelib_Init_Logic_eq_Prop x2 (to hx x3) (to hx x5) *)
    (* Use transport to show from hx (to hx x3) = from hx (to hx x5) *)
    set (P := fun (z : x2) => from hx (to hx x3) = from hx z).
    assert (base : P (to hx x3)) by reflexivity.
    pose (result := transport_sprop Hseq base).
    (* result : from hx (to hx x3) = from hx (to hx x5) *)
    (* By from_to, from hx (to hx xi) = xi *)
    transitivity (from hx (to hx x3)).
    + symmetry. 
      pose (ft := from_to hx x3).
      destruct ft. reflexivity.
    + transitivity (from hx (to hx x5)).
      * exact result.
      * pose (ft := from_to hx x5).
        destruct ft. reflexivity.
  - (* to_from *)
    intro Hseq.
    apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intro Heq.
    (* Use proof irrelevance since x3 = x5 is in Prop *)
    apply seq_of_eq.
    apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant (@Corelib.Init.Logic.eq) := {}.
Instance: KnownConstant (@Imported.Corelib_Init_Logic_eq_Prop) := {}.
Instance: IsoStatementProofForWithSorts (HList.const Prop HList.nil) (@Corelib.Init.Logic.eq) Corelib_Init_Logic_eq_iso_Prop := {}.
Instance: IsoStatementProofBetween (@Corelib.Init.Logic.eq) (@Imported.Corelib_Init_Logic_eq_Prop) Corelib_Init_Logic_eq_iso_Prop := {}.
