From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.

Notation imported_Original_LF__DOT__Imp_LF_Imp_AMult := Imported.AMult.
Instance Original_LF__DOT__Imp_LF_Imp_AMult_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.aexp) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x3 x4 -> rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso (Original.LF_DOT_Imp.LF.Imp.AMult x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_AMult x2 x4).
Proof.
  intros x1 x2 H1 x3 x4 H2.
  destruct H as [H]. constructor. simpl.
  unfold aexp_to_imported.
  simpl.
  apply f_equal2; assumption.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AMult := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant imported_Original_LF__DOT__Imp_LF_Imp_AMult := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AMult Original_LF__DOT__Imp_LF_Imp_AMult_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AMult imported_Original_LF__DOT__Imp_LF_Imp_AMult Original_LF__DOT__Imp_LF_Imp_AMult_iso := {}.