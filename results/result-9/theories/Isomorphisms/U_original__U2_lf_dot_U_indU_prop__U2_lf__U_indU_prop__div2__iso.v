From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_div2 : imported_nat -> imported_nat := Imported.Original_LF__DOT__IndProp_LF_IndProp_div2.

Lemma div2_commutes : forall (n : nat),
  IsomorphismDefinitions.eq 
    (nat_to_imported (Original.LF_DOT_IndProp.LF.IndProp.div2 n))
    (imported_Original_LF__DOT__IndProp_LF_IndProp_div2 (nat_to_imported n)).
Proof.
  fix IH 1.
  intros n.
  destruct n as [|n1].
  - (* n = 0 *)
    apply IsomorphismDefinitions.eq_refl.
  - destruct n1 as [|n2].
    + (* n = 1 *)
      apply IsomorphismDefinitions.eq_refl.
    + (* n = S (S n2) *)
      change (Original.LF_DOT_IndProp.LF.IndProp.div2 (S (S n2))) with (S (Original.LF_DOT_IndProp.LF.IndProp.div2 n2)).
      change (nat_to_imported (S (Original.LF_DOT_IndProp.LF.IndProp.div2 n2))) with (Imported.nat_S (nat_to_imported (Original.LF_DOT_IndProp.LF.IndProp.div2 n2))).
      change (nat_to_imported (S (S n2))) with (Imported.nat_S (Imported.nat_S (nat_to_imported n2))).
      change (imported_Original_LF__DOT__IndProp_LF_IndProp_div2 (Imported.nat_S (Imported.nat_S (nat_to_imported n2)))) with (Imported.nat_S (imported_Original_LF__DOT__IndProp_LF_IndProp_div2 (nat_to_imported n2))).
      apply f_equal.
      apply IH.
Defined.

Instance Original_LF__DOT__IndProp_LF_IndProp_div2_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_IndProp.LF.IndProp.div2 x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_div2 x2).
Proof.
  intros n1 n2 [H]. constructor. simpl in *.
  apply (@eq_srect_r imported_nat (nat_to_imported n1) (fun y => IsomorphismDefinitions.eq (nat_to_imported (Original.LF_DOT_IndProp.LF.IndProp.div2 n1)) (imported_Original_LF__DOT__IndProp_LF_IndProp_div2 y))).
  - apply div2_commutes.
  - apply eq_sym. exact H.
Defined.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.div2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_div2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.div2 Original_LF__DOT__IndProp_LF_IndProp_div2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.div2 Imported.Original_LF__DOT__IndProp_LF_IndProp_div2 Original_LF__DOT__IndProp_LF_IndProp_div2_iso := {}.