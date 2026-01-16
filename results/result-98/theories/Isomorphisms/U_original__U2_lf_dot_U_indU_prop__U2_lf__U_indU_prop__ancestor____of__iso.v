From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_person__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__parent____of__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__clos____trans__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_ancestor__of : imported_Original_LF__DOT__IndProp_LF_IndProp_Person -> imported_Original_LF__DOT__IndProp_LF_IndProp_Person -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_ancestor__of.

(* ancestor_of = clos_trans parent_of, so we use clos_trans_iso with parent_of_iso *)
Instance Original_LF__DOT__IndProp_LF_IndProp_ancestor__of_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.Person) (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_Person),
  rel_iso Original_LF__DOT__IndProp_LF_IndProp_Person_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_IndProp.LF.IndProp.Person) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_Person),
  rel_iso Original_LF__DOT__IndProp_LF_IndProp_Person_iso x3 x4 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.ancestor_of x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_ancestor__of x2 x4).
Proof.
  intros x1 x2 h12 x3 x4 h34.
  (* ancestor_of = clos_trans parent_of *)
  (* imported_ancestor_of = clos_trans parent_of (in SProp) *)
  unfold Original.LF_DOT_IndProp.LF.IndProp.ancestor_of.
  unfold imported_Original_LF__DOT__IndProp_LF_IndProp_ancestor__of.
  unfold Imported.Original_LF__DOT__IndProp_LF_IndProp_ancestor__of.
  apply (@Original_LF__DOT__IndProp_LF_IndProp_clos__trans_iso
           Original.LF_DOT_IndProp.LF.IndProp.Person
           imported_Original_LF__DOT__IndProp_LF_IndProp_Person
           Original_LF__DOT__IndProp_LF_IndProp_Person_iso
           Original.LF_DOT_IndProp.LF.IndProp.parent_of
           imported_Original_LF__DOT__IndProp_LF_IndProp_parent__of).
  - (* Show that parent_of is isomorphic *)
    intros p1 p2 hp1 p3 p4 hp3.
    apply Original_LF__DOT__IndProp_LF_IndProp_parent__of_iso; assumption.
  - exact h12.
  - exact h34.
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.ancestor_of := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_ancestor__of := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.ancestor_of Original_LF__DOT__IndProp_LF_IndProp_ancestor__of_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.ancestor_of Imported.Original_LF__DOT__IndProp_LF_IndProp_ancestor__of Original_LF__DOT__IndProp_LF_IndProp_ancestor__of_iso := {}.