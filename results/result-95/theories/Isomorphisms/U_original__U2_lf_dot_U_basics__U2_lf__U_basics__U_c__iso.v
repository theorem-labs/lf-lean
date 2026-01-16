From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_C : imported_Original_LF__DOT__Basics_LF_Basics_letter := Imported.Original_LF__DOT__Basics_LF_Basics_letter_C.
Instance Original_LF__DOT__Basics_LF_Basics_C_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_letter_iso Original.LF_DOT_Basics.LF.Basics.C imported_Original_LF__DOT__Basics_LF_Basics_C.
Proof.
  constructor. unfold imported_Original_LF__DOT__Basics_LF_Basics_C.
  simpl. apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.C := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_letter_C := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.C Original_LF__DOT__Basics_LF_Basics_C_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.C Imported.Original_LF__DOT__Basics_LF_Basics_letter_C Original_LF__DOT__Basics_LF_Basics_C_iso := {}.
