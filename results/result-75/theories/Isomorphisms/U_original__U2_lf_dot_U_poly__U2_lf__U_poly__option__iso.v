From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_option : Type -> Type := Imported.Original_LF__DOT__Poly_LF_Poly_option.
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_option_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_Poly.LF.Poly.option x1) (imported_Original_LF__DOT__Poly_LF_Poly_option x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_option := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.option Original_LF__DOT__Poly_LF_Poly_option_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.option Imported.Original_LF__DOT__Poly_LF_Poly_option Original_LF__DOT__Poly_LF_Poly_option_iso := {}.