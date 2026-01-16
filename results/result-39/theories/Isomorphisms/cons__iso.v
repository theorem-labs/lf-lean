From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.list__iso.

Definition imported_cons : forall x : Type, x -> imported_list x -> imported_list x := 
  fun X => @Imported.list_cons X.

Instance cons_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> forall (x5 : list x1) (x6 : imported_list x2), rel_iso (list_iso hx) x5 x6 -> rel_iso (list_iso hx) (x3 :: x5)%list (imported_cons x4 x6).
Proof.
  intros x1 x2 hx x3 x4 H_rel_x x5 x6 H_rel_list.
  constructor.
  unfold imported_cons.
  simpl.
  destruct H_rel_x as [H_rel_x].
  destruct H_rel_list as [H_rel_list].
  apply (IsoEq.f_equal2 (@Imported.list_cons x2)).
  - exact H_rel_x.
  - exact H_rel_list.
Defined.

Instance: KnownConstant (@cons) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.list_cons) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@cons) cons_iso := {}.
Instance: IsoStatementProofBetween (@cons) (@Imported.list_cons) cons_iso := {}.