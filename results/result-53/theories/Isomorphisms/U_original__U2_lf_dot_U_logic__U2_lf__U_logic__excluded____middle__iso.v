From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso Isomorphisms.or__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_excluded__middle : SProp := forall a' : SProp, imported_or a' (a' -> imported_False).
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_excluded__middle_iso : Iso Original.LF_DOT_Logic.LF.Logic.excluded_middle imported_Original_LF__DOT__Logic_LF_Logic_excluded__middle
  := IsoForall (fun a : Prop => a \/ ~ a) (fun x2 : SProp => imported_or x2 (x2 -> imported_False))
    (fun (x1 : Prop) (x2 : SProp) (hx : rel_iso iso_Prop_SProp x1 x2) =>
     relax_Iso_Ts_Ps (or_iso (iso_of_rel_iso_iso_sort_PropSProp_T hx) (IsoArrow (iso_of_rel_iso_iso_sort_PropSProp_T hx) False_iso))).

Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.excluded_middle := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_excluded__middle := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.excluded_middle Original_LF__DOT__Logic_LF_Logic_excluded__middle_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.excluded_middle Imported.Original_LF__DOT__Logic_LF_Logic_excluded__middle Original_LF__DOT__Logic_LF_Logic_excluded__middle_iso := {}.