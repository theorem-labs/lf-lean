From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_injective : forall x x0 : Type, (x -> x0) -> SProp := fun (x x0 : Type) (x1 : x -> x0) => forall a' a'0 : x, imported_Corelib_Init_Logic_eq (x1 a') (x1 a'0) -> imported_Corelib_Init_Logic_eq a' a'0.
Instance Original_LF__DOT__Logic_LF_Logic_injective_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x1 -> x3) (x6 : x2 -> x4),
  (forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso hx0 (x5 x7) (x6 x8)) -> Iso (Original.LF_DOT_Logic.LF.Logic.injective x5) (imported_Original_LF__DOT__Logic_LF_Logic_injective x6)
  := fun (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x1 -> x3) (x6 : x2 -> x4) (hx1 : forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso hx0 (x5 x7) (x6 x8)) =>
  IsoForall (fun a : x1 => forall y : x1, x5 a = x5 y -> a = y) (fun x8 : x2 => forall a' : x2, imported_Corelib_Init_Logic_eq (x6 x8) (x6 a') -> imported_Corelib_Init_Logic_eq x8 a')
    (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) =>
     IsoForall (fun a : x1 => x5 x7 = x5 a -> x7 = a) (fun x10 : x2 => imported_Corelib_Init_Logic_eq (x6 x8) (x6 x10) -> imported_Corelib_Init_Logic_eq x8 x10)
       (fun (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) => IsoArrow (Corelib_Init_Logic_eq_iso (hx1 x7 x8 hx2) (hx1 x9 x10 hx3)) (relax_Iso_Ts_Ps (Corelib_Init_Logic_eq_iso hx2 hx3)))).

Instance: KnownConstant (@Original.LF_DOT_Logic.LF.Logic.injective) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Logic_LF_Logic_injective) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Logic.LF.Logic.injective) Original_LF__DOT__Logic_LF_Logic_injective_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Logic.LF.Logic.injective) (@Imported.Original_LF__DOT__Logic_LF_Logic_injective) Original_LF__DOT__Logic_LF_Logic_injective_iso := {}.