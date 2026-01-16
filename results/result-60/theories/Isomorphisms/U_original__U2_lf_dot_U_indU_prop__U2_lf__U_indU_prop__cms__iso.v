From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__cs__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__clos____refl____trans__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_cms : imported_nat -> imported_nat -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_cms.

(* cms is defined as clos_refl_trans cs *)
(* Original: cms n m := clos_refl_trans cs n m *)
(* Imported: cms n m := clos_refl_trans cs n m *)

Instance Original_LF__DOT__IndProp_LF_IndProp_cms_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.cms x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_cms x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  unfold Original.LF_DOT_IndProp.LF.IndProp.cms.
  unfold imported_Original_LF__DOT__IndProp_LF_IndProp_cms.
  (* Goal: Iso (clos_refl_trans cs x1 x3) (Imported.cms x2 x4) *)
  (* Imported.cms is clos_refl_trans applied to Imported.cs *)
  (* We can use clos_refl_trans_iso with cs_iso *)
  apply (@Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_iso nat imported_nat nat_iso 
           Original.LF_DOT_IndProp.LF.IndProp.cs 
           Imported.Original_LF__DOT__IndProp_LF_IndProp_cs
           Original_LF__DOT__IndProp_LF_IndProp_cs_iso
           x1 x2 H12 x3 x4 H34).
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.cms := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_cms := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.cms Original_LF__DOT__IndProp_LF_IndProp_cms_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.cms Imported.Original_LF__DOT__IndProp_LF_IndProp_cms Original_LF__DOT__IndProp_LF_IndProp_cms_iso := {}.