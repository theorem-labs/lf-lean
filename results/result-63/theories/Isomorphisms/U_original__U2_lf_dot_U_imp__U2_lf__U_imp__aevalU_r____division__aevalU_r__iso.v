From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aevalU_r____division__aexp__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR : imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp -> imported_nat -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR.
Instance Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.aevalR_division.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.aevalR_division.aevalR Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR Original_LF__DOT__Imp_LF_Imp_aevalR__division_aevalR_iso := {}.