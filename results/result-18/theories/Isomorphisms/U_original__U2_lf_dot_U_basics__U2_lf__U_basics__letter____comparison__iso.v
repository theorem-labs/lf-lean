From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__comparison__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_letter__comparison : imported_Original_LF__DOT__Basics_LF_Basics_letter -> imported_Original_LF__DOT__Basics_LF_Basics_letter -> imported_Original_LF__DOT__Basics_LF_Basics_comparison := Imported.Original_LF__DOT__Basics_LF_Basics_letter__comparison.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_letter__comparison_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.letter) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_letter),
  rel_iso Original_LF__DOT__Basics_LF_Basics_letter_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Basics.LF.Basics.letter) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_letter),
  rel_iso Original_LF__DOT__Basics_LF_Basics_letter_iso x3 x4 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_comparison_iso (Original.LF_DOT_Basics.LF.Basics.letter_comparison x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_letter__comparison x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.letter_comparison := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_letter__comparison := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.letter_comparison Original_LF__DOT__Basics_LF_Basics_letter__comparison_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.letter_comparison Imported.Original_LF__DOT__Basics_LF_Basics_letter__comparison Original_LF__DOT__Basics_LF_Basics_letter__comparison_iso := {}.