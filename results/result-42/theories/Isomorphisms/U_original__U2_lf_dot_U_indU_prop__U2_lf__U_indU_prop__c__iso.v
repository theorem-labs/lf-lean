From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_c : imported_Ascii_ascii := Imported.Original_LF__DOT__IndProp_LF_IndProp_c.

Instance Original_LF__DOT__IndProp_LF_IndProp_c_iso : rel_iso Ascii_ascii_iso Original.LF_DOT_IndProp.LF.IndProp.c imported_Original_LF__DOT__IndProp_LF_IndProp_c.
Proof.
  simpl.
  unfold imported_Original_LF__DOT__IndProp_LF_IndProp_c.
  unfold Original.LF_DOT_IndProp.LF.IndProp.c.
  unfold Ascii.ascii_of_nat, Ascii.ascii_of_N, Ascii.ascii_of_pos.
  simpl.
  unfold ascii_to_imported.
  exact IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.c := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_c := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.c Original_LF__DOT__IndProp_LF_IndProp_c_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.c Imported.Original_LF__DOT__IndProp_LF_IndProp_c Original_LF__DOT__IndProp_LF_IndProp_c_iso := {}.