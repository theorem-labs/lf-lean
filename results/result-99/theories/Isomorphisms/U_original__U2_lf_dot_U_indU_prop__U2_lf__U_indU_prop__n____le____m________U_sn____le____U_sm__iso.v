From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)

Local Open Scope nat_scope.

From IsomorphismChecker Require Export Isomorphisms.U_s__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm : forall x x0 : imported_nat, imported_le x x0 -> imported_le (imported_S x) (imported_S x0) := Imported.Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm.

Instance Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm_iso : forall (x1 : Datatypes.nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Datatypes.nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : Peano.le x1 x3) (x6 : imported_le x2 x4),
  rel_iso
    {| to := le_iso hx hx0; from := from (le_iso hx hx0); to_from := fun x : imported_le x2 x4 => to_from (le_iso hx hx0) x; from_to := fun x : Peano.le x1 x3 => seq_p_of_t (from_to (le_iso hx hx0) x) |}
    x5 x6 ->
  rel_iso
    {|
      to := le_iso (S_iso hx) (S_iso hx0);
      from := from (le_iso (S_iso hx) (S_iso hx0));
      to_from := fun x : imported_le (imported_S x2) (imported_S x4) => to_from (le_iso (S_iso hx) (S_iso hx0)) x;
      from_to := fun x : Peano.le (Datatypes.S x1) (Datatypes.S x3) => seq_p_of_t (from_to (le_iso (S_iso hx) (S_iso hx0)) x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.n_le_m__Sn_le_Sm x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm x6).
Proof.
  intros x1 x2 hx x3 x4 hx0 x5 x6 Hrel.
  (* rel_iso for SProp types - the goal is essentially that 
     the imported axiom applied to the converted proof equals 
     the conversion of the original axiom's result *)
  (* Since both are axioms, and the types match up under the isomorphism,
     we just need to show the SProp equality which is trivial *)
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.n_le_m__Sn_le_Sm := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.n_le_m__Sn_le_Sm Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.n_le_m__Sn_le_Sm Imported.Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm_iso := {}.