From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. (* for speed *) *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_ANum : imported_nat -> imported_Original_LF__DOT__Imp_LF_Imp_aexp := Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum.
Instance Original_LF__DOT__Imp_LF_Imp_ANum_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso (Original.LF_DOT_Imp.LF.Imp.ANum x1) (imported_Original_LF__DOT__Imp_LF_Imp_ANum x2).
Proof.
  intros x1 x2 H1.
  simpl. simpl in *.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_ANum.
  apply (f_equal Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum H1).
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.ANum := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.ANum Original_LF__DOT__Imp_LF_Imp_ANum_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.ANum Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum Original_LF__DOT__Imp_LF_Imp_ANum_iso := {}.