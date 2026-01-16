From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_iff__trans : forall x x0 x1 : SProp, imported_iff x x0 -> imported_iff x0 x1 -> imported_iff x x1 := Imported.Original_LF__DOT__Logic_LF_Logic_iff__trans.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_iff__trans_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : x1 <-> x3) (x8 : imported_iff x2 x4),
  rel_iso (iff_iso hx hx0) x7 x8 ->
  forall (x9 : x3 <-> x5) (x10 : imported_iff x4 x6),
  rel_iso (iff_iso hx0 hx1) x9 x10 -> rel_iso (iff_iso hx hx1) (Original.LF_DOT_Logic.LF.Logic.iff_trans x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Logic_LF_Logic_iff__trans x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.iff_trans := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_iff__trans := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.iff_trans Original_LF__DOT__Logic_LF_Logic_iff__trans_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.iff_trans Imported.Original_LF__DOT__Logic_LF_Logic_iff__trans Original_LF__DOT__Logic_LF_Logic_iff__trans_iso := {}.