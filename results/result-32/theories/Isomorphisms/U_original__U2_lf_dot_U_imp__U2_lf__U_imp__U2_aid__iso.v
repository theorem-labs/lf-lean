From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
 (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AId : imported_String_string -> imported_Original_LF__DOT__Imp_LF_Imp_aexp := Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId.
Instance Original_LF__DOT__Imp_LF_Imp_AId_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 -> rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso (Original.LF_DOT_Imp.LF.Imp.AId x1) (imported_Original_LF__DOT__Imp_LF_Imp_AId x2).
Proof.
  intros x1 x2 H1.
  destruct H12 as [H12]. destruct H34 as [H34]. simpl in *. simpl in *.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_AId.
  apply (f_equal Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId H1).
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AId := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AId Original_LF__DOT__Imp_LF_Imp_AId_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AId Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId Original_LF__DOT__Imp_LF_Imp_AId_iso := {}.