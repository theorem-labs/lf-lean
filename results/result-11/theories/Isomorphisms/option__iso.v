From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)

Definition imported_option : Type -> Type := Imported.myoption.

Definition option_to_imported {A B : Type} (f : A -> B) (o : option A) : Imported.myoption B :=
  match o with
  | None => Imported.myoption_myNone B
  | Some a => Imported.myoption_mySome B (f a)
  end.

Definition imported_to_option {A B : Type} (f : A -> B) (o : Imported.myoption A) : option B :=
  match o with
  | Imported.myoption_myNone _ => None
  | Imported.myoption_mySome _ a => Some (f a)
  end.

Lemma option_to_from {A B : Type} (f : A -> B) (g : B -> A) 
  (fg : forall x, IsomorphismDefinitions.eq (f (g x)) x) :
  forall o : Imported.myoption B, IsomorphismDefinitions.eq (option_to_imported f (imported_to_option g o)) o.
Proof.
  intros o. destruct o as [a|].
  - (* myoption_mySome *) simpl. exact (IsoEq.f_equal (Imported.myoption_mySome B) (fg a)).
  - (* myoption_myNone *) simpl. exact IsomorphismDefinitions.eq_refl.
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
Instance: KnownConstant Imported.myoption := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor option option_iso := {}.
Instance: IsoStatementProofBetween option Imported.myoption option_iso := {}.