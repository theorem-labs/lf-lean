From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__U_props__U_false__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__falso__quodlibet' : forall x : Type, imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False -> x := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__falso__quodlibet'.
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__falso__quodlibet'_iso : forall (x1 x2 : Type) (hx : IsoOrSortRelaxed x1 x2) (x3 : Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.False) (x4 : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False),
  rel_iso Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False_iso x3 x4 ->
  rel_iso_sort hx (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex_falso_quodlibet' x1 x3) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__falso__quodlibet' x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex_falso_quodlibet' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__falso__quodlibet' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex_falso_quodlibet' Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__falso__quodlibet'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex_falso_quodlibet' Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__falso__quodlibet' Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__falso__quodlibet'_iso := {}.