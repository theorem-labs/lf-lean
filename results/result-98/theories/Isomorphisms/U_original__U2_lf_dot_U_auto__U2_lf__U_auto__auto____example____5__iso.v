From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Auto_LF_Auto_auto__example__5 : imported_Corelib_Init_Logic_eq (imported_S (imported_S imported_0)) (imported_S (imported_S imported_0)) := Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__5.
Instance Original_LF__DOT__Auto_LF_Auto_auto__example__5_iso : rel_iso (Corelib_Init_Logic_eq_iso (S_iso (S_iso _0_iso)) (S_iso (S_iso _0_iso))) Original.LF_DOT_Auto.LF.Auto.auto_example_5 imported_Original_LF__DOT__Auto_LF_Auto_auto__example__5.
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.auto_example_5 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__5 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.auto_example_5 Original_LF__DOT__Auto_LF_Auto_auto__example__5_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.auto_example_5 Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__5 Original_LF__DOT__Auto_LF_Auto_auto__example__5_iso := {}.