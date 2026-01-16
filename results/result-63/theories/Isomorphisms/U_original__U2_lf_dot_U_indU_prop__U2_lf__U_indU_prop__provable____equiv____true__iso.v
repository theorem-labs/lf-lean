From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_true__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_provable__equiv__true : forall x : SProp, x -> imported_iff x imported_True := Imported.Original_LF__DOT__IndProp_LF_IndProp_provable__equiv__true.
Instance Original_LF__DOT__IndProp_LF_IndProp_provable__equiv__true_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 ->
  rel_iso
    {|
      to := iff_iso hx True_iso;
      from := from (iff_iso hx True_iso);
      to_from := fun x : imported_iff x2 imported_True => to_from (iff_iso hx True_iso) x;
      from_to := fun x : x1 <-> True => seq_p_of_t (from_to (iff_iso hx True_iso) x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.provable_equiv_true x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_provable__equiv__true x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.provable_equiv_true := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_provable__equiv__true := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.provable_equiv_true Original_LF__DOT__IndProp_LF_IndProp_provable__equiv__true_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.provable_equiv_true Imported.Original_LF__DOT__IndProp_LF_IndProp_provable__equiv__true Original_LF__DOT__IndProp_LF_IndProp_provable__equiv__true_iso := {}.