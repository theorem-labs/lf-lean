From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__comparison__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_Lt : imported_Original_LF__DOT__Basics_LF_Basics_comparison := Imported.Original_LF__DOT__Basics_LF_Basics_comparison_Lt.

Instance Original_LF__DOT__Basics_LF_Basics_Lt_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_comparison_iso Original.LF_DOT_Basics.LF.Basics.Lt imported_Original_LF__DOT__Basics_LF_Basics_Lt.
Proof.
  constructor. unfold imported_Original_LF__DOT__Basics_LF_Basics_Lt.
  simpl. apply IsomorphismDefinitions.eq_refl.
Qed.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.Lt := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_comparison_Lt := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.Lt Original_LF__DOT__Basics_LF_Basics_Lt_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.Lt Imported.Original_LF__DOT__Basics_LF_Basics_comparison_Lt Original_LF__DOT__Basics_LF_Basics_Lt_iso := {}.
