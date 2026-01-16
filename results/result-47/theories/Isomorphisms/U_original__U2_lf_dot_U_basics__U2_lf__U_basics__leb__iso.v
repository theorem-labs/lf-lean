From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_leb : imported_nat -> imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Basics_LF_Basics_leb.

Lemma leb_iso_helper : forall (x1 : nat) (x3 : nat),
  rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso 
    (Original.LF_DOT_Basics.LF.Basics.leb x1 x3) 
    (imported_Original_LF__DOT__Basics_LF_Basics_leb (nat_to_imported x1) (nat_to_imported x3)).
Proof.
  induction x1 as [|x1' IH]; intros x3.
  - simpl. constructor. apply IsomorphismDefinitions.eq_refl.
  - destruct x3 as [|x3'].
    + simpl. constructor. apply IsomorphismDefinitions.eq_refl.
    + simpl. apply IH.
Defined.

Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_leb_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat),
  rel_iso nat_iso x3 x4 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Basics.LF.Basics.leb x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_leb x2 x4).
Proof.
  intros x1 x2 Hx12 x3 x4 Hx34.
  destruct Hx12 as [Hx12].
  destruct Hx34 as [Hx34].
  pose proof (leb_iso_helper x1 x3) as H.
  destruct H as [H].
  constructor.
  eapply IsoEq.eq_trans. exact H.
  apply f_equal2; assumption.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.leb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_leb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.leb Original_LF__DOT__Basics_LF_Basics_leb_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.leb Imported.Original_LF__DOT__Basics_LF_Basics_leb Original_LF__DOT__Basics_LF_Basics_leb_iso := {}.