From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__sinstr__iso Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_SLoad : imported_String_string -> imported_Original_LF__DOT__Imp_LF_Imp_sinstr := Imported.Original_LF__DOT__Imp_LF_Imp_SLoad.
Instance Original_LF__DOT__Imp_LF_Imp_SLoad_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 -> rel_iso Original_LF__DOT__Imp_LF_Imp_sinstr_iso (Original.LF_DOT_Imp.LF.Imp.SLoad x1) (imported_Original_LF__DOT__Imp_LF_Imp_SLoad x2).
Proof.
  intros x1 x2 Hrel.
  
  unfold imported_Original_LF__DOT__Imp_LF_Imp_SLoad.
  simpl.
  apply (IsoEq.f_equal Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SLoad).
  exact Hrel.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.SLoad := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_SLoad := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.SLoad Original_LF__DOT__Imp_LF_Imp_SLoad_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.SLoad Imported.Original_LF__DOT__Imp_LF_Imp_SLoad Original_LF__DOT__Imp_LF_Imp_SLoad_iso := {}.