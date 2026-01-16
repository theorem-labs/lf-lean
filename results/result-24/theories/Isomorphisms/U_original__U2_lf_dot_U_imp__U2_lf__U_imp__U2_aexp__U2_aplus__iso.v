From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_APlus : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp -> imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp -> imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_APlus.
Instance Original_LF__DOT__Imp_LF_Imp_AExp_APlus_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.AExp.aexp) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso x3 x4 ->
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso (Original.LF_DOT_Imp.LF.Imp.AExp.APlus x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_APlus x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  simpl in *.
  simpl.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_AExp_APlus, Imported.Original_LF__DOT__Imp_LF_Imp_AExp_APlus.
  apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_APlus H12 H34).
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.APlus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_APlus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.APlus Original_LF__DOT__Imp_LF_Imp_AExp_APlus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.APlus Imported.Original_LF__DOT__Imp_LF_Imp_AExp_APlus Original_LF__DOT__Imp_LF_Imp_AExp_APlus_iso := {}.