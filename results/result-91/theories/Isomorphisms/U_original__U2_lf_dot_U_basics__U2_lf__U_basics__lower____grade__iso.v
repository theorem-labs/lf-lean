From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__grade__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_lower__grade : imported_Original_LF__DOT__Basics_LF_Basics_grade -> imported_Original_LF__DOT__Basics_LF_Basics_grade := Imported.Original_LF__DOT__Basics_LF_Basics_lower__grade.

(* lower_grade is an axiom in the original, so we use an axiom for this isomorphism as permitted *)
Axiom Original_LF__DOT__Basics_LF_Basics_lower__grade_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.grade) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_grade),
  rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso (Original.LF_DOT_Basics.LF.Basics.lower_grade x1) (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x2).

Instance Original_LF__DOT__Basics_LF_Basics_lower__grade_iso_inst : forall (x1 : Original.LF_DOT_Basics.LF.Basics.grade) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_grade),
  rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso (Original.LF_DOT_Basics.LF.Basics.lower_grade x1) (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x2) := Original_LF__DOT__Basics_LF_Basics_lower__grade_iso.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.lower_grade := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_lower__grade := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.lower_grade Original_LF__DOT__Basics_LF_Basics_lower__grade_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.lower_grade Imported.Original_LF__DOT__Basics_LF_Basics_lower__grade Original_LF__DOT__Basics_LF_Basics_lower__grade_iso := {}.
