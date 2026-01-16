From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso.

(* The imported version uses Prop_eq which is isomorphic to Corelib_Init_Logic_eq_Prop *)
Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance : SProp := 
  forall (a' : SProp) (a'0 a'1 : a'), imported_Corelib_Init_Logic_eq_Prop a'0 a'1.

(* Since proof_irrelevance is Admitted in Original, we can use an axiom for the isomorphism *)
Axiom Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance_iso : 
  Iso Original.LF_DOT_ProofObjects.LF.ProofObjects.proof_irrelevance 
      imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance.

#[export] Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance_iso_inst :
  Iso Original.LF_DOT_ProofObjects.LF.ProofObjects.proof_irrelevance 
      imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance
  := Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance_iso.

Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.proof_irrelevance := {}. 
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance := {}. 
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.proof_irrelevance Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.proof_irrelevance Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance_iso := {}.
