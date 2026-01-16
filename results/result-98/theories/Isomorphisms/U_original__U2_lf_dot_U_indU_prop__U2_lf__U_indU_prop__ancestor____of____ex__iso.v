From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_moss__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_sage__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__ancestor____of__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_ancestor__of__ex : imported_Original_LF__DOT__IndProp_LF_IndProp_ancestor__of imported_Original_LF__DOT__IndProp_LF_IndProp_Sage imported_Original_LF__DOT__IndProp_LF_IndProp_Moss := Imported.Original_LF__DOT__IndProp_LF_IndProp_ancestor__of__ex.

(* The iso for ancestor_of_ex: it's an inhabitant of ancestor_of Sage Moss,
   so we need to use the Iso between the original and imported ancestor_of types. *)
Definition ancestor_of_Sage_Moss_iso : Iso (Original.LF_DOT_IndProp.LF.IndProp.ancestor_of Original.LF_DOT_IndProp.LF.IndProp.Sage Original.LF_DOT_IndProp.LF.IndProp.Moss) 
                                           (imported_Original_LF__DOT__IndProp_LF_IndProp_ancestor__of imported_Original_LF__DOT__IndProp_LF_IndProp_Sage imported_Original_LF__DOT__IndProp_LF_IndProp_Moss) :=
  Original_LF__DOT__IndProp_LF_IndProp_ancestor__of_iso 
    Original.LF_DOT_IndProp.LF.IndProp.Sage 
    imported_Original_LF__DOT__IndProp_LF_IndProp_Sage
    Original_LF__DOT__IndProp_LF_IndProp_Sage_iso
    Original.LF_DOT_IndProp.LF.IndProp.Moss
    imported_Original_LF__DOT__IndProp_LF_IndProp_Moss
    Original_LF__DOT__IndProp_LF_IndProp_Moss_iso.

(* ancestor_of_ex is an axiom in both Rocq and Lean, so we use Admitted to match the axiom. *)
Instance Original_LF__DOT__IndProp_LF_IndProp_ancestor__of__ex_iso : rel_iso ancestor_of_Sage_Moss_iso
    Original.LF_DOT_IndProp.LF.IndProp.ancestor_of_ex imported_Original_LF__DOT__IndProp_LF_IndProp_ancestor__of__ex.
Admitted.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.ancestor_of_ex := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_ancestor__of__ex := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.ancestor_of_ex Original_LF__DOT__IndProp_LF_IndProp_ancestor__of__ex_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.ancestor_of_ex Imported.Original_LF__DOT__IndProp_LF_IndProp_ancestor__of__ex Original_LF__DOT__IndProp_LF_IndProp_ancestor__of__ex_iso := {}.