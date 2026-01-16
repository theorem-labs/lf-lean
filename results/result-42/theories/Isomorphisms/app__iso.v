From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import List.
Import ListNotations.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.list__iso.

Definition imported_app : forall x : Type, imported_list x -> imported_list x -> imported_list x := Imported.app.

(* Helper lemma relating app on imported lists - uses IsomorphismDefinitions.eq *)
Lemma imported_app_spec : forall (x1 x2 : Type) (hx : Iso x1 x2) (l1 : list x1) (l2 : list x1),
  IsomorphismDefinitions.eq ((list_iso hx).(to) (app l1 l2)) (imported_app ((list_iso hx).(to) l1) ((list_iso hx).(to) l2)).
Proof.
  intros x1 x2 hx l1.
  induction l1 as [|h1 t1 IH]; intros l2; simpl.
  - (* nil case: app nil l2 = l2 on both sides - computes directly *)
    apply IsomorphismDefinitions.eq_refl.
  - (* cons case *)
    apply (f_equal2 (Imported.list_cons x2)).
    + apply IsomorphismDefinitions.eq_refl.
    + apply IH.
Defined.

Instance app_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : list x1) (x4 : imported_list x2),
  rel_iso (list_iso hx) x3 x4 -> forall (x5 : list x1) (x6 : imported_list x2), rel_iso (list_iso hx) x5 x6 -> rel_iso (list_iso hx) (x3 ++ x5)%list (imported_app x4 x6).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  idtac.
  eapply eq_trans.
  - apply imported_app_spec.
  - apply (f_equal2 (@imported_app x2)).
    + exact H34.
    + exact H56.
Defined.
Instance: KnownConstant app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor app app_iso := {}.
Instance: IsoStatementProofBetween app Imported.app app_iso := {}.