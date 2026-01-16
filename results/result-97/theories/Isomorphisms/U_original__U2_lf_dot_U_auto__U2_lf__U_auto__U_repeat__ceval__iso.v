From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso.

Definition imported_Original_LF__DOT__Auto_LF_Auto_Repeat_ceval : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com -> (imported_String_string -> imported_nat) -> (imported_String_string -> imported_nat) -> SProp := Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval.
Instance Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_iso : forall (x1 : Original.LF_DOT_Auto.LF.Auto.Repeat.com) (x2 : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com),
  rel_iso Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.state) (x4 : imported_String_string -> imported_nat),
  (forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso nat_iso (x3 x5) (x4 x6)) ->
  forall (x5 : Original.LF_DOT_Imp.LF.Imp.state) (x6 : imported_String_string -> imported_nat),
  (forall (x7 : String.string) (x8 : imported_String_string), rel_iso String_string_iso x7 x8 -> rel_iso nat_iso (x5 x7) (x6 x8)) ->
  Iso (Original.LF_DOT_Auto.LF.Auto.Repeat.ceval x1 x3 x5) (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_ceval x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.Repeat.ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.Repeat.ceval Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.Repeat.ceval Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_ceval Original_LF__DOT__Auto_LF_Auto_Repeat_ceval_iso := {}.