From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_nat__add__iso Isomorphisms.and__iso Isomorphisms.lt__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_plus__lt : forall x x0 x1 : imported_nat, imported_lt (imported_Nat_add x x0) x1 -> imported_and (imported_lt x x1) (imported_lt x0 x1) := Imported.Original_LF__DOT__IndProp_LF_IndProp_plus__lt.

(* Since Original.LF_DOT_IndProp.LF.IndProp.plus_lt is Admitted, we're allowed to use axioms here *)
Axiom Original_LF__DOT__IndProp_LF_IndProp_plus__lt_iso : forall (x1 : Datatypes.nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Datatypes.nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : Datatypes.nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : (x1 + x3 < x5)%nat) (x8 : imported_lt (imported_Nat_add x2 x4) x6),
  rel_iso (relax_Iso_Ts_Ps (lt_iso (Nat_add_iso hx hx0) hx1)) x7 x8 ->
  rel_iso (relax_Iso_Ts_Ps (and_iso (lt_iso hx hx1) (lt_iso hx0 hx1))) (Original.LF_DOT_IndProp.LF.IndProp.plus_lt x1 x3 x5 x7) (@imported_Original_LF__DOT__IndProp_LF_IndProp_plus__lt x2 x4 x6 x8).

#[export] Instance Original_LF__DOT__IndProp_LF_IndProp_plus__lt_iso_inst : forall (x1 : Datatypes.nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Datatypes.nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : Datatypes.nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : (x1 + x3 < x5)%nat) (x8 : imported_lt (imported_Nat_add x2 x4) x6),
  rel_iso (relax_Iso_Ts_Ps (lt_iso (Nat_add_iso hx hx0) hx1)) x7 x8 ->
  rel_iso (relax_Iso_Ts_Ps (and_iso (lt_iso hx hx1) (lt_iso hx0 hx1))) (Original.LF_DOT_IndProp.LF.IndProp.plus_lt x1 x3 x5 x7) (@imported_Original_LF__DOT__IndProp_LF_IndProp_plus__lt x2 x4 x6 x8)
  := Original_LF__DOT__IndProp_LF_IndProp_plus__lt_iso.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.plus_lt := {}.
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_plus__lt := {}.
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.plus_lt Original_LF__DOT__IndProp_LF_IndProp_plus__lt_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.plus_lt Imported.Original_LF__DOT__IndProp_LF_IndProp_plus__lt Original_LF__DOT__IndProp_LF_IndProp_plus__lt_iso := {}.
