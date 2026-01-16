From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bin__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_B0 : imported_Original_LF__DOT__Basics_LF_Basics_bin -> imported_Original_LF__DOT__Basics_LF_Basics_bin := Imported.Original_LF__DOT__Basics_LF_Basics_B0.
Instance Original_LF__DOT__Basics_LF_Basics_B0_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bin) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bin),
  rel_iso Original_LF__DOT__Basics_LF_Basics_bin_iso x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_bin_iso (Original.LF_DOT_Basics.LF.Basics.B0 x1) (imported_Original_LF__DOT__Basics_LF_Basics_B0 x2).
Proof.
  intros x1 x2 H.
  destruct H as [H].
  constructor. simpl.
  apply (IsoEq.f_equal Imported.Original_LF__DOT__Basics_LF_Basics_bin_B0 H).
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.B0 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_B0 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.B0 Original_LF__DOT__Basics_LF_Basics_B0_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.B0 Imported.Original_LF__DOT__Basics_LF_Basics_B0 Original_LF__DOT__Basics_LF_Basics_B0_iso := {}.