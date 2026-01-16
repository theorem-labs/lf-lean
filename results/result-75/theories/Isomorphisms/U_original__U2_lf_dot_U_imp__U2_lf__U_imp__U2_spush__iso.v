From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__sinstr__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_SPush : imported_nat -> imported_Original_LF__DOT__Imp_LF_Imp_sinstr := Imported.Original_LF__DOT__Imp_LF_Imp_SPush.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_SPush_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Imp_LF_Imp_sinstr_iso (Original.LF_DOT_Imp.LF.Imp.SPush x1) (imported_Original_LF__DOT__Imp_LF_Imp_SPush x2).
Proof.
  intros x1 x2 Hrel.
  unfold rel_iso in *.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_SPush.
  simpl.
  apply (IsoEq.f_equal Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SPush).
  exact Hrel.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.SPush := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_SPush := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.SPush Original_LF__DOT__Imp_LF_Imp_SPush_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.SPush Imported.Original_LF__DOT__Imp_LF_Imp_SPush Original_LF__DOT__Imp_LF_Imp_SPush_iso := {}.