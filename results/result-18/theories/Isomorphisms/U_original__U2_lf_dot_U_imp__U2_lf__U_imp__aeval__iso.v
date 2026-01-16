From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso.

(* Since aeval is not admitted in Original.v, we need to axiomatize it *)
Axiom imported_Original_LF__DOT__Imp_LF_Imp_aeval : (imported_String_string -> imported_nat) -> imported_Original_LF__DOT__Imp_LF_Imp_aexp -> imported_nat.
Instance Original_LF__DOT__Imp_LF_Imp_aeval_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat),
  (forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.aexp) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Imp.LF.Imp.aeval x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_aeval x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.aeval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant imported_Original_LF__DOT__Imp_LF_Imp_aeval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.aeval Original_LF__DOT__Imp_LF_Imp_aeval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.aeval imported_Original_LF__DOT__Imp_LF_Imp_aeval Original_LF__DOT__Imp_LF_Imp_aeval_iso := {}.