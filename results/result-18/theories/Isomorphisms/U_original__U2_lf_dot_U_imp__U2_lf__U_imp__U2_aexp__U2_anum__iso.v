From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aexp__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_ANum : imported_nat -> imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_ANum.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_AExp_ANum_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso (Original.LF_DOT_Imp.LF.Imp.AExp.ANum x1) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_ANum x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.ANum := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_ANum := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.ANum Original_LF__DOT__Imp_LF_Imp_AExp_ANum_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.ANum Imported.Original_LF__DOT__Imp_LF_Imp_AExp_ANum Original_LF__DOT__Imp_LF_Imp_AExp_ANum_iso := {}.