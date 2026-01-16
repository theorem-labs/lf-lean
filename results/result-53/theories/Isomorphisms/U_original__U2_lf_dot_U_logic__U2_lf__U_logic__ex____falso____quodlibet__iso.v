From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U_false__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_ex__falso__quodlibet : forall x : SProp, imported_Original_False -> x := Imported.Original_LF__DOT__Logic_LF_Logic_ex__falso__quodlibet.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_ex__falso__quodlibet_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Original.False) (x4 : imported_Original_False),
  rel_iso Original_False_iso x3 x4 -> rel_iso hx (Original.LF_DOT_Logic.LF.Logic.ex_falso_quodlibet x1 x3) (imported_Original_LF__DOT__Logic_LF_Logic_ex__falso__quodlibet x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.ex_falso_quodlibet := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_ex__falso__quodlibet := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.ex_falso_quodlibet Original_LF__DOT__Logic_LF_Logic_ex__falso__quodlibet_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.ex_falso_quodlibet Imported.Original_LF__DOT__Logic_LF_Logic_ex__falso__quodlibet Original_LF__DOT__Logic_LF_Logic_ex__falso__quodlibet_iso := {}.