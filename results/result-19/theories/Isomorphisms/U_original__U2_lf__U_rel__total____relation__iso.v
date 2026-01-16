From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

(* Both Original and Imported total_relation are empty inductives, so the iso is trivial *)
Monomorphic Definition imported_Original_LF_Rel_total__relation : imported_nat -> imported_nat -> SProp := Imported.Original_LF_Rel_total__relation.
Monomorphic Instance Original_LF_Rel_total__relation_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (Original.LF.Rel.total_relation x1 x3) (imported_Original_LF_Rel_total__relation x2 x4).
Proof.
  intros x1 x2 Hx1 x3 x4 Hx3.
  (* Both are empty inductives - iso is trivial because there are no elements to map *)
  unshelve eapply Build_Iso.
  - (* to *) intro H. destruct H.
  - (* from *) intro H. destruct H.
  - (* to_from *) intro H. destruct H.
  - (* from_to *) intro H. destruct H.
Defined.

Instance: KnownConstant Original.LF.Rel.total_relation := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_total__relation := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.total_relation Original_LF_Rel_total__relation_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.total_relation Imported.Original_LF_Rel_total__relation Original_LF_Rel_total__relation_iso := {}.
