From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_CSkip : imported_Original_LF__DOT__Imp_LF_Imp_com := Imported.Original_LF__DOT__Imp_LF_Imp_CSkip.
Instance Original_LF__DOT__Imp_LF_Imp_CSkip_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso Original.LF_DOT_Imp.LF.Imp.CSkip imported_Original_LF__DOT__Imp_LF_Imp_CSkip.
Proof. constructor. simpl. simpl. apply IsomorphismDefinitions.eq_refl. Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.CSkip := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_CSkip := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.CSkip Original_LF__DOT__Imp_LF_Imp_CSkip_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.CSkip Imported.Original_LF__DOT__Imp_LF_Imp_CSkip Original_LF__DOT__Imp_LF_Imp_CSkip_iso := {}.