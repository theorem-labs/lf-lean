From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_leb : imported_nat -> imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Basics_LF_Basics_leb.

(* Helper: leb commutes with the nat isomorphism *)
Lemma leb_commutes : forall (n m : nat),
  IsomorphismDefinitions.eq 
    (bool_to_imported (Original.LF_DOT_Basics.LF.Basics.leb n m))
    (Imported.Original_LF__DOT__Basics_LF_Basics_leb (nat_to_imported n) (nat_to_imported m)).
Proof.
  fix IH 1.
  intros n m.
  destruct n as [|n'].
  - (* n = 0 *)
    simpl. apply IsomorphismDefinitions.eq_refl.
  - (* n = S n' *)
    destruct m as [|m'].
    + (* m = 0 *)
      simpl. apply IsomorphismDefinitions.eq_refl.
    + (* m = S m' *)
      simpl. apply IH.
Defined.

Instance Original_LF__DOT__Basics_LF_Basics_leb_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat),
  rel_iso nat_iso x3 x4 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Basics.LF.Basics.leb x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_leb x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  destruct H34 as [H34]. destruct H56 as [H56]. simpl in *.
  (* H12 : eq (nat_to_imported x1) x2 *)
  (* H34 : eq (nat_to_imported x3) x4 *)
  (* Goal: eq (bool_to_imported (leb x1 x3)) (Imported.leb x2 x4) *)
  destruct H12. destruct H34.
  apply leb_commutes.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.leb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_leb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.leb Original_LF__DOT__Basics_LF_Basics_leb_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.leb Imported.Original_LF__DOT__Basics_LF_Basics_leb Original_LF__DOT__Basics_LF_Basics_leb_iso := {}.