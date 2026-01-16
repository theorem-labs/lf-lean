From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reg____exp__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Char : forall x : Type, x -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Char).
Instance Original_LF__DOT__IndProp_LF_IndProp_Char_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) (Original.LF_DOT_IndProp.LF.IndProp.Char x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_Char x4).
Proof.
  intros x1 x2 hx x3 x4 H34.
  (*simpl in *.
  unfold imported_Original_LF__DOT__IndProp_LF_IndProp_Char.
  unfold Imported.Original_LF__DOT__IndProp_LF_IndProp_Char.
  simpl.
  apply (IsoEq.f_equal (Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Char x2) H34).
Qed.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.Char) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Char) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.Char) Original_LF__DOT__IndProp_LF_IndProp_Char_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.Char) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Char) Original_LF__DOT__IndProp_LF_IndProp_Char_iso := {}.