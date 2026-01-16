From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aexp__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp -> imported_nat -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR.
Instance Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat),
  rel_iso nat_iso x3 x4 -> Iso (Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.aevalR x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.aevalR := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.aevalR Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_first_try.aevalR Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__first__try_aevalR_iso := {}.