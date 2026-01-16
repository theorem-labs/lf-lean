From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BNot : imported_Original_LF__DOT__Imp_LF_Imp_bexp -> imported_Original_LF__DOT__Imp_LF_Imp_bexp := Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNot.
Instance Original_LF__DOT__Imp_LF_Imp_BNot_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.bexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_bexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso x1 x2 -> rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso (Original.LF_DOT_Imp.LF.Imp.BNot x1) (imported_Original_LF__DOT__Imp_LF_Imp_BNot x2).
Proof.
  intros x1 x2 H1.
  idtac.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_BNot.
  constructor. simpl.
  apply (f_equal Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNot (proj_rel_iso H1)).
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BNot := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BNot := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BNot Original_LF__DOT__Imp_LF_Imp_BNot_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BNot Imported.Original_LF__DOT__Imp_LF_Imp_BNot Original_LF__DOT__Imp_LF_Imp_BNot_iso := {}.