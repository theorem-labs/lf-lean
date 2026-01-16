From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_pumping__pumping____constant__iso Isomorphisms.__0__iso Isomorphisms.U_s__iso Isomorphisms.ge__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1 : forall (x : Type) (x0 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x), imported_ge (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x0) (imported_S imported_0) := Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1.

(* Since both Original.pumping_constant_ge_1 and Imported.pumping_constant_ge_1 are axioms,
   we can prove the isomorphism using the fact that both sides are SProp *)
Instance Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx0 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3 x4),
  rel_iso
    {|
      to := ge_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso hx0) (S_iso _0_iso);
      from := from (ge_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso hx0) (S_iso _0_iso));
      to_from :=
        fun x : imported_ge (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x4) (imported_S imported_0) =>
        to_from (ge_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso hx0) (S_iso _0_iso)) x;
      from_to :=
        fun x : Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x3 >= 1 =>
        seq_p_of_t (from_to (ge_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso hx0) (S_iso _0_iso)) x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant_ge_1 x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1 x4).
Proof.
  intros x1 x2 hx x3 x4 hx0.
  unfold rel_iso. simpl.
  (* The goal is to prove eq between two elements of an SProp type.
     In SProp, all elements are equal, so we use eq_refl. *)
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant_ge_1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant_ge_1 Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant_ge_1 Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1 Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant__ge__1_iso := {}.