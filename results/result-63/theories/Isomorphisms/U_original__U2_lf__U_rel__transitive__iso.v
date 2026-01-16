From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__relation__iso.

Definition imported_Original_LF_Rel_transitive : forall x : Type, (x -> x -> SProp) -> SProp := fun (x : Type) (x0 : x -> x -> SProp) => forall a' a'0 a'1 : x, x0 a' a'0 -> x0 a'0 a'1 -> x0 a' a'1.
Instance Original_LF_Rel_transitive_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : x2 -> x2 -> SProp),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) ->
  Iso (Original.LF.Rel.transitive x3) (imported_Original_LF_Rel_transitive x4)
  := fun (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : x2 -> x2 -> SProp)
    (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) =>
  IsoForall (fun a : x1 => forall b c : x1, x3 a b -> x3 b c -> x3 a c) (fun x6 : x2 => forall a' a'0 : x2, x4 x6 a' -> x4 a' a'0 -> x4 x6 a'0)
    (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso hx x5 x6) =>
     IsoForall (fun a : x1 => forall c : x1, x3 x5 a -> x3 a c -> x3 x5 c) (fun x8 : x2 => forall a' : x2, x4 x6 x8 -> x4 x8 a' -> x4 x6 a')
       (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) =>
        IsoForall (fun a : x1 => x3 x5 x7 -> x3 x7 a -> x3 x5 a) (fun x10 : x2 => x4 x6 x8 -> x4 x8 x10 -> x4 x6 x10)
          (fun (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) => IsoArrow (hx0 x5 x6 hx1 x7 x8 hx2) (IsoArrow (hx0 x7 x8 hx2 x9 x10 hx3) (hx0 x5 x6 hx1 x9 x10 hx3))))).

Instance: KnownConstant (@Original.LF.Rel.transitive) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF_Rel_transitive) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF.Rel.transitive) Original_LF_Rel_transitive_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF.Rel.transitive) (@Imported.Original_LF_Rel_transitive) Original_LF_Rel_transitive_iso := {}.