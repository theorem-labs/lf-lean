From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__grade__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__modifier__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_Grade : imported_Original_LF__DOT__Basics_LF_Basics_letter -> imported_Original_LF__DOT__Basics_LF_Basics_modifier -> imported_Original_LF__DOT__Basics_LF_Basics_grade := Imported.Original_LF__DOT__Basics_LF_Basics_Grade.
Instance Original_LF__DOT__Basics_LF_Basics_Grade_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.letter) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_letter),
  rel_iso Original_LF__DOT__Basics_LF_Basics_letter_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Basics.LF.Basics.modifier) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_modifier),
  rel_iso Original_LF__DOT__Basics_LF_Basics_modifier_iso x3 x4 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso (Original.LF_DOT_Basics.LF.Basics.Grade x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_Grade x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.Grade := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_Grade := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.Grade Original_LF__DOT__Basics_LF_Basics_Grade_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.Grade Imported.Original_LF__DOT__Basics_LF_Basics_Grade Original_LF__DOT__Basics_LF_Basics_Grade_iso := {}.