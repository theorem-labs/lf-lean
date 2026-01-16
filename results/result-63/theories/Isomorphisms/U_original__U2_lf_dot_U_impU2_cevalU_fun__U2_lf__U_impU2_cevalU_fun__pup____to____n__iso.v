From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso.

Definition imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n : imported_Original_LF__DOT__Imp_LF_Imp_com := Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n.
Instance Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.pup_to_n imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n.
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.pup_to_n := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.pup_to_n Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.pup_to_n Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_pup__to__n_iso := {}.