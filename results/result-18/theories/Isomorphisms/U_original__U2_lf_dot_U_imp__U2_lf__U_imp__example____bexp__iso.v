From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_example__bexp : imported_Original_LF__DOT__Imp_LF_Imp_bexp := Imported.Original_LF__DOT__Imp_LF_Imp_example__bexp.

Instance Original_LF__DOT__Imp_LF_Imp_example__bexp_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso Original.LF_DOT_Imp.LF.Imp.example_bexp imported_Original_LF__DOT__Imp_LF_Imp_example__bexp.
Proof.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_example__bexp.
  unfold Original.LF_DOT_Imp.LF.Imp.example_bexp.
  constructor. simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.example_bexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_example__bexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.example_bexp Original_LF__DOT__Imp_LF_Imp_example__bexp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.example_bexp Imported.Original_LF__DOT__Imp_LF_Imp_example__bexp Original_LF__DOT__Imp_LF_Imp_example__bexp_iso := {}.