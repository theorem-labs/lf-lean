From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_plus : imported_nat -> imported_nat -> imported_nat := Imported.Original_LF__DOT__Basics_LF_Basics_plus.

(* Prove that plus and Imported.Original_LF__DOT__Basics_LF_Basics_plus are isomorphic *)
Lemma plus_iso_helper : forall n m : nat,
  IsomorphismDefinitions.eq 
    (nat_to_imported (Original.LF_DOT_Basics.LF.Basics.plus n m))
    (Imported.Original_LF__DOT__Basics_LF_Basics_plus (nat_to_imported n) (nat_to_imported m)).
Proof.
  fix IH 1.
  intros n m.
  destruct n as [|n'].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    (* Goal: nat_S (nat_to_imported (plus n' m)) = 
             Imported.plus (nat_S (nat_to_imported n')) (nat_to_imported m)
       By computation, RHS = nat_S (Imported.plus (nat_to_imported n') (nat_to_imported m))
       By IH, nat_to_imported (plus n' m) = Imported.plus (nat_to_imported n') (nat_to_imported m)
       So we need nat_S applied to both sides *)
    change (Imported.Original_LF__DOT__Basics_LF_Basics_plus (Imported.nat_S (nat_to_imported n')) (nat_to_imported m))
      with (Imported.nat_S (Imported.Original_LF__DOT__Basics_LF_Basics_plus (nat_to_imported n') (nat_to_imported m))).
    apply IsoEq.f_equal. apply IH.
Qed.

Instance Original_LF__DOT__Basics_LF_Basics_plus_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Basics.LF.Basics.plus x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_plus x2 x4).
Proof.
  intros x1 x2 H1 x3 x4 H2.
  constructor. simpl.
  unfold imported_Original_LF__DOT__Basics_LF_Basics_plus.
  pose proof (plus_iso_helper x1 x3) as Hplus.
  eapply IsoEq.eq_trans.
  - exact Hplus.
  - apply IsoEq.f_equal2.
    + exact (proj_rel_iso H1).
    + exact (proj_rel_iso H2).
Qed.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.plus Original_LF__DOT__Basics_LF_Basics_plus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.plus Imported.Original_LF__DOT__Basics_LF_Basics_plus Original_LF__DOT__Basics_LF_Basics_plus_iso := {}.