From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_person__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_ancestor__of : imported_Original_LF__DOT__IndProp_LF_IndProp_Person -> imported_Original_LF__DOT__IndProp_LF_IndProp_Person -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_ancestor__of.
Instance Original_LF__DOT__IndProp_LF_IndProp_ancestor__of_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.Person) (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_Person),
  rel_iso Original_LF__DOT__IndProp_LF_IndProp_Person_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_IndProp.LF.IndProp.Person) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_Person),
  rel_iso Original_LF__DOT__IndProp_LF_IndProp_Person_iso x3 x4 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.ancestor_of x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_ancestor__of x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.ancestor_of := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_ancestor__of := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.ancestor_of Original_LF__DOT__IndProp_LF_IndProp_ancestor__of_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.ancestor_of Imported.Original_LF__DOT__IndProp_LF_IndProp_ancestor__of Original_LF__DOT__IndProp_LF_IndProp_ancestor__of_iso := {}.