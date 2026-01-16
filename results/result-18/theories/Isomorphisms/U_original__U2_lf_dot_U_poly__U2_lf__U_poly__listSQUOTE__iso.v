From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_list' : Type -> Type := (@Imported.Original_LF__DOT__Poly_LF_Poly_list').
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_list'_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (@Original.LF_DOT_Poly.LF.Poly.list' x1) (imported_Original_LF__DOT__Poly_LF_Poly_list' x2).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.list') := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_list') := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.list') Original_LF__DOT__Poly_LF_Poly_list'_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.list') (@Imported.Original_LF__DOT__Poly_LF_Poly_list') Original_LF__DOT__Poly_LF_Poly_list'_iso := {}.