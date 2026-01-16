From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



Definition imported_option : Type -> Type := Imported.option.

Definition option_iso_forward {x1 x2 : Type} (h : Iso x1 x2) (o : option x1) : imported_option x2 :=
  match o with
  | None => Imported.option_none x2
  | Some v => Imported.option_some x2 (to h v)
  end.

Definition option_iso_backward {x1 x2 : Type} (h : Iso x1 x2) (o : imported_option x2) : option x1 :=
  match o with
  | Imported.option_none _ => None
  | Imported.option_some _ v => Some (from h v)
  end.

Instance option_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (option x1) (imported_option x2).
Proof.
  intros x1 x2 hx.
  refine (Build_Iso (option_iso_forward hx) (option_iso_backward hx) _ _).
  - (* to_from: forall x, to (from x) = x *)
    intro o. destruct o as [|v].
    + exact IsomorphismDefinitions.eq_refl.
    + unfold option_iso_forward, option_iso_backward. simpl.
      exact (f_equal (Imported.option_some x2) (to_from hx v)).
  - (* from_to: forall x, from (to x) = x *)
    intro o. 
    destruct o as [v|].
    + (* Some v *)
      unfold option_iso_forward, option_iso_backward. simpl.
      exact (f_equal Some (from_to hx v)).
    + (* None *)
      simpl. exact IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor option option_iso := {}.
Instance: IsoStatementProofBetween option Imported.option option_iso := {}.