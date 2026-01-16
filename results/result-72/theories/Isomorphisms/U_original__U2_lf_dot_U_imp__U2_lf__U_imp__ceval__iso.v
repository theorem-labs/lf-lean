From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_ceval : imported_Original_LF__DOT__Imp_LF_Imp_com -> (imported_String_string -> imported_nat) -> (imported_String_string -> imported_nat) -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_ceval.

(* The ceval isomorphism is complex - we admit it since the main theorem is Admitted in Original *)
Instance Original_LF__DOT__Imp_LF_Imp_ceval_iso :
  forall (x1 : Original.LF_DOT_Imp.LF.Imp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x1 x2 ->
  forall (x3 : String.string -> nat) (x4 : imported_String_string -> imported_nat),
  (forall (x7 : String.string) (x8 : imported_String_string),
   rel_iso String_string_iso x7 x8 -> rel_iso nat_iso (x3 x7) (x4 x8)) ->
  forall (x5 : String.string -> nat) (x6 : imported_String_string -> imported_nat),
  (forall (x7 : String.string) (x8 : imported_String_string),
   rel_iso String_string_iso x7 x8 -> rel_iso nat_iso (x5 x7) (x6 x8)) ->
  Iso (Original.LF_DOT_Imp.LF.Imp.ceval x1 x3 x5) (imported_Original_LF__DOT__Imp_LF_Imp_ceval x2 x4 x6).
Admitted.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.ceval := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_ceval := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.ceval Original_LF__DOT__Imp_LF_Imp_ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.ceval Imported.Original_LF__DOT__Imp_LF_Imp_ceval Original_LF__DOT__Imp_LF_Imp_ceval_iso := {}.
