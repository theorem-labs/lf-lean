From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_foo' : Type -> Type := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_foo'.
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_foo'_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.foo' x1) (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_foo' x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.foo' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_foo' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.foo' Original_LF__DOT__IndPrinciples_LF_IndPrinciples_foo'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.foo' Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_foo' Original_LF__DOT__IndPrinciples_LF_IndPrinciples_foo'_iso := {}.