From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BEq : imported_Original_LF__DOT__Imp_LF_Imp_aexp -> imported_Original_LF__DOT__Imp_LF_Imp_aexp -> imported_Original_LF__DOT__Imp_LF_Imp_bexp := Imported.Original_LF__DOT__Imp_LF_Imp_BEq.
Instance Original_LF__DOT__Imp_LF_Imp_BEq_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.aexp) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x3 x4 -> rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso (Original.LF_DOT_Imp.LF.Imp.BEq x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_BEq x2 x4).
Proof.
  intros x1 x2 H1 x3 x4 H3.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_BEq.
  constructor. simpl.
  apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BEq (proj_rel_iso H1) (proj_rel_iso H3)).
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BEq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BEq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BEq Original_LF__DOT__Imp_LF_Imp_BEq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BEq Imported.Original_LF__DOT__Imp_LF_Imp_BEq Original_LF__DOT__Imp_LF_Imp_BEq_iso := {}.