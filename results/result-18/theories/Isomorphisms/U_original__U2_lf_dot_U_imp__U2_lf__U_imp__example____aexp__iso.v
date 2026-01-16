From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_example__aexp : imported_Original_LF__DOT__Imp_LF_Imp_aexp := Imported.Original_LF__DOT__Imp_LF_Imp_example__aexp.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_example__aexp_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso Original.LF_DOT_Imp.LF.Imp.example_aexp imported_Original_LF__DOT__Imp_LF_Imp_example__aexp.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.example_aexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_example__aexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.example_aexp Original_LF__DOT__Imp_LF_Imp_example__aexp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.example_aexp Imported.Original_LF__DOT__Imp_LF_Imp_example__aexp Original_LF__DOT__Imp_LF_Imp_example__aexp_iso := {}.