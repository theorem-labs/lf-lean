From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_principles__U2_lf__U_indU_principles__U_p____m0r__iso.

Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_mul__0__r'' : forall x : imported_nat, imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r x := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_mul__0__r''.
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_mul__0__r''_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r_iso hx) (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.mul_0_r'' x1)
    (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_mul__0__r'' x2).
Proof.
  intros x1 x2 hx.
  unfold rel_iso.
  apply IsomorphismDefinitions.eq_refl.
Qed.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.mul_0_r'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_mul__0__r'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.mul_0_r'' Original_LF__DOT__IndPrinciples_LF_IndPrinciples_mul__0__r''_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.mul_0_r'' Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_mul__0__r'' Original_LF__DOT__IndPrinciples_LF_IndPrinciples_mul__0__r''_iso := {}.