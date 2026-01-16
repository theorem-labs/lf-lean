From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__relation__iso.

Definition imported_Original_LF_Rel_order : forall x : Type, (x -> x -> SProp) -> SProp := (@Imported.Original_LF_Rel_order).
Instance Original_LF_Rel_order_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : x2 -> x2 -> SProp),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) -> Iso (Original.LF.Rel.order x3) (imported_Original_LF_Rel_order x4).
Admitted.
Instance: KnownConstant (@Original.LF.Rel.order) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF_Rel_order) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF.Rel.order) Original_LF_Rel_order_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF.Rel.order) (@Imported.Original_LF_Rel_order) Original_LF_Rel_order_iso := {}.