From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import ProofIrrelevance.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *)

(* Now we can prove the imported claim *)
Lemma imported_plus_claim_true : Imported.Original_LF__DOT__Logic_LF_Logic_plus__claim.
Proof.
  unfold Imported.Original_LF__DOT__Logic_LF_Logic_plus__claim.
  (* The claim is: Eq Lean.Nat (2 + 2) 4 using Lean's Eq *)
  apply Imported.Corelib_Init_Logic_eq_refl.
Qed.

(* Original claim is also true *)
Lemma original_plus_claim_true : Original.LF_DOT_Logic.LF.Logic.plus_claim.
Proof.
  unfold Original.LF_DOT_Logic.LF.Logic.plus_claim.
  reflexivity.
Qed.

(* For SProp, we can build an Iso from proof irrelevance *)
Definition imported_Original_LF__DOT__Logic_LF_Logic_plus__claim : SProp := Imported.Original_LF__DOT__Logic_LF_Logic_plus__claim.

Instance Original_LF__DOT__Logic_LF_Logic_plus__claim_iso : Iso Original.LF_DOT_Logic.LF.Logic.plus_claim imported_Original_LF__DOT__Logic_LF_Logic_plus__claim.
Proof.
  apply Build_Iso with 
    (to := fun _ => imported_plus_claim_true)
    (from := fun _ => original_plus_claim_true).
  - intro x. apply IsomorphismDefinitions.eq_refl.
  - intro x. 
    (* Need proof irrelevance for Prop *)
    apply IsoEq.seq_of_peq_t.
    apply proof_irrelevance.
Defined.

Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.plus_claim := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_plus__claim := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.plus_claim Original_LF__DOT__Logic_LF_Logic_plus__claim_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.plus_claim Imported.Original_LF__DOT__Logic_LF_Logic_plus__claim Original_LF__DOT__Logic_LF_Logic_plus__claim_iso := {}.