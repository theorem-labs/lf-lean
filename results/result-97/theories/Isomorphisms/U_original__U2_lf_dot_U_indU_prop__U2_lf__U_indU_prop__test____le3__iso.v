From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_s__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_test__le3 : imported_le (imported_S (imported_S imported_0)) (imported_S imported_0) ->
  imported_Corelib_Init_Logic_eq (imported_Nat_add (imported_S (imported_S imported_0)) (imported_S (imported_S imported_0))) (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0)))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_test__le3.
Instance Original_LF__DOT__IndProp_LF_IndProp_test__le3_iso : forall (x1 : 2 <= 1) (x2 : imported_le (imported_S (imported_S imported_0)) (imported_S imported_0)),
  rel_iso (le_iso (S_iso (S_iso _0_iso)) (S_iso _0_iso)) x1 x2 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_add_iso (S_iso (S_iso _0_iso)) (S_iso (S_iso _0_iso))) (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 2 0 imported_0 _0_iso)))))
    (Original.LF_DOT_IndProp.LF.IndProp.test_le3 x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_test__le3 x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.test_le3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_test__le3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.test_le3 Original_LF__DOT__IndProp_LF_IndProp_test__le3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.test_le3 Imported.Original_LF__DOT__IndProp_LF_IndProp_test__le3 Original_LF__DOT__IndProp_LF_IndProp_test__le3_iso := {}.