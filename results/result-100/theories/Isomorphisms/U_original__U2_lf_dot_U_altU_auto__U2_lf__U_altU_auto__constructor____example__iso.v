From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_nat__add__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_evU_playground__ev__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_constructor__example : forall x : imported_nat, imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (imported_Nat_add x x) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_constructor__example.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_constructor__example_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso (Nat_add_iso hx hx)) (Original.LF_DOT_AltAuto.LF.AltAuto.constructor_example x1)
    (imported_Original_LF__DOT__AltAuto_LF_AltAuto_constructor__example x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.constructor_example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_constructor__example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.constructor_example Original_LF__DOT__AltAuto_LF_AltAuto_constructor__example_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.constructor_example Imported.Original_LF__DOT__AltAuto_LF_AltAuto_constructor__example Original_LF__DOT__AltAuto_LF_AltAuto_constructor__example_iso := {}.