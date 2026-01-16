From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_string__string__iso.

Monomorphic Definition imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn : imported_String_string -> imported_Original_LF__DOT__Imp_LF_Imp_aexp -> imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com := Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn.
Monomorphic Instance Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.aexp) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x3 x4 ->
  rel_iso Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso (Original.LF_DOT_Auto.LF.Auto.Repeat.CAsgn x1 x3) (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.Repeat.CAsgn := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.Repeat.CAsgn Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.Repeat.CAsgn Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn_iso := {}.