From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__sinstr__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso Isomorphisms.list__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_s__execute : (imported_String_string -> imported_nat) -> imported_list imported_nat -> imported_list imported_Original_LF__DOT__Imp_LF_Imp_sinstr -> imported_list imported_nat := Imported.Original_LF__DOT__Imp_LF_Imp_s__execute.
Instance Original_LF__DOT__Imp_LF_Imp_s__execute_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat),
  (forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) ->
  forall (x3 : list nat) (x4 : imported_list imported_nat),
  rel_iso (list_iso nat_iso) x3 x4 ->
  forall (x5 : list Original.LF_DOT_Imp.LF.Imp.sinstr) (x6 : imported_list imported_Original_LF__DOT__Imp_LF_Imp_sinstr),
  rel_iso (list_iso Original_LF__DOT__Imp_LF_Imp_sinstr_iso) x5 x6 ->
  rel_iso (list_iso nat_iso) (Original.LF_DOT_Imp.LF.Imp.s_execute x1 x3 x5) (imported_Original_LF__DOT__Imp_LF_Imp_s__execute x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.s_execute := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_s__execute := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.s_execute Original_LF__DOT__Imp_LF_Imp_s__execute_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.s_execute Imported.Original_LF__DOT__Imp_LF_Imp_s__execute Original_LF__DOT__Imp_LF_Imp_s__execute_iso := {}.