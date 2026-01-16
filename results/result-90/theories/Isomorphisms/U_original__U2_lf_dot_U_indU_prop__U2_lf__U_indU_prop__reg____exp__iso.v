From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



Definition imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp : Type -> Type := Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp.

Instance Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2).
Proof.
  intros T1 T2 isoT.
  apply Build_Iso with
    (to := fix reg_exp_to (re : Original.LF_DOT_IndProp.LF.IndProp.reg_exp T1) : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp T2 :=
             match re with
             | Original.LF_DOT_IndProp.LF.IndProp.EmptySet => Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_EmptySet T2
             | Original.LF_DOT_IndProp.LF.IndProp.EmptyStr => Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_EmptyStr T2
             | Original.LF_DOT_IndProp.LF.IndProp.Char t => Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Char T2 (to isoT t)
             | Original.LF_DOT_IndProp.LF.IndProp.App r1 r2 => Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_App T2 (reg_exp_to r1) (reg_exp_to r2)
             | Original.LF_DOT_IndProp.LF.IndProp.Union r1 r2 => Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Union T2 (reg_exp_to r1) (reg_exp_to r2)
             | Original.LF_DOT_IndProp.LF.IndProp.Star r => Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Star T2 (reg_exp_to r)
             end)
    (from := fix reg_exp_from (re : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp T2) : Original.LF_DOT_IndProp.LF.IndProp.reg_exp T1 :=
               match re with
               | Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_EmptySet _ => Original.LF_DOT_IndProp.LF.IndProp.EmptySet
               | Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_EmptyStr _ => Original.LF_DOT_IndProp.LF.IndProp.EmptyStr
               | Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Char _ a => Original.LF_DOT_IndProp.LF.IndProp.Char (from isoT a)
               | Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_App _ r1 r2 => Original.LF_DOT_IndProp.LF.IndProp.App (reg_exp_from r1) (reg_exp_from r2)
               | Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Union _ r1 r2 => Original.LF_DOT_IndProp.LF.IndProp.Union (reg_exp_from r1) (reg_exp_from r2)
               | Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_Star _ r => Original.LF_DOT_IndProp.LF.IndProp.Star (reg_exp_from r)
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