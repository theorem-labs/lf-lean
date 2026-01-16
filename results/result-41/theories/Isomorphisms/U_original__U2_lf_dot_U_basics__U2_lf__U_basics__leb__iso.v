From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_leb : imported_nat -> imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Basics_LF_Basics_leb.

(* Prove that leb is preserved by the nat/bool isomorphisms *)
Fixpoint leb_compat (n m : nat) : 
  bool_to_imported (Original.LF_DOT_Basics.LF.Basics.leb n m) = 
  Imported.Original_LF__DOT__Basics_LF_Basics_leb (nat_to_imported n) (nat_to_imported m).
Proof.
  destruct n as [|n']; destruct m as [|m'].
  - (* O, O *) reflexivity.
  - (* O, S m' *) reflexivity.
  - (* S n', O *) reflexivity.
  - (* S n', S m' *)
    simpl. apply leb_compat.
Defined.

Instance Original_LF__DOT__Basics_LF_Basics_leb_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat),
  rel_iso nat_iso x3 x4 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Basics.LF.Basics.leb x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_leb x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  constructor.
  simpl.
  eapply eq_trans.
  { apply seq_of_eq. apply leb_compat. }
  apply f_equal2; [exact (proj_rel_iso H12) | exact (proj_rel_iso H34)].
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.leb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_leb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.leb Original_LF__DOT__Basics_LF_Basics_leb_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.leb Imported.Original_LF__DOT__Basics_LF_Basics_leb Original_LF__DOT__Basics_LF_Basics_leb_iso := {}.