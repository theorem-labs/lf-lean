From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_natU_playground__nat__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_pred : imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat -> imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat := Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_pred.
Instance Original_LF__DOT__Basics_LF_Basics_NatPlayground_pred_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.NatPlayground.nat) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat),
  rel_iso Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_iso x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_iso (Original.LF_DOT_Basics.LF.Basics.NatPlayground.pred x1) (imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_pred x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.NatPlayground.pred := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_pred := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.NatPlayground.pred Original_LF__DOT__Basics_LF_Basics_NatPlayground_pred_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.NatPlayground.pred Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_pred Original_LF__DOT__Basics_LF_Basics_NatPlayground_pred_iso := {}.