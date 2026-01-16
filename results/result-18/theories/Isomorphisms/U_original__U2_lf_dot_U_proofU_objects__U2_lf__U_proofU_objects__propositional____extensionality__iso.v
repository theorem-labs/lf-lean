From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality : SProp := forall a' a'0 : SProp, imported_iff a' a'0 -> imported_Corelib_Init_Logic_eq a' a'0.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality_iso : Iso Original.LF_DOT_ProofObjects.LF.ProofObjects.propositional_extensionality imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality
  := IsoForall (fun a : Prop => forall Q : Prop, a <-> Q -> a = Q) (fun x2 : SProp => forall a' : SProp, imported_iff x2 a' -> imported_Corelib_Init_Logic_eq x2 a')
    (fun (x1 : Prop) (x2 : SProp) (hx : rel_iso iso_Prop_SProp x1 x2) =>
     IsoForall (fun a : Prop => x1 <-> a -> x1 = a) (fun x4 : SProp => imported_iff x2 x4 -> imported_Corelib_Init_Logic_eq x2 x4)
       (fun (x3 : Prop) (x4 : SProp) (hx0 : rel_iso iso_Prop_SProp x3 x4) =>
        IsoArrow (iff_iso (iso_of_rel_iso_iso_sort_PropSProp_T hx) (iso_of_rel_iso_iso_sort_PropSProp_T hx0)) (relax_Iso_Ts_Ps (Corelib_Init_Logic_eq_iso hx hx0)))).

Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.propositional_extensionality := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.propositional_extensionality Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.propositional_extensionality Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality Original_LF__DOT__ProofObjects_LF_ProofObjects_propositional__extensionality_iso := {}.