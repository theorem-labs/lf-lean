From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.nat__iso.


Notation imported_Original_LF__DOT__Imp_LF_Imp_ANum := Imported.Original_LF__DOT__Imp_LF_Imp_ANum.

Instance Original_LF__DOT__Imp_LF_Imp_ANum_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso (Original.LF_DOT_Imp.LF.Imp.ANum x1) (imported_Original_LF__DOT__Imp_LF_Imp_ANum x2).
Proof.
  intros x1 x2 H.
  destruct H as [H]. constructor. simpl.
  unfold aexp_to_imported.
  simpl.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_ANum.
  simpl.
  apply f_equal.
  exact H.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.ANum := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant imported_Original_LF__DOT__Imp_LF_Imp_ANum := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.ANum Original_LF__DOT__Imp_LF_Imp_ANum_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.ANum imported_Original_LF__DOT__Imp_LF_Imp_ANum Original_LF__DOT__Imp_LF_Imp_ANum_iso := {}.
