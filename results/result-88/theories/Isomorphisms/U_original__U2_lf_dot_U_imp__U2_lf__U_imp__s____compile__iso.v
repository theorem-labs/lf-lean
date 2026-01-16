From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso *). *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__sinstr__iso Isomorphisms.list__iso.

(* Since s_compile is not in Imported.v, we axiomatize it *)
Axiom imported_Original_LF__DOT__Imp_LF_Imp_s__compile : imported_Original_LF__DOT__Imp_LF_Imp_aexp -> imported_list imported_Original_LF__DOT__Imp_LF_Imp_sinstr.
Instance Original_LF__DOT__Imp_LF_Imp_s__compile_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x1 x2 ->
  rel_iso (list_iso Original_LF__DOT__Imp_LF_Imp_sinstr_iso) (Original.LF_DOT_Imp.LF.Imp.s_compile x1) (imported_Original_LF__DOT__Imp_LF_Imp_s__compile x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.s_compile := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant imported_Original_LF__DOT__Imp_LF_Imp_s__compile := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.s_compile Original_LF__DOT__Imp_LF_Imp_s__compile_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.s_compile imported_Original_LF__DOT__Imp_LF_Imp_s__compile Original_LF__DOT__Imp_LF_Imp_s__compile_iso := {}.