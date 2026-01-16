From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BTrue : imported_Original_LF__DOT__Imp_LF_Imp_bexp := Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BTrue.
Instance Original_LF__DOT__Imp_LF_Imp_BTrue_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso Original.LF_DOT_Imp.LF.Imp.BTrue imported_Original_LF__DOT__Imp_LF_Imp_BTrue.
Proof.
  unfold rel_iso, imported_Original_LF__DOT__Imp_LF_Imp_BTrue. simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BTrue := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BTrue := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BTrue Original_LF__DOT__Imp_LF_Imp_BTrue_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BTrue Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BTrue Original_LF__DOT__Imp_LF_Imp_BTrue_iso := {}.