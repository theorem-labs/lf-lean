From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_iff__refl : forall x : SProp, imported_iff x x := Imported.Original_LF__DOT__Logic_LF_Logic_iff__refl.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_iff__refl_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2), rel_iso (iff_iso hx hx) (Original.LF_DOT_Logic.LF.Logic.iff_refl x1) (imported_Original_LF__DOT__Logic_LF_Logic_iff__refl x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.iff_refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_iff__refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.iff_refl Original_LF__DOT__Logic_LF_Logic_iff__refl_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.iff_refl Imported.Original_LF__DOT__Logic_LF_Logic_iff__refl Original_LF__DOT__Logic_LF_Logic_iff__refl_iso := {}.