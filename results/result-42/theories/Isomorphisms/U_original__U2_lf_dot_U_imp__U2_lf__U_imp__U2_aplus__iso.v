From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_APlus : imported_Original_LF__DOT__Imp_LF_Imp_aexp -> imported_Original_LF__DOT__Imp_LF_Imp_aexp -> imported_Original_LF__DOT__Imp_LF_Imp_aexp := Imported.Original_LF__DOT__Imp_LF_Imp_APlus.

Instance Original_LF__DOT__Imp_LF_Imp_APlus_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.aexp) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x3 x4 -> rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso (Original.LF_DOT_Imp.LF.Imp.APlus x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_APlus x2 x4).
Proof.
  intros x1 x2 H1 x3 x4 H2.
  idtac.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_APlus.
  simpl.
  apply f_equal2; assumption.
Qed.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.APlus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_APlus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.APlus Original_LF__DOT__Imp_LF_Imp_APlus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.APlus Imported.Original_LF__DOT__Imp_LF_Imp_APlus Original_LF__DOT__Imp_LF_Imp_APlus_iso := {}.
