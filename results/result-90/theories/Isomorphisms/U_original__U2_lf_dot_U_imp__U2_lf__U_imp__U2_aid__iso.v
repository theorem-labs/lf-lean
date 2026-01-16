From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_string__string__iso.


Notation imported_Original_LF__DOT__Imp_LF_Imp_AId := Imported.Original_LF__DOT__Imp_LF_Imp_AId.

Instance Original_LF__DOT__Imp_LF_Imp_AId_iso : forall (x1 : String.string) (x2 : imported_String_string), rel_iso String_string_iso x1 x2 -> rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso (Original.LF_DOT_Imp.LF.Imp.AId x1) (imported_Original_LF__DOT__Imp_LF_Imp_AId x2).
Proof.
  intros x1 x2 H.
  destruct H as [H]. constructor. simpl.
  unfold aexp_to_imported.
  simpl.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_AId.
  simpl.
  apply f_equal.
  exact H.
Qed.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AId := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant imported_Original_LF__DOT__Imp_LF_Imp_AId := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AId Original_LF__DOT__Imp_LF_Imp_AId_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AId imported_Original_LF__DOT__Imp_LF_Imp_AId Original_LF__DOT__Imp_LF_Imp_AId_iso := {}.
