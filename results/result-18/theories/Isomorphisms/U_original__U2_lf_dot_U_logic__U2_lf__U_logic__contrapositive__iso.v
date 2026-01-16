From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_contrapositive : forall x x0 : SProp, (x -> x0) -> (x0 -> imported_False) -> x -> imported_False := Imported.Original_LF__DOT__Logic_LF_Logic_contrapositive.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_contrapositive_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : x1 -> x3) (x6 : x2 -> x4),
  (forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso hx0 (x5 x7) (x6 x8)) ->
  forall (x7 : ~ x3) (x8 : x4 -> imported_False),
  (forall (x9 : x3) (x10 : x4), rel_iso hx0 x9 x10 -> rel_iso False_iso (x7 x9) (x8 x10)) ->
  forall (x9 : x1) (x10 : x2),
  rel_iso hx x9 x10 -> rel_iso False_iso (Original.LF_DOT_Logic.LF.Logic.contrapositive x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Logic_LF_Logic_contrapositive x6 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.contrapositive := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_contrapositive := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.contrapositive Original_LF__DOT__Logic_LF_Logic_contrapositive_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.contrapositive Imported.Original_LF__DOT__Logic_LF_Logic_contrapositive Original_LF__DOT__Logic_LF_Logic_contrapositive_iso := {}.