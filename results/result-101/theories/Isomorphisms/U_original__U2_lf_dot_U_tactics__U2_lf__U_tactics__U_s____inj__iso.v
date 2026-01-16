From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_S__inj : forall (x x0 : imported_nat) (x1 : imported_Original_LF__DOT__Basics_LF_Basics_bool),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb (imported_S x) (imported_S x0)) x1 ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb x x0) x1 := Imported.Original_LF__DOT__Tactics_LF_Tactics_S__inj.
Instance Original_LF__DOT__Tactics_LF_Tactics_S__inj_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : Original.LF_DOT_Basics.LF.Basics.bool)
    (x6 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx1 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x5 x6) (x7 : Original.LF_DOT_Basics.LF.Basics.eqb (S x1) (S x3) = x5)
    (x8 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb (imported_S x2) (imported_S x4)) x6),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_eqb_iso (S_iso hx) (S_iso hx0)) hx1) x7 x8 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_eqb_iso hx hx0) hx1) (Original.LF_DOT_Tactics.LF.Tactics.S_inj x1 x3 x5 x7)
    (imported_Original_LF__DOT__Tactics_LF_Tactics_S__inj x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.S_inj := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_S__inj := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.S_inj Original_LF__DOT__Tactics_LF_Tactics_S__inj_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.S_inj Imported.Original_LF__DOT__Tactics_LF_Tactics_S__inj Original_LF__DOT__Tactics_LF_Tactics_S__inj_iso := {}.