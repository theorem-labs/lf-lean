From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_d : imported_Ascii_ascii := Imported.Original_LF__DOT__IndProp_LF_IndProp_d.

(* The original d = ascii_of_nat 100 = Ascii false false true false false true true false *)
(* The imported d = Ascii_ascii_Ascii myfalse myfalse mytrue myfalse myfalse mytrue mytrue myfalse *)
(* We need to show that Ascii_ascii_iso maps d to imported_d, i.e., to d = Imported.Original_LF__DOT__IndProp_LF_IndProp_d *)

Instance Original_LF__DOT__IndProp_LF_IndProp_d_iso : rel_iso Ascii_ascii_iso Original.LF_DOT_IndProp.LF.IndProp.d imported_Original_LF__DOT__IndProp_LF_IndProp_d.
Proof.
  constructor.
  unfold Ascii_ascii_iso, imported_Original_LF__DOT__IndProp_LF_IndProp_d.
  unfold Original.LF_DOT_IndProp.LF.IndProp.d.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.d := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_d := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.d Original_LF__DOT__IndProp_LF_IndProp_d_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.d Imported.Original_LF__DOT__IndProp_LF_IndProp_d Original_LF__DOT__IndProp_LF_IndProp_d_iso := {}.
