From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_iff__sym : forall x x0 : SProp, imported_iff x x0 -> imported_iff x0 x := Imported.Original_LF__DOT__Logic_LF_Logic_iff__sym.
Instance Original_LF__DOT__Logic_LF_Logic_iff__sym_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : x1 <-> x3) (x6 : imported_iff x2 x4),
  rel_iso (iff_iso hx hx0) x5 x6 -> rel_iso (iff_iso hx0 hx) (Original.LF_DOT_Logic.LF.Logic.iff_sym x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_iff__sym x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.iff_sym := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_iff__sym := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.iff_sym Original_LF__DOT__Logic_LF_Logic_iff__sym_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.iff_sym Imported.Original_LF__DOT__Logic_LF_Logic_iff__sym Original_LF__DOT__Logic_LF_Logic_iff__sym_iso := {}.