From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_principles__U2_lf__U_indU_principles__reflect__iso.

Monomorphic Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect__involution : forall (x : Type) (x0 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_t__tree x),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect x0)) x0 := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect__involution.
Monomorphic Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect__involution_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.t_tree x1) (x4 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_t__tree x2)
    (hx0 : rel_iso (Original_LF__DOT__IndPrinciples_LF_IndPrinciples_t__tree_iso hx) x3 x4),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect_iso (Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect_iso hx0)) hx0)
    (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.reflect_involution x1 x3) (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect__involution x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.reflect_involution := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect__involution := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.reflect_involution Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect__involution_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.reflect_involution Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect__involution Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect__involution_iso := {}.