From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_even__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_even__42__prop : imported_Original_LF__DOT__Logic_LF_Logic_Even (imported_S (imported_S (imported_S (iterate1 imported_S (39)%nat imported_0)))) := Imported.Original_LF__DOT__Logic_LF_Logic_even__42__prop.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_even__42__prop_iso : rel_iso (Original_LF__DOT__Logic_LF_Logic_Even_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (39)%nat (0)%nat imported_0 _0_iso))))) Original.LF_DOT_Logic.LF.Logic.even_42_prop
    imported_Original_LF__DOT__Logic_LF_Logic_even__42__prop.
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.even_42_prop := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_even__42__prop := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.even_42_prop Original_LF__DOT__Logic_LF_Logic_even__42__prop_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.even_42_prop Imported.Original_LF__DOT__Logic_LF_Logic_even__42__prop Original_LF__DOT__Logic_LF_Logic_even__42__prop_iso := {}.