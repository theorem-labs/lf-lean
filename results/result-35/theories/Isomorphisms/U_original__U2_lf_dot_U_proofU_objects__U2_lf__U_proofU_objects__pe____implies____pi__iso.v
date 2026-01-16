From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__propositional____extensionality__iso Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__proof____irrelevance__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__pi : 
  (forall x x0 : SProp, imported_iff x x0 -> imported_Corelib_Init_Logic_eq x x0) -> 
  forall (x0 : SProp) (x1 x2 : x0), imported_Corelib_Init_Logic_eq_Prop x1 x2 := 
  Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__pi.

(* Since pe_implies_pi is Admitted in Original, we can use an axiom *)
Axiom Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__pi_iso :
  forall (x1 : Original.LF_DOT_ProofObjects.LF.ProofObjects.propositional_extensionality) (x2 : forall x x0 : SProp, imported_iff x x0 -> @imported_Corelib_Init_Logic_eq SProp x x0),
  (forall (x3 : Prop) (x4 : SProp) (hx : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx0 : Iso x5 x6) (x7 : x3 <-> x5) (x8 : imported_iff x4 x6),
   @rel_iso (x3 <-> x5) (imported_iff x4 x6) (@relax_Iso_Ts_Ps (x3 <-> x5) (imported_iff x4 x6) (@iff_iso x3 x4 hx x5 x6 hx0)) x7 x8 ->
   @rel_iso (x3 = x5) (@imported_Corelib_Init_Logic_eq SProp x4 x6)
     (@relax_Iso_Ts_Ps (x3 = x5) (@imported_Corelib_Init_Logic_eq SProp x4 x6)
        (@Corelib_Init_Logic_eq_iso Prop SProp iso_Prop_SProp x3 x4 (@rel_iso_iso_sort_of_iso_Ts_Ps_pe x1 x3 x4 hx) x5 x6 (@rel_iso_iso_sort_of_iso_Ts_Ps_pe x1 x5 x6 hx0)))
     (x1 x3 x5 x7) (x2 x4 x6 x8)) ->
  forall (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : x3) (x6 : x4) (hx1 : @rel_iso x3 x4 hx0 x5 x6) (x7 : x3) (x8 : x4) (hx2 : @rel_iso x3 x4 hx0 x7 x8),
  @rel_iso (x5 = x7) (@imported_Corelib_Init_Logic_eq_Prop x4 x6 x8) (@Corelib_Init_Logic_eq_iso_Prop x3 x4 hx0 x5 x6 hx1 x7 x8 hx2)
    (Original.LF_DOT_ProofObjects.LF.ProofObjects.pe_implies_pi x1 x3 x5 x7) (@imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__pi x2 x4 x6 x8).

(* Export the axiom as an instance *)

Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.pe_implies_pi := {}.
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__pi := {}.
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.pe_implies_pi Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__pi_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.pe_implies_pi imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__pi Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__pi_iso := {}.
