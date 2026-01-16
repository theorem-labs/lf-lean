From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_eqb__sym : forall x x0 : imported_nat, imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb x x0) (imported_Original_LF__DOT__Basics_LF_Basics_eqb x0 x) := Imported.Original_LF__DOT__Tactics_LF_Tactics_eqb__sym.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_eqb__sym_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_eqb_iso hx hx0) (Original_LF__DOT__Basics_LF_Basics_eqb_iso hx0 hx)) (Original.LF_DOT_Tactics.LF.Tactics.eqb_sym x1 x3)
    (imported_Original_LF__DOT__Tactics_LF_Tactics_eqb__sym x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.eqb_sym := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_eqb__sym := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.eqb_sym Original_LF__DOT__Tactics_LF_Tactics_eqb__sym_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.eqb_sym Imported.Original_LF__DOT__Tactics_LF_Tactics_eqb__sym Original_LF__DOT__Tactics_LF_Tactics_eqb__sym_iso := {}.