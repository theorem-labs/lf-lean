From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__com__iso.

Monomorphic Definition imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com -> imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com -> imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com := Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq.
Monomorphic Instance Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq_iso : forall (x1 : Original.LF_DOT_Auto.LF.Auto.Repeat.com) (x2 : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com),
  rel_iso Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Auto.LF.Auto.Repeat.com) (x4 : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com),
  rel_iso Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso x3 x4 ->
  rel_iso Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso (Original.LF_DOT_Auto.LF.Auto.Repeat.CSeq x1 x3) (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.Repeat.CSeq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.Repeat.CSeq Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.Repeat.CSeq Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq_iso := {}.