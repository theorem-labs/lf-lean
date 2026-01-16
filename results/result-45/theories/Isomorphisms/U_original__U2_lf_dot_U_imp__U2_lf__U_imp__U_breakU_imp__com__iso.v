From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original ImportedNames.
Typeclasses Opaque rel_iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com : Type :=
  ImportedNames.imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com.

Axiom com_bridge : Original.LF_DOT_Imp.LF.Imp.BreakImp.com = imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com.

Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso
  : Iso Original.LF_DOT_Imp.LF.Imp.BreakImp.com imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com.
Proof.
  subst imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com.
  subst.
  exact iso_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.com := {}.
Instance: KnownConstant ImportedNames.imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.com Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.com ImportedNames.imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso := {}.
