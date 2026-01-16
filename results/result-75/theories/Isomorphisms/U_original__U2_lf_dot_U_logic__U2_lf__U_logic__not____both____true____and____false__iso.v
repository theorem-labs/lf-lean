From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso Isomorphisms.and__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_not__both__true__and__false : forall x : SProp, imported_and x (x -> imported_False) -> imported_False := Imported.Original_LF__DOT__Logic_LF_Logic_not__both__true__and__false.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_not__both__true__and__false_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : x1 /\ (x1 -> False)) (x4 : imported_and x2 (x2 -> imported_False)),
  rel_iso (relax_Iso_Ts_Ps (and_iso hx (IsoArrow hx False_iso))) x3 x4 ->
  rel_iso (relax_Iso_Ts_Ps False_iso) (Original.LF_DOT_Logic.LF.Logic.not_both_true_and_false x1 x3) (imported_Original_LF__DOT__Logic_LF_Logic_not__both__true__and__false x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.not_both_true_and_false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_not__both__true__and__false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.not_both_true_and_false Original_LF__DOT__Logic_LF_Logic_not__both__true__and__false_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.not_both_true_and_false Imported.Original_LF__DOT__Logic_LF_Logic_not__both__true__and__false Original_LF__DOT__Logic_LF_Logic_not__both__true__and__false_iso := {}.