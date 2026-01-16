From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__day__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_next__working__day : imported_Original_LF__DOT__Basics_LF_Basics_day -> imported_Original_LF__DOT__Basics_LF_Basics_day := Imported.Original_LF__DOT__Basics_LF_Basics_next__working__day.
Instance Original_LF__DOT__Basics_LF_Basics_next__working__day_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.day) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_day),
  rel_iso Original_LF__DOT__Basics_LF_Basics_day_iso x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_day_iso (Original.LF_DOT_Basics.LF.Basics.next_working_day x1) (imported_Original_LF__DOT__Basics_LF_Basics_next__working__day x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.next_working_day := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_next__working__day := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.next_working_day Original_LF__DOT__Basics_LF_Basics_next__working__day_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.next_working_day Imported.Original_LF__DOT__Basics_LF_Basics_next__working__day Original_LF__DOT__Basics_LF_Basics_next__working__day_iso := {}.