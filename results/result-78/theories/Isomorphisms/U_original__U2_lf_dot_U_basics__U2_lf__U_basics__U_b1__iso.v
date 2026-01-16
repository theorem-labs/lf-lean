From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bin__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_B1 : imported_Original_LF__DOT__Basics_LF_Basics_bin -> imported_Original_LF__DOT__Basics_LF_Basics_bin := Imported.Original_LF__DOT__Basics_LF_Basics_B1.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_B1_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bin) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bin),
  rel_iso Original_LF__DOT__Basics_LF_Basics_bin_iso x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_bin_iso (Original.LF_DOT_Basics.LF.Basics.B1 x1) (imported_Original_LF__DOT__Basics_LF_Basics_B1 x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.B1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_B1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.B1 Original_LF__DOT__Basics_LF_Basics_B1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.B1 Imported.Original_LF__DOT__Basics_LF_Basics_B1 Original_LF__DOT__Basics_LF_Basics_B1_iso := {}.