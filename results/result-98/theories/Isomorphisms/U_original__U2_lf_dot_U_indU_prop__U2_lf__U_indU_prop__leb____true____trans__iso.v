From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__leb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_leb__true__trans : forall x x0 x1 : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_leb x x0) imported_Original_LF__DOT__Basics_LF_Basics_true ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_leb x0 x1) imported_Original_LF__DOT__Basics_LF_Basics_true ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_leb x x1) imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__IndProp_LF_IndProp_leb__true__trans.
Instance Original_LF__DOT__IndProp_LF_IndProp_leb__true__trans_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : Original.LF_DOT_Basics.LF.Basics.leb x1 x3 = Original.LF_DOT_Basics.LF.Basics.true)
    (x8 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_leb x2 x4) imported_Original_LF__DOT__Basics_LF_Basics_true),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_leb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso) x7 x8 ->
  forall (x9 : Original.LF_DOT_Basics.LF.Basics.leb x3 x5 = Original.LF_DOT_Basics.LF.Basics.true)
    (x10 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_leb x4 x6) imported_Original_LF__DOT__Basics_LF_Basics_true),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_leb_iso hx0 hx1) Original_LF__DOT__Basics_LF_Basics_true_iso) x9 x10 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_leb_iso hx hx1) Original_LF__DOT__Basics_LF_Basics_true_iso)
    (Original.LF_DOT_IndProp.LF.IndProp.leb_true_trans x1 x3 x5 x7 x9) (imported_Original_LF__DOT__IndProp_LF_IndProp_leb__true__trans x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.leb_true_trans := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_leb__true__trans := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.leb_true_trans Original_LF__DOT__IndProp_LF_IndProp_leb__true__trans_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.leb_true_trans Imported.Original_LF__DOT__IndProp_LF_IndProp_leb__true__trans Original_LF__DOT__IndProp_LF_IndProp_leb__true__trans_iso := {}.