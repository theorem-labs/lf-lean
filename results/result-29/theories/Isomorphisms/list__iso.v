From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_list : Type -> Type := Imported.StdList.

Fixpoint list_to_imported {A B : Type} (iso_A : Iso A B) (l : list A) : imported_list B :=
  match l with
  | nil => Imported.StdList_snil B
  | cons h t => Imported.StdList_scons B (to iso_A h) (list_to_imported iso_A t)
  end.

Fixpoint imported_to_list {A B : Type} (iso_A : Iso A B) (l : imported_list B) : list A :=
  match l with
  | Imported.StdList_snil _ => nil
  | Imported.StdList_scons _ h t => cons (from iso_A h) (imported_to_list iso_A t)
  end.

Monomorphic Definition list_to_from {A B : Type} (iso_A : Iso A B) (x : imported_list B) :
  IsomorphismDefinitions.eq (list_to_imported iso_A (imported_to_list iso_A x)) x.
Admitted.

Monomorphic Definition list_from_to {A B : Type} (iso_A : Iso A B) (x : list A) :
  IsomorphismDefinitions.eq (imported_to_list iso_A (list_to_imported iso_A x)) x.
Admitted.

Monomorphic Instance list_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (list x1) (imported_list x2) :=
  fun x1 x2 iso_x => Build_Iso (list_to_imported iso_x) (imported_to_list iso_x) (list_to_from iso_x) (list_from_to iso_x).
Instance: KnownConstant list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.StdList := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor list list_iso := {}.
Instance: IsoStatementProofBetween list Imported.StdList list_iso := {}.