From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_plus__n__Sm : forall x x0 : imported_nat, imported_Corelib_Init_Logic_eq (imported_S (imported_Nat_add x x0)) (imported_Nat_add x (imported_S x0)) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_plus__n__Sm.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_plus__n__Sm_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso (Corelib_Init_Logic_eq_iso (S_iso (Nat_add_iso hx hx0)) (Nat_add_iso hx (S_iso hx0))) (Original.LF_DOT_AltAuto.LF.AltAuto.plus_n_Sm x1 x3)
    (imported_Original_LF__DOT__AltAuto_LF_AltAuto_plus__n__Sm x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.plus_n_Sm := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_plus__n__Sm := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.plus_n_Sm Original_LF__DOT__AltAuto_LF_AltAuto_plus__n__Sm_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.plus_n_Sm Imported.Original_LF__DOT__AltAuto_LF_AltAuto_plus__n__Sm Original_LF__DOT__AltAuto_LF_AltAuto_plus__n__Sm_iso := {}.