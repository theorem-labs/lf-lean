From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_double__neg : forall x : SProp, x -> (x -> imported_False) -> imported_False := Imported.Original_LF__DOT__Logic_LF_Logic_double__neg.
Instance Original_LF__DOT__Logic_LF_Logic_double__neg_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 ->
  forall (x5 : x1 -> False) (x6 : x2 -> imported_False),
  (forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso False_iso (x5 x7) (x6 x8)) ->
  rel_iso False_iso (Original.LF_DOT_Logic.LF.Logic.double_neg x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_double__neg x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.double_neg := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_double__neg := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.double_neg Original_LF__DOT__Logic_LF_Logic_double__neg_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.double_neg Imported.Original_LF__DOT__Logic_LF_Logic_double__neg Original_LF__DOT__Logic_LF_Logic_double__neg_iso := {}.