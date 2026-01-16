From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_option : Type -> Type := Imported.myoption.

Definition option_to_imported {A B : Type} (f : A -> B) (o : option A) : imported_option B :=
  match o with
  | None => Imported.myoption_None B
  | Some a => Imported.myoption_Some B (f a)
  end.

Definition imported_to_option {A B : Type} (f : B -> A) (o : imported_option B) : option A :=
  match o with
  | Imported.myoption_None _ => None
  | Imported.myoption_Some _ b => Some (f b)
  end.

Lemma myoption_Some_eq {A : Type} (a1 a2 : A) :
  IsomorphismDefinitions.eq a1 a2 ->
  IsomorphismDefinitions.eq (Imported.myoption_Some A a1) (Imported.myoption_Some A a2).
Proof.
  intro H. destruct H. apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma option_Some_eq {A : Type} (a1 a2 : A) :
  IsomorphismDefinitions.eq a1 a2 ->
  IsomorphismDefinitions.eq (Some a1) (Some a2).
Proof.
  intro H. destruct H. apply IsomorphismDefinitions.eq_refl.
Qed.

Monomorphic Instance option_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (option x1) (imported_option x2).
Proof.
  intros A B HAB.
  refine {|
    to := option_to_imported (to HAB);
    from := imported_to_option (from HAB);
    to_from := _;
    from_to := _
  |}.
  - (* to_from: imported_option B *)
    intro o. destruct o as [|b].  (* myoption_None, myoption_Some b *)
    + apply IsomorphismDefinitions.eq_refl.
    + cbn [option_to_imported imported_to_option].
      apply myoption_Some_eq. apply (to_from HAB b).
  - (* from_to: option A *)
    intro o. destruct o as [a|].  (* Some a, None *)
    + cbn [option_to_imported imported_to_option].
      apply option_Some_eq. apply (from_to HAB a).
    + apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.myoption := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor option option_iso := {}.
Instance: IsoStatementProofBetween option Imported.myoption option_iso := {}.