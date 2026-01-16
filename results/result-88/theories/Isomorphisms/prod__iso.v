From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso *). *) (* for speed *)


Definition imported_prod : Type -> Type -> Type := Imported.prod.
Instance prod_iso : forall x1 x2 : Type, Iso x1 x2 -> forall x3 x4 : Type, Iso x3 x4 -> Iso (x1 * x3) (imported_prod x2 x4).
Proof.
  intros x1 x2 Hx12 x3 x4 Hx34.
  unshelve eapply Build_Iso.
  - intro p. destruct p as [a b].
    exact (Imported.prod_pair x2 x4 (to Hx12 a) (to Hx34 b)).
  - intro p. destruct p as [a b].
    exact (from Hx12 a, from Hx34 b).
  - intro p. destruct p as [a b].
    simpl.
    apply IsoEq.f_equal2; apply to_from.
  - intro p. destruct p as [a b].
    simpl.
    apply IsoEq.f_equal2; apply from_to.
Defined.
Instance: KnownConstant prod := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.prod := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor prod prod_iso := {}.
Instance: IsoStatementProofBetween prod Imported.prod prod_iso := {}.