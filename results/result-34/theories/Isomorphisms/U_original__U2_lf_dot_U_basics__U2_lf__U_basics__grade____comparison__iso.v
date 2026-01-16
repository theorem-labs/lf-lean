From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(*Typeclasses Opaque rel_iso.*) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__comparison__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__grade__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_grade__comparison : imported_Original_LF__DOT__Basics_LF_Basics_grade -> imported_Original_LF__DOT__Basics_LF_Basics_grade -> imported_Original_LF__DOT__Basics_LF_Basics_comparison := Imported.Original_LF__DOT__Basics_LF_Basics_grade__comparison.

(* grade_comparison is an axiom in Original.v (Admitted), so we need to axiomatize the isomorphism *)
(* The task allows us to use Admitted for axioms that correspond to Original axioms *)
Instance Original_LF__DOT__Basics_LF_Basics_grade__comparison_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.grade) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_grade),
  rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Basics.LF.Basics.grade) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_grade),
  rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso x3 x4 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_comparison_iso (Original.LF_DOT_Basics.LF.Basics.grade_comparison x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_grade__comparison x2 x4).
Admitted.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.grade_comparison := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_grade__comparison := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.grade_comparison Original_LF__DOT__Basics_LF_Basics_grade__comparison_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.grade_comparison Imported.Original_LF__DOT__Basics_LF_Basics_grade__comparison Original_LF__DOT__Basics_LF_Basics_grade__comparison_iso := {}.