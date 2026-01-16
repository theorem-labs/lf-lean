From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_silly1 : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_add (imported_S imported_0) x) (imported_S x) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_silly1.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_silly1_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_add_iso (S_iso _0_iso) hx) (S_iso hx)) (Original.LF_DOT_AltAuto.LF.AltAuto.silly1 x1) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_silly1 x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.silly1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_silly1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.silly1 Original_LF__DOT__AltAuto_LF_AltAuto_silly1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.silly1 Imported.Original_LF__DOT__AltAuto_LF_AltAuto_silly1 Original_LF__DOT__AltAuto_LF_AltAuto_silly1_iso := {}.