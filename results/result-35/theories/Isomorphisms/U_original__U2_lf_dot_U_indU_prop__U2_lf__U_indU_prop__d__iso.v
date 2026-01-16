From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_d : imported_Ascii_ascii := Imported.Original_LF__DOT__IndProp_LF_IndProp_d.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_d_iso : rel_iso Ascii_ascii_iso Original.LF_DOT_IndProp.LF.IndProp.d imported_Original_LF__DOT__IndProp_LF_IndProp_d.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.d := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_d := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.d Original_LF__DOT__IndProp_LF_IndProp_d_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.d Imported.Original_LF__DOT__IndProp_LF_IndProp_d Original_LF__DOT__IndProp_LF_IndProp_d_iso := {}.