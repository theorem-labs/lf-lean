From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_fact__in__coq : imported_Original_LF__DOT__Imp_LF_Imp_com := Imported.Original_LF__DOT__Imp_LF_Imp_fact__in__coq.

(* rel_iso is just: to a = b, which means com_to_imported fact_in_coq = imported_fact_in_coq *)
Instance Original_LF__DOT__Imp_LF_Imp_fact__in__coq_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso Original.LF_DOT_Imp.LF.Imp.fact_in_coq imported_Original_LF__DOT__Imp_LF_Imp_fact__in__coq.
Proof.
  constructor. simpl.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_fact__in__coq.
  unfold Original.LF_DOT_Imp.LF.Imp.fact_in_coq.
  simpl.
  simpl com_to_imported.
  (* Now we need to prove the conversion matches *)
  reflexivity.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.fact_in_coq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_fact__in__coq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.fact_in_coq Original_LF__DOT__Imp_LF_Imp_fact__in__coq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.fact_in_coq Imported.Original_LF__DOT__Imp_LF_Imp_fact__in__coq Original_LF__DOT__Imp_LF_Imp_fact__in__coq_iso := {}.