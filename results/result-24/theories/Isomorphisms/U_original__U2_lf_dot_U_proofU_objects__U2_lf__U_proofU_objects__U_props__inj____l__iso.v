From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__U_props__or__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_inj__l : forall x x0 : SProp, x -> imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or x x0 := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_inj__l.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_inj__l_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : x1) (x6 : x2),
  rel_iso hx x5 x6 ->
  rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or_iso hx hx0) (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.inj_l x1 x3 x5)
    (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_inj__l x4 x6).
Proof.
  intros x1 x2 hx x3 x4 hx0 x5 x6 H56.
  unfold Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.inj_l.
  unfold imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_inj__l.
  unfold Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_inj__l.
  (* rel_iso (or_iso) (or_introl x5) (or_introl x6) means: 
     to (or_iso) (or_introl x5) = or_introl x6
     i.e., or_to (or_introl x5) = or_introl x6
     i.e., Imported.or_introl (to hx x5) = or_introl x6
     This follows from H56: to hx x5 = x6 *)
  cbv beta.
  (* The goal is eq (or_to (or_introl x5)) (or_introl x6) where or_to is the to function *)
  (* Use the fact that or_to is defined to map or_introl p to Imported.or_introl (to hx p) *)
  exact (IsoEq.f_equal (Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or_or_introl x2 x4) H56).
Defined.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.inj_l := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_inj__l := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.inj_l Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_inj__l_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.inj_l Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_inj__l Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_inj__l_iso := {}.