From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BLe : imported_Original_LF__DOT__Imp_LF_Imp_aexp -> imported_Original_LF__DOT__Imp_LF_Imp_aexp -> imported_Original_LF__DOT__Imp_LF_Imp_bexp := Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BLe.
Instance Original_LF__DOT__Imp_LF_Imp_BLe_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.aexp) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x3 x4 -> rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso (Original.LF_DOT_Imp.LF.Imp.BLe x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_BLe x2 x4).
Proof.
  intros x1 x2 H1 x3 x4 H2.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_BLe.
  constructor. simpl.
  apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BLe (proj_rel_iso H1) (proj_rel_iso H2)).
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BLe := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BLe := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BLe Original_LF__DOT__Imp_LF_Imp_BLe_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BLe Imported.Original_LF__DOT__Imp_LF_Imp_BLe Original_LF__DOT__Imp_LF_Imp_BLe_iso := {}.