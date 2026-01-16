From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reg____exp__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_match__eps : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__IndProp_LF_IndProp_match__eps.
Instance Original_LF__DOT__IndProp_LF_IndProp_match__eps_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_IndProp.LF.IndProp.match_eps x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_match__eps x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.match_eps := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_match__eps := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.match_eps Original_LF__DOT__IndProp_LF_IndProp_match__eps_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.match_eps Imported.Original_LF__DOT__IndProp_LF_IndProp_match__eps Original_LF__DOT__IndProp_LF_IndProp_match__eps_iso := {}.