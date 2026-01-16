From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_disc__fn : imported_nat -> SProp := Imported.Original_LF__DOT__Logic_LF_Logic_disc__fn.

(* Helper: Logic.True <-> Imported.Original_True *)
Definition True_to_Original_True (t : Logic.True) : Imported.Original_True :=
  Imported.Original_True_I.

Definition Original_True_to_True (t : Imported.Original_True) : Logic.True :=
  Logic.I.

(* Helper: Original.False <-> Imported.Original_False *)
Definition OrigFalse_to_Imported_False (f : Original.False) : Imported.Original_False :=
  match f with end.

Definition Imported_False_to_OrigFalse (f : Imported.Original_False) : Original.False :=
  match f with end.

(* The main isomorphism *)
Instance Original_LF__DOT__Logic_LF_Logic_disc__fn_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> Iso (Original.LF_DOT_Logic.LF.Logic.disc_fn x1) (imported_Original_LF__DOT__Logic_LF_Logic_disc__fn x2).
Proof.
  intros x1 x2 Hrel.
  (* x2 = nat_to_imported x1 *)
  pose proof (proj_rel_iso Hrel) as Heq.
  simpl in Heq.
  unfold imported_Original_LF__DOT__Logic_LF_Logic_disc__fn.
  (* First destruct Heq to substitute x2 *)
  destruct Heq.
  (* Now x2 = nat_to_imported x1 *)
  destruct x1.
  - (* x1 = O *)
    simpl.
    (* disc_fn O = Logic.True, Imported.disc_fn (nat_O) = Imported.Original_True *)
    unshelve eapply Build_Iso.
    + exact True_to_Original_True.
    + exact Original_True_to_True.
    + intro t. destruct t. apply IsomorphismDefinitions.eq_refl.
    + intro t. destruct t. apply IsomorphismDefinitions.eq_refl.
  - (* x1 = S n *)
    simpl.
    (* disc_fn (S n) = Original.False, Imported.disc_fn (nat_S _) = Imported.Original_False *)
    unshelve eapply Build_Iso.
    + exact OrigFalse_to_Imported_False.
    + exact Imported_False_to_OrigFalse.
    + intro f. destruct f.
    + intro f. destruct f.
Defined.

Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.disc_fn := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_disc__fn := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.disc_fn Original_LF__DOT__Logic_LF_Logic_disc__fn_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.disc_fn Imported.Original_LF__DOT__Logic_LF_Logic_disc__fn Original_LF__DOT__Logic_LF_Logic_disc__fn_iso := {}.