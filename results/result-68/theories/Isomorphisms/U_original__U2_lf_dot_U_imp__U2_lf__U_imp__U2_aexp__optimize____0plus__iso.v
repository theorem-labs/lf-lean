From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp -> imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus.

(* Helper lemma: optimize_0plus commutes with the isomorphism *)
(* Use nested fix to handle the APlus case properly *)
Lemma optimize_0plus_correct : forall a,
  IsomorphismDefinitions.eq 
    (aexp_to_imported (Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus a))
    (Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus (aexp_to_imported a)).
Proof.
  induction a as [n | a1 IH1 a2 IH2 | a1 IH1 a2 IH2 | a1 IH1 a2 IH2].
  - (* ANum case *)
    simpl. apply IsomorphismDefinitions.eq_refl.
  - (* APlus case *)
    simpl.
    destruct a1 as [n1 | a1_1 a1_2 | a1_1 a1_2 | a1_1 a1_2].
    + (* APlus (ANum n1) a2 *)
      destruct n1 as [|n1'].
      * (* APlus (ANum 0) a2 -> optimize_0plus a2 *)
        simpl. exact IH2.
      * (* APlus (ANum (S n1')) a2 -> APlus (ANum (S n1')) (optimize_0plus a2) *)
        simpl.
        unfold Imported.Original_LF__DOT__Imp_LF_Imp_AExp_APlus.
        apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_APlus IsomorphismDefinitions.eq_refl IH2).
    + (* APlus (APlus ...) a2 *)
      simpl.
      unfold Imported.Original_LF__DOT__Imp_LF_Imp_AExp_APlus.
      apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_APlus IH1 IH2).
    + (* APlus (AMinus ...) a2 *)
      simpl.
      unfold Imported.Original_LF__DOT__Imp_LF_Imp_AExp_APlus.
      apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_APlus IH1 IH2).
    + (* APlus (AMult ...) a2 *)
      simpl.
      unfold Imported.Original_LF__DOT__Imp_LF_Imp_AExp_APlus.
      apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_APlus IH1 IH2).
  - (* AMinus case *)
    simpl.
    apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_AMinus IH1 IH2).
  - (* AMult case *)
    simpl.
    apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_AMult IH1 IH2).
Defined.

Instance Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso x1 x2 ->
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso (Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus x1) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus x2).
Proof.
  intros x1 x2 H.
  constructor.
  simpl in *.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus.
  (* Goal: aexp_to_imported (optimize_0plus x1) = optimize_0plus x2 *)
  (* We have: aexp_to_imported x1 = x2 *)
  apply (IsoEq.eq_trans (optimize_0plus_correct x1)).
  apply (IsoEq.f_equal Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus (proj_rel_iso H)).
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus_iso := {}.