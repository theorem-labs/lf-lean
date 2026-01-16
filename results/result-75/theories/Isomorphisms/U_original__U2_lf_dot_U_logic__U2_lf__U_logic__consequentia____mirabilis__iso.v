From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)

(* Helper lemmas for False <-> Imported.False *)
Monomorphic Lemma False_to_Imported_False : False -> Imported.False.
Proof. intro H. destruct H. Qed.

Monomorphic Lemma Imported_False_to_False : Imported.False -> False.
Proof. intro H. destruct H. Qed.

Monomorphic Definition orig := Original.LF_DOT_Logic.LF.Logic.consequentia_mirabilis.
Monomorphic Definition imp := Imported.Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis.

(* Forward direction: orig -> imp *)
(* orig : forall P : Prop, (~P -> P) -> P *)
(* imp  : forall P : SProp, ((P -> Imported.False) -> P) -> P *)
Monomorphic Lemma orig_to_imp : orig -> imp.
Proof.
  unfold orig, imp, Original.LF_DOT_Logic.LF.Logic.consequentia_mirabilis, 
         Imported.Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis, Imported.Not.
  intro H.
  intro P. intro Hf.
  (* Use inhabited P to convert SProp back to Prop *)
  apply (to (iso_sym iso_inhabited_p)).
  apply (H (inhabited P)).
  intro nip.
  constructor.
  apply Hf.
  intro p.
  apply False_to_Imported_False.
  apply nip.
  constructor.
  exact p.
Qed.

(* Reverse direction: imp -> orig *)
Monomorphic Lemma imp_to_orig : imp -> orig.
Proof.
  unfold orig, imp, Original.LF_DOT_Logic.LF.Logic.consequentia_mirabilis, 
         Imported.Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis, Imported.Not.
  intro H.
  intro P. intro Hf.
  apply sinhabitant.
  apply (H (SInhabited P)).
  intro g.
  apply sinhabits.
  apply Hf.
  intro p.
  apply Imported_False_to_False.
  apply g.
  apply sinhabits.
  exact p.
Qed.

(* The isomorphism between orig and imp *)
Monomorphic Instance orig_imp_iso : Iso orig imp.
Proof.
  apply Build_Iso with (to := orig_to_imp) (from := imp_to_orig).
  - (* to_from: forall x : imp, eq (orig_to_imp (imp_to_orig x)) x *)
    (* Since imp : SProp, eq is trivially satisfied *)
    intro x. apply IsomorphismDefinitions.eq_refl.
  - (* from_to: forall x : orig, eq (imp_to_orig (orig_to_imp x)) x *)
    (* Since orig : Prop, use proof irrelevance, then convert to IsomorphismDefinitions.eq *)
    intro x. apply IsoEq.seq_of_peq_t. apply ProofIrrelevance.proof_irrelevance.
Defined.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis : SProp := Imported.Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis.

Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis_iso : Iso Original.LF_DOT_Logic.LF.Logic.consequentia_mirabilis imported_Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis.
Proof.
  unfold imported_Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis.
  exact orig_imp_iso.
Defined.

Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.consequentia_mirabilis := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.consequentia_mirabilis Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.consequentia_mirabilis Imported.Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis_iso := {}.
