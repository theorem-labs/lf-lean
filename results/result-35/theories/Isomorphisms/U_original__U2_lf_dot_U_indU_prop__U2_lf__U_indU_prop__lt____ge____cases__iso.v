From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.ge__iso Isomorphisms.lt__iso Isomorphisms.or__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_lt__ge__cases : forall x x0 : imported_nat, imported_or (imported_lt x x0) (imported_ge x x0) := Imported.Original_LF__DOT__IndProp_LF_IndProp_lt__ge__cases.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_lt__ge__cases_iso : forall (x1 : nat) (x2 : imported_nat) (hx : @rel_iso nat imported_nat nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : @rel_iso nat imported_nat nat_iso x3 x4),
  @rel_iso (x1 < x3 \/ x1 >= x3) (imported_or (imported_lt x2 x4) (imported_ge x2 x4))
    (@relax_Iso_Ts_Ps (x1 < x3 \/ x1 >= x3) (imported_or (imported_lt x2 x4) (imported_ge x2 x4))
       (@or_iso (x1 < x3) (imported_lt x2 x4) (@lt_iso x1 x2 hx x3 x4 hx0) (x1 >= x3) (imported_ge x2 x4) (@ge_iso x1 x2 hx x3 x4 hx0)))
    (Original.LF_DOT_IndProp.LF.IndProp.lt_ge_cases x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_lt__ge__cases x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.lt_ge_cases := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_lt__ge__cases := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.lt_ge_cases Original_LF__DOT__IndProp_LF_IndProp_lt__ge__cases_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.lt_ge_cases Imported.Original_LF__DOT__IndProp_LF_IndProp_lt__ge__cases Original_LF__DOT__IndProp_LF_IndProp_lt__ge__cases_iso := {}.