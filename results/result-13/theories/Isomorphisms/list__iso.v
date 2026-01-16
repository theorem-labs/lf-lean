From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)


Definition imported_list : Type -> Type := Imported.list.

Instance list_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (list x1) (imported_list x2).
Proof.
  intros x1 x2 hx.
  exists (fix f (l : list x1) : imported_list x2 :=
            match l with
            | nil => @Imported.list_nil x2
            | cons h t => @Imported.list_cons x2 (hx.(to) h) (f t)
            end)
         (fix g (l : imported_list x2) : list x1 :=
            match l with
            | Imported.list_nil _ => nil
            | Imported.list_cons _ h t => cons (hx.(from) h) (g t)
            end).
  - (* to_from : forall x : imported_list x2, eq (to (from x)) x *)
    fix IH 1. intros l. 
    destruct l as [|h t].
    + apply IsomorphismDefinitions.eq_refl.
    + simpl.
      apply (IsoEq.f_equal2 (@Imported.list_cons x2)).
      * apply hx.(to_from).
      * apply IH.
  - (* from_to : forall x : list x1, eq (from (to x)) x *)
    fix IH 1. intros [|h t].
    + apply IsomorphismDefinitions.eq_refl.
    + simpl. 
      apply (IsoEq.f_equal2 cons).
      * apply hx.(from_to).
      * apply IH.
Defined.

Instance: KnownConstant list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor list list_iso := {}.
Instance: IsoStatementProofBetween list Imported.list list_iso := {}.