From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_even__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_not__even__1001' : imported_Original_LF__DOT__Logic_LF_Logic_Even (imported_S (imported_S (imported_S (iterate1 imported_S 998 imported_0)))) -> imported_False := Imported.Original_LF__DOT__Logic_LF_Logic_not__even__1001'.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_not__even__1001'_iso : forall (x1 : Original.LF_DOT_Logic.LF.Logic.Even 1001) (x2 : imported_Original_LF__DOT__Logic_LF_Logic_Even (imported_S (imported_S (imported_S (iterate1 imported_S 998 imported_0))))),
  rel_iso (Original_LF__DOT__Logic_LF_Logic_Even_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 998 0 imported_0 _0_iso))))) x1 x2 ->
  rel_iso False_iso (Original.LF_DOT_Logic.LF.Logic.not_even_1001' x1) (imported_Original_LF__DOT__Logic_LF_Logic_not__even__1001' x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.not_even_1001' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_not__even__1001' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.not_even_1001' Original_LF__DOT__Logic_LF_Logic_not__even__1001'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.not_even_1001' Imported.Original_LF__DOT__Logic_LF_Logic_not__even__1001' Original_LF__DOT__Logic_LF_Logic_not__even__1001'_iso := {}.