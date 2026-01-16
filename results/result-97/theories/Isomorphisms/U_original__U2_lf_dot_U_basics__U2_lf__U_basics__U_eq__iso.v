From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__comparison__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_Eq : imported_Original_LF__DOT__Basics_LF_Basics_comparison := Imported.Original_LF__DOT__Basics_LF_Basics_comparison_Eq.

Instance Original_LF__DOT__Basics_LF_Basics_Eq_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_comparison_iso Original.LF_DOT_Basics.LF.Basics.Eq imported_Original_LF__DOT__Basics_LF_Basics_Eq.
Proof.
  constructor. unfold imported_Original_LF__DOT__Basics_LF_Basics_Eq.
  simpl. apply IsomorphismDefinitions.eq_refl.
Qed.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.Eq := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_comparison_Eq := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.Eq Original_LF__DOT__Basics_LF_Basics_Eq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.Eq Imported.Original_LF__DOT__Basics_LF_Basics_comparison_Eq Original_LF__DOT__Basics_LF_Basics_Eq_iso := {}.
