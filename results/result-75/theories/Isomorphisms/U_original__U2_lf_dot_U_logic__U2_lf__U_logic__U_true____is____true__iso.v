From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_true__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_True__is__true : imported_True := Imported.Original_LF__DOT__Logic_LF_Logic_True__is__true.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_True__is__true_iso : rel_iso True_iso
    Original.LF_DOT_Logic.LF.Logic.True_is_true imported_Original_LF__DOT__Logic_LF_Logic_True__is__true.
Proof.
  constructor. simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.True_is_true := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_True__is__true := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.True_is_true Original_LF__DOT__Logic_LF_Logic_True__is__true_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.True_is_true Imported.Original_LF__DOT__Logic_LF_Logic_True__is__true Original_LF__DOT__Logic_LF_Logic_True__is__true_iso := {}.
