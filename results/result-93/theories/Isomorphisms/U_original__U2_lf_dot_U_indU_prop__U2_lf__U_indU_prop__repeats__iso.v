From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
From Stdlib Require Import Logic.ProofIrrelevance.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* (* Typeclasses Opaque rel_iso. *) *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_repeats : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> SProp := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_repeats).

(* Both Original.repeats and Imported.repeats are EMPTY inductives (no constructors).
   So the isomorphism is trivial - destruct with 0 branches. *)

Instance Original_LF__DOT__IndProp_LF_IndProp_repeats_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.repeats x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_repeats x4).
Proof.
  intros x1 x2 hx x3 x4 Hrel.
  unshelve eapply Build_Iso.
  - (* to: Original.repeats x3 -> Imported.repeats x4 *)
    intro r. destruct r. (* no cases - empty inductive *)
  - (* from: Imported.repeats x4 -> Original.repeats x3 *)
    intro r.
    (* r is in SProp, we need to produce a Prop. Use indl which produces SProp, then sinhabitant *)
    (* indl for empty inductive takes: X, list, P : (repeats list -> SProp), r : repeats list *)
    exact (sinhabitant (Imported.Original_LF__DOT__IndProp_LF_IndProp_repeats_indl x2 x4
             (fun _ => SInhabited (Original.LF_DOT_IndProp.LF.IndProp.repeats x3))
             r)).
  - (* to_from *)
    intro r. apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intro r. destruct r. (* no cases *)
Defined.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.repeats) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_repeats) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.repeats) Original_LF__DOT__IndProp_LF_IndProp_repeats_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.repeats) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_repeats) Original_LF__DOT__IndProp_LF_IndProp_repeats_iso := {}.
