From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bin__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_incr : imported_Original_LF__DOT__Basics_LF_Basics_bin -> imported_Original_LF__DOT__Basics_LF_Basics_bin := Imported.Original_LF__DOT__Basics_LF_Basics_incr.
Instance Original_LF__DOT__Basics_LF_Basics_incr_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bin) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bin),
  rel_iso Original_LF__DOT__Basics_LF_Basics_bin_iso x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_bin_iso (Original.LF_DOT_Basics.LF.Basics.incr x1) (imported_Original_LF__DOT__Basics_LF_Basics_incr x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.incr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_incr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.incr Original_LF__DOT__Basics_LF_Basics_incr_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.incr Imported.Original_LF__DOT__Basics_LF_Basics_incr Original_LF__DOT__Basics_LF_Basics_incr_iso := {}.