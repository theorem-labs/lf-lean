From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.or__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_or__intro__l : forall x x0 : SProp, x -> imported_or x x0 := Imported.Original_LF__DOT__Logic_LF_Logic_or__intro__l.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_or__intro__l_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : x1) (x6 : x2),
  rel_iso hx x5 x6 -> rel_iso (or_iso hx hx0) (Original.LF_DOT_Logic.LF.Logic.or_intro_l x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_or__intro__l x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.or_intro_l := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_or__intro__l := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.or_intro_l Original_LF__DOT__Logic_LF_Logic_or__intro__l_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.or_intro_l Imported.Original_LF__DOT__Logic_LF_Logic_or__intro__l Original_LF__DOT__Logic_LF_Logic_or__intro__l_iso := {}.