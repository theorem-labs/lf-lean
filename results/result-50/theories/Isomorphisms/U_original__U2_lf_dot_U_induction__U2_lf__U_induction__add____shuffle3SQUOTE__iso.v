From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__add__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_add__shuffle3' : forall x x0 x1 : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_add x (imported_Nat_add x0 x1)) (imported_Nat_add x0 (imported_Nat_add x x1)) := Imported.Original_LF__DOT__Induction_LF_Induction_add__shuffle3'.
Instance Original_LF__DOT__Induction_LF_Induction_add__shuffle3'_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6),
  rel_iso
    {|
      to := Corelib_Init_Logic_eq_iso (Nat_add_iso hx (Nat_add_iso hx0 hx1)) (Nat_add_iso hx0 (Nat_add_iso hx hx1));
      from := from (Corelib_Init_Logic_eq_iso (Nat_add_iso hx (Nat_add_iso hx0 hx1)) (Nat_add_iso hx0 (Nat_add_iso hx hx1)));
      to_from :=
        fun x : imported_Corelib_Init_Logic_eq (imported_Nat_add x2 (imported_Nat_add x4 x6)) (imported_Nat_add x4 (imported_Nat_add x2 x6)) =>
        to_from (Corelib_Init_Logic_eq_iso (Nat_add_iso hx (Nat_add_iso hx0 hx1)) (Nat_add_iso hx0 (Nat_add_iso hx hx1))) x;
      from_to := fun x : x1 + (x3 + x5) = x3 + (x1 + x5) => seq_p_of_t (from_to (Corelib_Init_Logic_eq_iso (Nat_add_iso hx (Nat_add_iso hx0 hx1)) (Nat_add_iso hx0 (Nat_add_iso hx hx1))) x)
    |} (Original.LF_DOT_Induction.LF.Induction.add_shuffle3' x1 x3 x5) (imported_Original_LF__DOT__Induction_LF_Induction_add__shuffle3' x2 x4 x6).
Proof.
  intros.
  (* The goal is to show that converting the original proof gives the imported proof *)
  (* rel_iso means: to iso (original) = imported in SProp *)
  (* Since both sides are proofs of propositions (SProp on the imported side), *)
  (* this is trivially true by SProp proof irrelevance *)
  constructor. simpl.
  (* Goal: eq (to ... (Original...add_shuffle3' x1 x3 x5)) (imported_Original...add_shuffle3' x2 x4 x6) *)
  (* Both sides live in an SProp, so they're equal by SProp irrelevance *)
  exact (IsomorphismDefinitions.eq_refl _).
Defined.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.add_shuffle3' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_add__shuffle3' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.add_shuffle3' Original_LF__DOT__Induction_LF_Induction_add__shuffle3'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.add_shuffle3' Imported.Original_LF__DOT__Induction_LF_Induction_add__shuffle3' Original_LF__DOT__Induction_LF_Induction_add__shuffle3'_iso := {}.