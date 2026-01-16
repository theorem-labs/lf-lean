From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__propositional____extensionality__iso Isomorphisms.U_type__iso Isomorphisms.or__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__or__eq : (forall x x0 : SProp, imported_iff x x0 -> imported_Corelib_Init_Logic_eq x x0) -> forall x0 x1 : SProp, imported_Corelib_Init_Logic_eq (imported_or x0 x1) (imported_or x1 x0) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__or__eq.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__or__eq_iso : forall (x1 : Original.LF_DOT_ProofObjects.LF.ProofObjects.propositional_extensionality) (x2 : forall x x0 : SProp, imported_iff x x0 -> @imported_Corelib_Init_Logic_eq SProp x x0),
  (forall (x3 : Prop) (x4 : SProp) (hx : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx0 : Iso x5 x6) (x7 : x3 <-> x5) (x8 : imported_iff x4 x6),
   @rel_iso (x3 <-> x5) (imported_iff x4 x6) (@relax_Iso_Ts_Ps (x3 <-> x5) (imported_iff x4 x6) (@iff_iso x3 x4 hx x5 x6 hx0)) x7 x8 ->
   @rel_iso (x3 = x5) (@imported_Corelib_Init_Logic_eq SProp x4 x6)
     (@relax_Iso_Ts_Ps (x3 = x5) (@imported_Corelib_Init_Logic_eq SProp x4 x6)
        (@Corelib_Init_Logic_eq_iso Prop SProp iso_Prop_SProp x3 x4 (@rel_iso_iso_sort_of_iso_Ts_Ps_pe x1 x3 x4 hx) x5 x6 (@rel_iso_iso_sort_of_iso_Ts_Ps_pe x1 x5 x6 hx0)))
     (x1 x3 x5 x7) (x2 x4 x6 x8)) ->
  forall (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6),
  @rel_iso ((x3 \/ x5) = (x5 \/ x3)) (@imported_Corelib_Init_Logic_eq SProp (imported_or x4 x6) (imported_or x6 x4))
    (@relax_Iso_Ts_Ps ((x3 \/ x5) = (x5 \/ x3)) (@imported_Corelib_Init_Logic_eq SProp (imported_or x4 x6) (imported_or x6 x4))
       (@Corelib_Init_Logic_eq_iso Prop SProp iso_Prop_SProp (x3 \/ x5) (imported_or x4 x6) (@rel_iso_iso_sort_of_iso_Ts_Ps_pe x1 (x3 \/ x5) (imported_or x4 x6) (@or_iso x3 x4 hx0 x5 x6 hx1))
          (x5 \/ x3) (imported_or x6 x4) (@rel_iso_iso_sort_of_iso_Ts_Ps_pe x1 (x5 \/ x3) (imported_or x6 x4) (@or_iso x5 x6 hx1 x3 x4 hx0))))
    (Original.LF_DOT_ProofObjects.LF.ProofObjects.pe_implies_or_eq x1 x3 x5) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__or__eq x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.pe_implies_or_eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__or__eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.pe_implies_or_eq Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__or__eq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.pe_implies_or_eq Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__or__eq Original_LF__DOT__ProofObjects_LF_ProofObjects_pe__implies__or__eq_iso := {}.