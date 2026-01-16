From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__sinstr__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_SMult : imported_Original_LF__DOT__Imp_LF_Imp_sinstr := Imported.Original_LF__DOT__Imp_LF_Imp_SMult.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_SMult_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_sinstr_iso Original.LF_DOT_Imp.LF.Imp.SMult imported_Original_LF__DOT__Imp_LF_Imp_SMult.
Proof.
  constructor. simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.SMult := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_SMult := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.SMult Original_LF__DOT__Imp_LF_Imp_SMult_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.SMult Imported.Original_LF__DOT__Imp_LF_Imp_SMult Original_LF__DOT__Imp_LF_Imp_SMult_iso := {}.