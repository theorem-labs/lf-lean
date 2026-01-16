From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



Definition imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp : Type -> Type := Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp.
Instance Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2).
Proof.
  intros T1 T2 isoT.
  apply Build_Iso with
    (to := fix to_lf re := 
             match re with
             | Original.LF_DOT_IndProp.LF.IndProp.EmptySet => Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_EmptySet _
             | Original.LF_DOT_IndProp.LF.IndProp.EmptyStr => Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_EmptyStr _
             | Original.LF_DOT_IndProp.LF.IndProp.Char t => Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Char _ (to isoT t)
             | Original.LF_DOT_IndProp.LF.IndProp.App r1 r2 => Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_App _ (to_lf r1) (to_lf r2)
             | Original.LF_DOT_IndProp.LF.IndProp.Union r1 r2 => Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Union _ (to_lf r1) (to_lf r2)
             | Original.LF_DOT_IndProp.LF.IndProp.Star r => Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Star _ (to_lf r)
             end)
    (from := fix from_lf re :=
               match re with
               | Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_EmptySet _ => Original.LF_DOT_IndProp.LF.IndProp.EmptySet
               | Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_EmptyStr _ => Original.LF_DOT_IndProp.LF.IndProp.EmptyStr
               | Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Char _ a => Original.LF_DOT_IndProp.LF.IndProp.Char (from isoT a)
               | Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_App _ r1 r2 => Original.LF_DOT_IndProp.LF.IndProp.App (from_lf r1) (from_lf r2)
               | Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Union _ r1 r2 => Original.LF_DOT_IndProp.LF.IndProp.Union (from_lf r1) (from_lf r2)
               | Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Star _ r => Original.LF_DOT_IndProp.LF.IndProp.Star (from_lf r)
               end).
  - (* to_from *)
    intros re.
    induction re; simpl.
    + reflexivity.
    + reflexivity.
    + apply IsoEq.f_equal. apply (to_from isoT).
    + apply IsoEq.f_equal2; assumption.
    + apply IsoEq.f_equal2; assumption.
    + apply IsoEq.f_equal; assumption.
  - (* from_to *)
    intros re.
    induction re; simpl.
    + reflexivity.
    + reflexivity.
    + apply IsoEq.f_equal. apply (from_to isoT).
    + apply IsoEq.f_equal2; assumption.
    + apply IsoEq.f_equal2; assumption.
    + apply IsoEq.f_equal; assumption.
Defined.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.reg_exp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.reg_exp Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.reg_exp Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso := {}.