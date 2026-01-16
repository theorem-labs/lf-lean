From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__U_props__U_false__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_false__implies__zero__eq__one : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False -> imported_Corelib_Init_Logic_eq imported_0 (imported_S imported_0) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_false__implies__zero__eq__one.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_false__implies__zero__eq__one_iso : forall (x1 : Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.False) (x2 : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False),
  rel_iso Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_False_iso x1 x2 ->
  rel_iso (Corelib_Init_Logic_eq_iso _0_iso (S_iso _0_iso)) (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.false_implies_zero_eq_one x1)
    (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_false__implies__zero__eq__one x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.false_implies_zero_eq_one := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_false__implies__zero__eq__one := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.false_implies_zero_eq_one Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_false__implies__zero__eq__one_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.false_implies_zero_eq_one Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_false__implies__zero__eq__one Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_false__implies__zero__eq__one_iso := {}.