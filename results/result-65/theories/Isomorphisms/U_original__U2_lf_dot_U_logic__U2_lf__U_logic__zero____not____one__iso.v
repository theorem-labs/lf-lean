From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_zero__not__one : imported_Corelib_Init_Logic_eq imported_0 (imported_S imported_0) -> imported_False := Imported.Original_LF__DOT__Logic_LF_Logic_zero__not__one.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_zero__not__one_iso : forall (x1 : O = 1) (x2 : imported_Corelib_Init_Logic_eq imported_0 (imported_S imported_0)),
  rel_iso (Corelib_Init_Logic_eq_iso _0_iso (S_iso _0_iso)) x1 x2 -> rel_iso False_iso (Original.LF_DOT_Logic.LF.Logic.zero_not_one x1) (imported_Original_LF__DOT__Logic_LF_Logic_zero__not__one x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.zero_not_one := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_zero__not__one := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.zero_not_one Original_LF__DOT__Logic_LF_Logic_zero__not__one_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.zero_not_one Imported.Original_LF__DOT__Logic_LF_Logic_zero__not__one Original_LF__DOT__Logic_LF_Logic_zero__not__one_iso := {}.