From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reg____exp__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_EmptyStr : forall x : Type, imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_EmptyStr).
Instance Original_LF__DOT__IndProp_LF_IndProp_EmptyStr_iso : forall (x1 x2 : Type) (hx : Iso x1 x2),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) Original.LF_DOT_IndProp.LF.IndProp.EmptyStr (imported_Original_LF__DOT__IndProp_LF_IndProp_EmptyStr x2).
Proof.
  intros x1 x2 hx.
  constructor. simpl. simpl.
  unfold imported_Original_LF__DOT__IndProp_LF_IndProp_EmptyStr.
  unfold Imported.Original_LF__DOT__IndProp_LF_IndProp_EmptyStr.
  apply IsomorphismDefinitions.eq_refl.
Qed.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.EmptyStr) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_EmptyStr) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.EmptyStr) Original_LF__DOT__IndProp_LF_IndProp_EmptyStr_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.EmptyStr) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_EmptyStr) Original_LF__DOT__IndProp_LF_IndProp_EmptyStr_iso := {}.