From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_trans__eq : forall (x : Type) (x0 x1 x2 : x), imported_Corelib_Init_Logic_eq x0 x1 -> imported_Corelib_Init_Logic_eq x1 x2 -> imported_Corelib_Init_Logic_eq x0 x2 := Imported.Original_LF__DOT__Tactics_LF_Tactics_trans__eq.
Instance Original_LF__DOT__Tactics_LF_Tactics_trans__eq_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (hx0 : rel_iso hx x3 x4) (x5 : x1) (x6 : x2) (hx1 : rel_iso hx x5 x6) (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) 
    (x9 : x3 = x5) (x10 : imported_Corelib_Init_Logic_eq x4 x6),
  rel_iso (Corelib_Init_Logic_eq_iso hx0 hx1) x9 x10 ->
  forall (x11 : x5 = x7) (x12 : imported_Corelib_Init_Logic_eq x6 x8),
  rel_iso (Corelib_Init_Logic_eq_iso hx1 hx2) x11 x12 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx0 hx2) (Original.LF_DOT_Tactics.LF.Tactics.trans_eq x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__Tactics_LF_Tactics_trans__eq x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.trans_eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_trans__eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.trans_eq Original_LF__DOT__Tactics_LF_Tactics_trans__eq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.trans_eq Imported.Original_LF__DOT__Tactics_LF_Tactics_trans__eq Original_LF__DOT__Tactics_LF_Tactics_trans__eq_iso := {}.