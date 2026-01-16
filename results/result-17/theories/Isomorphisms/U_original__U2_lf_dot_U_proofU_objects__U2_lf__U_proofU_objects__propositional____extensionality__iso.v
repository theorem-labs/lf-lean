From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality : SProp := 
  forall (P Q : SProp), imported_iff P Q -> imported_Corelib_Init_Logic_eq P Q.

(* Since propositional_extensionality is Admitted in Original, we can use an axiom *)
Axiom Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality_iso :
  Iso Original.LF_DOT_ProofObjects.LF.ProofObjects.propositional_extensionality
      imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality.

#[export] Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality_iso_inst :
  Iso Original.LF_DOT_ProofObjects.LF.ProofObjects.propositional_extensionality
      imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality
  := Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality_iso.

Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.propositional_extensionality := {}.
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality := {}.
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.propositional_extensionality Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.propositional_extensionality Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality_iso := {}.
