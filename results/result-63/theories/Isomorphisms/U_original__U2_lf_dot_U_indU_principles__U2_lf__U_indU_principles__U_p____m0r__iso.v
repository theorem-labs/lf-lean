From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r : imported_nat -> SProp := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r.
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> Iso (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.P_m0r x1) (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.P_m0r := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.P_m0r Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.P_m0r Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r_iso := {}.