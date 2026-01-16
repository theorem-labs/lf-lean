From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__leb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_leb__correct : forall x x0 : imported_nat, imported_le x x0 -> imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_leb x x0) imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__IndProp_LF_IndProp_leb__correct.
Instance Original_LF__DOT__IndProp_LF_IndProp_leb__correct_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : x1 <= x3) (x6 : imported_le x2 x4),
  rel_iso (le_iso hx hx0) x5 x6 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_leb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso) (Original.LF_DOT_IndProp.LF.IndProp.leb_correct x1 x3 x5)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_leb__correct x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.leb_correct := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_leb__correct := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.leb_correct Original_LF__DOT__IndProp_LF_IndProp_leb__correct_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.leb_correct Imported.Original_LF__DOT__IndProp_LF_IndProp_leb__correct Original_LF__DOT__IndProp_LF_IndProp_leb__correct_iso := {}.