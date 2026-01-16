From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reg____exp__iso Isomorphisms.nat__iso Isomorphisms.U_nat__add__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant : forall x : Type, imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x -> imported_nat := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant).

(* Helper lemma for nat addition *)
Lemma nat_add_iso_compat : forall n1 n2 : nat,
  IsomorphismDefinitions.eq (to nat_iso (n1 + n2)) (Imported.Nat_add (to nat_iso n1) (to nat_iso n2)).
Proof.
  induction n1; intros n2.
  { simpl. apply IsomorphismDefinitions.eq_refl. }
  { simpl (to nat_iso _). 
    change (IsomorphismDefinitions.eq
      (Imported.nat_S (to nat_iso (n1 + n2)))
      (Imported.nat_S (Imported.Nat_add (to nat_iso n1) (to nat_iso n2)))).
    apply f_equal. apply IHn1. }
Qed.

(* First prove for the case when x4 = to (reg_exp_iso hx) x3 *)
Lemma pumping_commutes : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1),
  IsomorphismDefinitions.eq 
    (to nat_iso (Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x3))
    (Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 (to (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3)).
Proof.
  intros x1 x2 hx x3.
  induction x3 as [| | t | r1 IH1 r2 IH2 | r1 IH1 r2 IH2 | r IH].
  all: simpl (Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant _).
  all: simpl (to (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) _).
  (* EmptySet *)
  - apply IsomorphismDefinitions.eq_refl.
  (* EmptyStr *)
  - apply IsomorphismDefinitions.eq_refl.
  (* Char *)
  - apply IsomorphismDefinitions.eq_refl.
  (* App - use change to express in terms of Nat_add *)
  - change (IsomorphismDefinitions.eq
      (to nat_iso (Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant r1 +
                   Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant r2))
      (Imported.Nat_add 
         (Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 (to (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) r1))
         (Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 (to (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) r2)))).
    apply (eq_trans (nat_add_iso_compat _ _)).
    apply f_equal2; assumption.
  (* Union - use change to express in terms of Nat_add *)
  - change (IsomorphismDefinitions.eq
      (to nat_iso (Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant r1 +
                   Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant r2))
      (Imported.Nat_add 
         (Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 (to (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) r1))
         (Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 (to (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) r2)))).
    apply (eq_trans (nat_add_iso_compat _ _)).
    apply f_equal2; assumption.
  (* Star *)
  - assumption.
Defined.

(* Main isomorphism - use the commutation lemma and then apply f_equal *)
Instance Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3 x4 ->
  rel_iso nat_iso (Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x4).
Proof.
  intros x1 x2 hx x3 x4 Hrel.
  destruct Hrel as [Hrel]. simpl in *.
  constructor. simpl.
  unfold imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant.
  apply (eq_trans (@pumping_commutes x1 x2 hx x3)).
  apply f_equal.
  exact Hrel.
Defined.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant) Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant) Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso := {}.