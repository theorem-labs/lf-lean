From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_not__implies__our__not : forall x : SProp, (x -> imported_False) -> forall x1 : SProp, x -> x1 := Imported.Original_LF__DOT__Logic_LF_Logic_not__implies__our__not.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_not__implies__our__not_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : ~ x1) (x4 : x2 -> imported_False),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso False_iso (x3 x5) (x4 x6)) ->
  forall (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : x1) (x8 : x2),
  rel_iso hx x7 x8 -> rel_iso hx1 (Original.LF_DOT_Logic.LF.Logic.not_implies_our_not x1 x3 x5 x7) (imported_Original_LF__DOT__Logic_LF_Logic_not__implies__our__not x4 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.not_implies_our_not := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_not__implies__our__not := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.not_implies_our_not Original_LF__DOT__Logic_LF_Logic_not__implies__our__not_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.not_implies_our_not Imported.Original_LF__DOT__Logic_LF_Logic_not__implies__our__not Original_LF__DOT__Logic_LF_Logic_not__implies__our__not_iso := {}.