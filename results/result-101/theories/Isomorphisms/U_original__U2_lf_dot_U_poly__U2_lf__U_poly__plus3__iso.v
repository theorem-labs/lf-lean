From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_plus3 : imported_nat -> imported_nat := Imported.Original_LF__DOT__Poly_LF_Poly_plus3.
Instance Original_LF__DOT__Poly_LF_Poly_plus3_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Poly.LF.Poly.plus3 x1) (imported_Original_LF__DOT__Poly_LF_Poly_plus3 x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.plus3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_plus3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.plus3 Original_LF__DOT__Poly_LF_Poly_plus3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.plus3 Imported.Original_LF__DOT__Poly_LF_Poly_plus3 Original_LF__DOT__Poly_LF_Poly_plus3_iso := {}.