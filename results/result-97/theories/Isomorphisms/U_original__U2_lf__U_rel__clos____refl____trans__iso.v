From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__relation__iso.

Definition imported_Original_LF_Rel_clos__refl__trans : forall x : Type, (x -> x -> SProp) -> x -> x -> SProp := (@Imported.Original_LF_Rel_clos__refl__trans).
Instance Original_LF_Rel_clos__refl__trans_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : x2 -> x2 -> SProp),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) ->
  forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (Original.LF.Rel.clos_refl_trans x3 x5 x7) (imported_Original_LF_Rel_clos__refl__trans x4 x6 x8).
Admitted.
Instance: KnownConstant (@Original.LF.Rel.clos_refl_trans) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF_Rel_clos__refl__trans) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF.Rel.clos_refl_trans) Original_LF_Rel_clos__refl__trans_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF.Rel.clos_refl_trans) (@Imported.Original_LF_Rel_clos__refl__trans) Original_LF_Rel_clos__refl__trans_iso := {}.