From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_list : Type -> Type := Imported.mylist.

Fixpoint list_to_imported {A B : Type} (f : A -> B) (l : list A) : imported_list B :=
  match l with
  | nil => Imported.mylist_nil B
  | cons h t => Imported.mylist_cons B (f h) (list_to_imported f t)
  end.

Fixpoint imported_to_list {A B : Type} (f : B -> A) (l : imported_list B) : list A :=
  match l with
  | Imported.mylist_nil _ => nil
  | Imported.mylist_cons _ h t => cons (f h) (imported_to_list f t)
  end.

Lemma mylist_cons_eq {A : Type} (h1 h2 : A) (t1 t2 : Imported.mylist A) :
  IsomorphismDefinitions.eq h1 h2 ->
  IsomorphismDefinitions.eq t1 t2 ->
  IsomorphismDefinitions.eq (Imported.mylist_cons A h1 t1) (Imported.mylist_cons A h2 t2).
Proof.
  intros Hh Ht. destruct Hh, Ht. apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma list_to_from {A B : Type} (HAB : Iso A B) : forall (l : imported_list B),
  IsomorphismDefinitions.eq (list_to_imported (to HAB) (imported_to_list (from HAB) l)) l.
Proof.
  fix IH 1.
  intro l. destruct l as [|h t].
  - apply IsomorphismDefinitions.eq_refl.
  - cbn [list_to_imported imported_to_list].
    apply mylist_cons_eq.
    + apply (to_from HAB h).
    + apply IH.
Qed.

Lemma list_cons_eq {A : Type} (h1 h2 : A) (t1 t2 : list A) :
  IsomorphismDefinitions.eq h1 h2 ->
  IsomorphismDefinitions.eq t1 t2 ->
  IsomorphismDefinitions.eq (cons h1 t1) (cons h2 t2).
Proof.
  intros Hh Ht. destruct Hh, Ht. apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma list_from_to {A B : Type} (HAB : Iso A B) : forall (l : list A),
  IsomorphismDefinitions.eq (imported_to_list (from HAB) (list_to_imported (to HAB) l)) l.
Proof.
  fix IH 1.
  intro l. destruct l as [|h t].
  - apply IsomorphismDefinitions.eq_refl.
  - cbn [list_to_imported imported_to_list].
    apply list_cons_eq.
    + apply (from_to HAB h).
    + apply IH.
Qed.

Monomorphic Instance list_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (list x1) (imported_list x2).
Proof.
  intros A B HAB.
  exact {|
    to := list_to_imported (to HAB);
    from := imported_to_list (from HAB);
    to_from := list_to_from HAB;
    from_to := list_from_to HAB
  |}.
Defined.

Instance: KnownConstant list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.mylist := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor list list_iso := {}.
Instance: IsoStatementProofBetween list Imported.mylist list_iso := {}.