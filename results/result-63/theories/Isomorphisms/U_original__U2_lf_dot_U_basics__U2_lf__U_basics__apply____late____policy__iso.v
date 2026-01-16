From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__grade__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_apply__late__policy : imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_grade -> imported_Original_LF__DOT__Basics_LF_Basics_grade := Imported.Original_LF__DOT__Basics_LF_Basics_apply__late__policy.
Instance Original_LF__DOT__Basics_LF_Basics_apply__late__policy_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Basics.LF.Basics.grade) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_grade),
  rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso x3 x4 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso (Original.LF_DOT_Basics.LF.Basics.apply_late_policy x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_apply__late__policy x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.apply_late_policy := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_apply__late__policy := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.apply_late_policy Original_LF__DOT__Basics_LF_Basics_apply__late__policy_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.apply_late_policy Imported.Original_LF__DOT__Basics_LF_Basics_apply__late__policy Original_LF__DOT__Basics_LF_Basics_apply__late__policy_iso := {}.