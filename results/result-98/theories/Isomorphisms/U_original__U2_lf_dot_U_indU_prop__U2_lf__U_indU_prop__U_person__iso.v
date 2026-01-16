From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Person : Type := Imported.Original_LF__DOT__IndProp_LF_IndProp_Person.

Instance Original_LF__DOT__IndProp_LF_IndProp_Person_iso : Iso Original.LF_DOT_IndProp.LF.IndProp.Person imported_Original_LF__DOT__IndProp_LF_IndProp_Person.
Proof.
  unshelve eapply Build_Iso.
  - (* to: Original.Person -> Imported.Person *)
    intro p. destruct p.
    + exact Imported.Original_LF__DOT__IndProp_LF_IndProp_Person_Sage.
    + exact Imported.Original_LF__DOT__IndProp_LF_IndProp_Person_Cleo.
    + exact Imported.Original_LF__DOT__IndProp_LF_IndProp_Person_Ridley.
    + exact Imported.Original_LF__DOT__IndProp_LF_IndProp_Person_Moss.
  - (* from: Imported.Person -> Original.Person *)
    intro p. destruct p.
    + exact Original.LF_DOT_IndProp.LF.IndProp.Sage.
    + exact Original.LF_DOT_IndProp.LF.IndProp.Cleo.
    + exact Original.LF_DOT_IndProp.LF.IndProp.Ridley.
    + exact Original.LF_DOT_IndProp.LF.IndProp.Moss.
  - (* to_from: to (from x) = x *)
    intro p. destruct p; apply IsomorphismDefinitions.eq_refl.
  - (* from_to: from (to x) = x *)
    intro p. destruct p; apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Person := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Person := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Person Original_LF__DOT__IndProp_LF_IndProp_Person_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Person Imported.Original_LF__DOT__IndProp_LF_IndProp_Person Original_LF__DOT__IndProp_LF_IndProp_Person_iso := {}.