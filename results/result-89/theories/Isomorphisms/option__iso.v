From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso *). *) (* for speed *)


Definition imported_option : Type -> Type := Imported.option.

Definition option_to_imported {A B : Type} (f : A -> B) (o : option A) : Imported.option B :=
  match o with
  | None => Imported.option_None B
  | Some a => Imported.option_Some B (f a)
  end.

Definition imported_to_option {A B : Type} (f : A -> B) (o : Imported.option A) : option B :=
  match o with
  | Imported.option_None _ => None
  | Imported.option_Some _ a => Some (f a)
  end.

Lemma option_to_from {A B : Type} (f : A -> B) (g : B -> A) 
  (fg : forall x, IsomorphismDefinitions.eq (f (g x)) x) :
  forall o : Imported.option B, IsomorphismDefinitions.eq (option_to_imported f (imported_to_option g o)) o.
Proof.
  intros o. destruct o as [|a].
  - (* Imported.option_None *) simpl. exact IsomorphismDefinitions.eq_refl.
  - (* Imported.option_Some *) simpl. exact (IsoEq.f_equal (Imported.option_Some B) (fg a)).
Qed.

Lemma option_from_to {A B : Type} (f : A -> B) (g : B -> A)
  (gf : forall x, IsomorphismDefinitions.eq (g (f x)) x) :
  forall o : Datatypes.option A, IsomorphismDefinitions.eq (imported_to_option g (option_to_imported f o)) o.
Proof.
  intros o. destruct o as [a|].
  - (* Datatypes.Some *) simpl. exact (IsoEq.f_equal Datatypes.Some (gf a)).
  - (* Datatypes.None *) simpl. exact IsomorphismDefinitions.eq_refl.
Qed.

Instance option_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (option x1) (imported_option x2).
Proof.
  intros x1 x2 h.
  exact (Build_Iso (option_to_imported (to h)) (imported_to_option (from h)) 
                   (option_to_from (to h) (from h) (to_from h)) 
                   (option_from_to (to h) (from h) (from_to h))).
Defined.

Instance: KnownConstant option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor option option_iso := {}.
Instance: IsoStatementProofBetween option Imported.option option_iso := {}.