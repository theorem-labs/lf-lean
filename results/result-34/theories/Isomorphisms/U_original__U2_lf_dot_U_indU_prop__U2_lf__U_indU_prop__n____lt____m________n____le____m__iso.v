From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(*Typeclasses Opaque rel_iso.*) (* for speed *)

Local Open Scope nat_scope.

From IsomorphismChecker Require Export Isomorphisms.le__iso Isomorphisms.lt__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_n__lt__m____n__le__m : forall x x0 : imported_nat, imported_lt x x0 -> imported_le x x0 := Imported.Original_LF__DOT__IndProp_LF_IndProp_n__lt__m____n__le__m.

(* The rel_iso for le is in SProp, so we just need to show that the le values are the same.
   Since both le in Rocq and imported_le are propositions, and both theorems are axioms,
   we just use proof irrelevance. *)
Instance Original_LF__DOT__IndProp_LF_IndProp_n__lt__m____n__le__m_iso : forall (x1 : Datatypes.nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Datatypes.nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : lt x1 x3) (x6 : imported_lt x2 x4),
  rel_iso
    {| to := lt_iso hx hx0; from := from (lt_iso hx hx0); to_from := fun x : imported_lt x2 x4 => to_from (lt_iso hx hx0) x; from_to := fun x : lt x1 x3 => seq_p_of_t (from_to (lt_iso hx hx0) x) |} x5
    x6 ->
  rel_iso
    {| to := le_iso hx hx0; from := from (le_iso hx hx0); to_from := fun x : imported_le x2 x4 => to_from (le_iso hx hx0) x; from_to := fun x : le x1 x3 => seq_p_of_t (from_to (le_iso hx hx0) x) |}
    (Original.LF_DOT_IndProp.LF.IndProp.n_lt_m__n_le_m x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_n__lt__m____n__le__m x6).
Proof.
  intros x1 x2 hx x3 x4 hx0 x5 x6 H56.
  constructor.
  simpl.
  (* The goal is in SProp (IsomorphismDefinitions.eq), and both sides are in SProp as well *)
  (* Since le is in SProp, we can use eq_refl *)
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.n_lt_m__n_le_m := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_n__lt__m____n__le__m := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.n_lt_m__n_le_m Original_LF__DOT__IndProp_LF_IndProp_n__lt__m____n__le__m_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.n_lt_m__n_le_m Imported.Original_LF__DOT__IndProp_LF_IndProp_n__lt__m____n__le__m Original_LF__DOT__IndProp_LF_IndProp_n__lt__m____n__le__m_iso := {}.