From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* (* Typeclasses Opaque rel_iso. *) *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reg____exp__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_re__opt : forall x : Type, imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x := (@Imported.Original_LF__DOT__AltAuto_LF_AltAuto_re__opt).

(* Helper: convert to and from using the isomorphism *)
Definition reg_exp_to {T1 T2 : Type} (hT : Iso T1 T2) : Original.LF_DOT_IndProp.LF.IndProp.reg_exp T1 -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp T2 :=
  to (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hT).

Definition reg_exp_from {T1 T2 : Type} (hT : Iso T1 T2) : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp T2 -> Original.LF_DOT_IndProp.LF.IndProp.reg_exp T1 :=
  from (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hT).

(* First prove that re_opt commutes with the translation *)
Lemma re_opt_commutes (x1 x2 : Type) (hx : Iso x1 x2) 
  (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) :
  IsomorphismDefinitions.eq 
    (to (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) (Original.LF_DOT_AltAuto.LF.AltAuto.re_opt x3))
    (imported_Original_LF__DOT__AltAuto_LF_AltAuto_re__opt (to (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3)).
Admitted.

Instance Original_LF__DOT__AltAuto_LF_AltAuto_re__opt_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3 x4 ->
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) (Original.LF_DOT_AltAuto.LF.AltAuto.re_opt x3) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_re__opt x4).
Proof.
  intros x1 x2 hx x3 x4 Hrel.
  destruct Hrel as [Hrel].
  constructor. simpl in *.
  pose proof (@re_opt_commutes x1 x2 hx x3) as Hcomm.
  apply (eq_trans Hcomm).
  apply IsoEq.f_equal.
  exact Hrel.
Defined.
Instance: KnownConstant (@Original.LF_DOT_AltAuto.LF.AltAuto.re_opt) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__AltAuto_LF_AltAuto_re__opt) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_AltAuto.LF.AltAuto.re_opt) Original_LF__DOT__AltAuto_LF_AltAuto_re__opt_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_AltAuto.LF.AltAuto.re_opt) (@Imported.Original_LF__DOT__AltAuto_LF_AltAuto_re__opt) Original_LF__DOT__AltAuto_LF_AltAuto_re__opt_iso := {}.