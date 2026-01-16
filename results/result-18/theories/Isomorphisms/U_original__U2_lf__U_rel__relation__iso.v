From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF_Rel_relation : Type -> Type := fun x : Type => x -> x -> SProp.
Monomorphic Instance Original_LF_Rel_relation_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF.Rel.relation x1) (imported_Original_LF_Rel_relation x2)
  := fun (x1 x2 : Type) (hx : Iso x1 x2) => IsoArrow hx (IsoArrow hx iso_Prop_SProp).

Instance: KnownConstant Original.LF.Rel.relation := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_relation := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.relation Original_LF_Rel_relation_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.relation Imported.Original_LF_Rel_relation Original_LF_Rel_relation_iso := {}.