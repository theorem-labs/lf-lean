From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance : SProp := forall (a' : SProp) (a'0 a'1 : a'), imported_Corelib_Init_Logic_eq_Prop a'0 a'1.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance_iso : Iso Original.LF_DOT_ProofObjects.LF.ProofObjects.proof_irrelevance imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance
  := IsoForall (fun a : Prop => forall pf1 pf2 : a, pf1 = pf2) (fun x2 : SProp => forall a' a'0 : x2, imported_Corelib_Init_Logic_eq_Prop a' a'0)
    (fun (x1 : Prop) (x2 : SProp) (hx : rel_iso iso_Prop_SProp x1 x2) =>
     IsoForall (fun a : x1 => forall pf2 : x1, a = pf2) (fun x4 : x2 => forall a' : x2, imported_Corelib_Init_Logic_eq_Prop x4 a')
       (fun (x3 : x1) (x4 : x2) (hx0 : rel_iso (iso_of_rel_iso_iso_sort_PropSProp_T hx) x3 x4) =>
        IsoForall (Corelib.Init.Logic.eq x3) (fun x6 : x2 => imported_Corelib_Init_Logic_eq_Prop x4 x6)
          (fun (x5 : x1) (x6 : x2) (hx1 : rel_iso (iso_of_rel_iso_iso_sort_PropSProp_T hx) x5 x6) => Corelib_Init_Logic_eq_iso_Prop hx0 hx1))).

Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.proof_irrelevance := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.proof_irrelevance Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.proof_irrelevance Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance Original_LF__DOT__ProofObjects_LF_ProofObjects_proof__irrelevance_iso := {}.