From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Poly_LF_Poly_prod : Type -> Type -> Type := Imported.Original_LF__DOT__Poly_LF_Poly_prod.
Instance Original_LF__DOT__Poly_LF_Poly_prod_iso : forall x1 x2 : Type, Iso x1 x2 -> forall x3 x4 : Type, Iso x3 x4 -> Iso (Original.LF_DOT_Poly.LF.Poly.prod x1 x3) (imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.prod := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_prod := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.prod Original_LF__DOT__Poly_LF_Poly_prod_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.prod Imported.Original_LF__DOT__Poly_LF_Poly_prod Original_LF__DOT__Poly_LF_Poly_prod_iso := {}.