From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF_Rel_empty__relation : imported_nat -> imported_nat -> SProp := fun _ _ => sEmpty.
Monomorphic Instance Original_LF_Rel_empty__relation_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (Original.LF.Rel.empty_relation x1 x3) (imported_Original_LF_Rel_empty__relation x2 x4).
Admitted.
Instance: KnownConstant Original.LF.Rel.empty_relation := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant imported_Original_LF_Rel_empty__relation := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.empty_relation Original_LF_Rel_empty__relation_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.empty_relation imported_Original_LF_Rel_empty__relation Original_LF_Rel_empty__relation_iso := {}.