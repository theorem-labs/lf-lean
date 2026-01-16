From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__relation__iso.

Definition imported_Original_LF_Rel_reflexive : forall x : Type, (x -> x -> SProp) -> SProp := fun (x : Type) (x0 : x -> x -> SProp) => forall a' : x, x0 a' a'.
Instance Original_LF_Rel_reflexive_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : x2 -> x2 -> SProp),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) ->
  Iso (Original.LF.Rel.reflexive x3) (imported_Original_LF_Rel_reflexive x4)
  := fun (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : x2 -> x2 -> SProp)
    (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) =>
  IsoForall (fun a : x1 => x3 a a) (fun x6 : x2 => x4 x6 x6) (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso hx x5 x6) => hx0 x5 x6 hx1 x5 x6 hx1).

Instance: KnownConstant (@Original.LF.Rel.reflexive) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF_Rel_reflexive) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF.Rel.reflexive) Original_LF_Rel_reflexive_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF.Rel.reflexive) (@Imported.Original_LF_Rel_reflexive) Original_LF_Rel_reflexive_iso := {}.