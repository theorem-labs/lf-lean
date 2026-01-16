From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_O__le__n : forall x : imported_nat, imported_le imported_0 x := Imported.Original_LF__DOT__IndProp_LF_IndProp_O__le__n.
Instance Original_LF__DOT__IndProp_LF_IndProp_O__le__n_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (le_iso _0_iso hx) (Original.LF_DOT_IndProp.LF.IndProp.O_le_n x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_O__le__n x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.O_le_n := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_O__le__n := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.O_le_n Original_LF__DOT__IndProp_LF_IndProp_O__le__n_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.O_le_n Imported.Original_LF__DOT__IndProp_LF_IndProp_O__le__n Original_LF__DOT__IndProp_LF_IndProp_O__le__n_iso := {}.