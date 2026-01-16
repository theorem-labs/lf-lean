From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf__U_rel__relation__iso.

Definition imported_Original_LF_Rel_antisymmetric : forall x : Type, (x -> x -> SProp) -> SProp := fun (x : Type) (x0 : x -> x -> SProp) => forall a' a'0 : x, x0 a' a'0 -> x0 a'0 a' -> imported_Corelib_Init_Logic_eq a' a'0.
Instance Original_LF_Rel_antisymmetric_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : x2 -> x2 -> SProp),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) ->
  Iso (Original.LF.Rel.antisymmetric x3) (imported_Original_LF_Rel_antisymmetric x4)
  := fun (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : x2 -> x2 -> SProp)
    (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) =>
  IsoForall (fun a : x1 => forall b : x1, x3 a b -> x3 b a -> a = b) (fun x6 : x2 => forall a' : x2, x4 x6 a' -> x4 a' x6 -> imported_Corelib_Init_Logic_eq x6 a')
    (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso hx x5 x6) =>
     IsoForall (fun a : x1 => x3 x5 a -> x3 a x5 -> x5 = a) (fun x8 : x2 => x4 x6 x8 -> x4 x8 x6 -> imported_Corelib_Init_Logic_eq x6 x8)
       (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => IsoArrow (hx0 x5 x6 hx1 x7 x8 hx2) (IsoArrow (hx0 x7 x8 hx2 x5 x6 hx1) (Corelib_Init_Logic_eq_iso hx1 hx2)))).

Instance: KnownConstant (@Original.LF.Rel.antisymmetric) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF_Rel_antisymmetric) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF.Rel.antisymmetric) Original_LF_Rel_antisymmetric_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF.Rel.antisymmetric) (@Imported.Original_LF_Rel_antisymmetric) Original_LF_Rel_antisymmetric_iso := {}.