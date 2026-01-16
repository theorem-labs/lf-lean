From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_even__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_four__is__Even : imported_Original_LF__DOT__Logic_LF_Logic_Even (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))) := Imported.Original_LF__DOT__Logic_LF_Logic_four__is__Even.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_four__is__Even_iso : rel_iso (Original_LF__DOT__Logic_LF_Logic_Even_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1 0 imported_0 _0_iso))))) Original.LF_DOT_Logic.LF.Logic.four_is_Even
    imported_Original_LF__DOT__Logic_LF_Logic_four__is__Even.
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.four_is_Even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_four__is__Even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.four_is_Even Original_LF__DOT__Logic_LF_Logic_four__is__Even_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.four_is_Even Imported.Original_LF__DOT__Logic_LF_Logic_four__is__Even Original_LF__DOT__Logic_LF_Logic_four__is__Even_iso := {}.