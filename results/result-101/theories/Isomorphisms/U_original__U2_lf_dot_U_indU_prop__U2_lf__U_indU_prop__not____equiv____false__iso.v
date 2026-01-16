From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U_false__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_not__equiv__false : forall x : SProp, (x -> imported_False) -> imported_iff x imported_Original_False := Imported.Original_LF__DOT__IndProp_LF_IndProp_not__equiv__false.
Instance Original_LF__DOT__IndProp_LF_IndProp_not__equiv__false_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : ~ x1) (x4 : x2 -> imported_False),
  (forall (x5 : x1) (x6 : x2),
   rel_iso hx x5 x6 ->
   rel_iso {| to := False_iso; from := from False_iso; to_from := fun x : imported_False => to_from False_iso x; from_to := fun x : False => seq_p_of_t (from_to False_iso x) |} (x3 x5) (x4 x6)) ->
  rel_iso
    {|
      to := iff_iso hx Original_False_iso;
      from := from (iff_iso hx Original_False_iso);
      to_from := fun x : imported_iff x2 imported_Original_False => to_from (iff_iso hx Original_False_iso) x;
      from_to := fun x : x1 <-> Original.False => seq_p_of_t (from_to (iff_iso hx Original_False_iso) x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.not_equiv_false x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_not__equiv__false x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.not_equiv_false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_not__equiv__false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.not_equiv_false Original_LF__DOT__IndProp_LF_IndProp_not__equiv__false_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.not_equiv_false Imported.Original_LF__DOT__IndProp_LF_IndProp_not__equiv__false Original_LF__DOT__IndProp_LF_IndProp_not__equiv__false_iso := {}.