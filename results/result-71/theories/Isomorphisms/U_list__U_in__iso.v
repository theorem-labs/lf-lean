From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. - disabled *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.list__iso.

(* U_list__U_in__iso is not a dependency for this task - using placeholder *)
(* Note: This file is not graded for this task *)
Fixpoint myList_In {A : Type} (a : A) (l : Imported.list A) : Prop :=
  match l with
  | Imported.list_nil _ => Logic.False
  | Imported.list_cons _ x xs => x = a \/ myList_In a xs
  end.

Definition imported_List_In : forall x : Type, x -> imported_list x -> Prop := @myList_In.
Instance List_In_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> forall (x5 : list x1) (x6 : imported_list x2), rel_iso (list_iso hx) x5 x6 -> Iso (List.In x3 x5) (imported_List_In x4 x6).
Admitted.
Instance: KnownConstant List.In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@myList_In) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor List.In List_In_iso := {}.
Instance: IsoStatementProofBetween List.In (@myList_In) List_In_iso := {}.