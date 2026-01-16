From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_option : Type -> Type := Imported.option.

Definition option_to {A B : Type} (iab : Iso A B) (o : option A) : imported_option B :=
  match o with
  | None => Imported.option_None B
  | Some a => Imported.option_Some B (iab a)
  end.

Definition option_from {A B : Type} (iab : Iso A B) (o : imported_option B) : option A :=
  match o with
  | Imported.option_None _ => None
  | Imported.option_Some _ b => Some (from iab b)
  end.

Lemma option_to_from {A B : Type} (iab : Iso A B) : forall x, IsomorphismDefinitions.eq (option_to iab (option_from iab x)) x.
Proof.
  intro x. destruct x as [|b] using Imported.option_indl.
  - exact IsomorphismDefinitions.eq_refl.
  - simpl. apply f_equal. apply (to_from iab).
Defined.

Lemma option_from_to {A B : Type} (iab : Iso A B) : forall x, IsomorphismDefinitions.eq (option_from iab (option_to iab x)) x.
Proof.
  intro x. destruct x as [a|].
  - simpl. apply f_equal. apply (from_to iab).
  - exact IsomorphismDefinitions.eq_refl.
Defined.

Monomorphic Instance option_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (option x1) (imported_option x2).
Proof.
  intros x1 x2 hx.
  exact {| to := option_to hx; from := option_from hx; to_from := option_to_from hx; from_to := option_from_to hx |}.
Defined.

Instance: KnownConstant option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor option option_iso := {}.
Instance: IsoStatementProofBetween option Imported.option option_iso := {}.