From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso *). *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reg____exp__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Star : forall x : Type, imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Star).
Instance Original_LF__DOT__IndProp_LF_IndProp_Star_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3 x4 ->
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) (Original.LF_DOT_IndProp.LF.IndProp.Star x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_Star x4).
Proof.
  intros x1 x2 hx x3 x4 H.
  idtac.
  unfold imported_Original_LF__DOT__IndProp_LF_IndProp_Star.
  unfold Imported.Original_LF__DOT__IndProp_LF_IndProp_Star.
  simpl.
  apply f_equal.
  exact H.
Defined.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.Star) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Star) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.Star) Original_LF__DOT__IndProp_LF_IndProp_Star_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.Star) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Star) Original_LF__DOT__IndProp_LF_IndProp_Star_iso := {}.