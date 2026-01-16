From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__mult__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_exp : imported_nat -> imported_nat -> imported_nat := Imported.Original_LF__DOT__Basics_LF_Basics_exp.

(* Prove computation step for exp *)
Lemma exp_step : forall base p' : nat,
  IsomorphismDefinitions.eq 
    (Imported.Original_LF__DOT__Basics_LF_Basics_mult (nat_to_imported base) (Imported.Original_LF__DOT__Basics_LF_Basics_exp (nat_to_imported base) (nat_to_imported p')))
    (Imported.Original_LF__DOT__Basics_LF_Basics_exp (nat_to_imported base) (Imported.nat_S (nat_to_imported p'))).
Proof.
  intros. native_compute. apply IsomorphismDefinitions.eq_refl.
Defined.

(* Prove that exp and Imported.Original_LF__DOT__Basics_LF_Basics_exp are isomorphic *)
Lemma exp_iso_helper : forall base power : nat,
  IsomorphismDefinitions.eq 
    (nat_to_imported (Original.LF_DOT_Basics.LF.Basics.exp base power))
    (Imported.Original_LF__DOT__Basics_LF_Basics_exp (nat_to_imported base) (nat_to_imported power)).
Proof.
  intros base.
  fix IH 1.
  intros power.
  destruct power as [|p'].
  - simpl. native_compute. apply IsomorphismDefinitions.eq_refl.
  - simpl Original.LF_DOT_Basics.LF.Basics.exp.
    eapply IsoEq.eq_trans.
    + eapply IsoEq.eq_trans.
      * apply mult_iso_helper.
      * apply IsoEq.f_equal2.
        -- apply IsomorphismDefinitions.eq_refl.
        -- apply IH.
    + apply exp_step.
Defined.

Instance Original_LF__DOT__Basics_LF_Basics_exp_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Basics.LF.Basics.exp x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_exp x2 x4).
Proof.
  intros x1 x2 H1 x3 x4 H2.
  constructor. simpl.
  unfold imported_Original_LF__DOT__Basics_LF_Basics_exp.
  pose proof (exp_iso_helper x1 x3) as Hexp.
  eapply IsoEq.eq_trans.
  - exact Hexp.
  - apply IsoEq.f_equal2.
    + exact (proj_rel_iso H1).
    + exact (proj_rel_iso H2).
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.exp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_exp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.exp Original_LF__DOT__Basics_LF_Basics_exp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.exp Imported.Original_LF__DOT__Basics_LF_Basics_exp Original_LF__DOT__Basics_LF_Basics_exp_iso := {}.