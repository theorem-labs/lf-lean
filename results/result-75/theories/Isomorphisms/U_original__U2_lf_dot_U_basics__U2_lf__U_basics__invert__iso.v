From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bw__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_invert : imported_Original_LF__DOT__Basics_LF_Basics_bw -> imported_Original_LF__DOT__Basics_LF_Basics_bw := Imported.Original_LF__DOT__Basics_LF_Basics_invert.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_invert_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bw) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bw),
  rel_iso Original_LF__DOT__Basics_LF_Basics_bw_iso x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_bw_iso (Original.LF_DOT_Basics.LF.Basics.invert x1) (imported_Original_LF__DOT__Basics_LF_Basics_invert x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.invert := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_invert := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.invert Original_LF__DOT__Basics_LF_Basics_invert_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.invert Imported.Original_LF__DOT__Basics_LF_Basics_invert Original_LF__DOT__Basics_LF_Basics_invert_iso := {}.