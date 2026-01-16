From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. (* removed *) *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__bin__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_double__bin : imported_Original_LF__DOT__Induction_LF_Induction_bin -> imported_Original_LF__DOT__Induction_LF_Induction_bin := Imported.Original_LF__DOT__Induction_LF_Induction_double__bin.

(* This is an axiom in the original, so the isomorphism itself can be an axiom.
   The allowed axiom is: U_original__U2_lf_dot_U_induction__U2_lf__U_induction__double____bin__iso.Original_LF__DOT__Induction_LF_Induction_double__bin_iso *)

Instance Original_LF__DOT__Induction_LF_Induction_double__bin_iso : forall (x1 : Original.LF_DOT_Induction.LF.Induction.bin) (x2 : imported_Original_LF__DOT__Induction_LF_Induction_bin),
  rel_iso Original_LF__DOT__Induction_LF_Induction_bin_iso x1 x2 ->
  rel_iso Original_LF__DOT__Induction_LF_Induction_bin_iso (Original.LF_DOT_Induction.LF.Induction.double_bin x1) (imported_Original_LF__DOT__Induction_LF_Induction_double__bin x2).
Admitted.

Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.double_bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_double__bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.double_bin Original_LF__DOT__Induction_LF_Induction_double__bin_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.double_bin Imported.Original_LF__DOT__Induction_LF_Induction_double__bin Original_LF__DOT__Induction_LF_Induction_double__bin_iso := {}.