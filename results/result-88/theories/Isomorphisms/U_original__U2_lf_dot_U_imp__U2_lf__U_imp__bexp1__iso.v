From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

(* Import all the required instances *)
From IsomorphismChecker Require Export 
  Isomorphisms.U_corelib__U_init__U_logic__eq__iso
  Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__beval__iso
  Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso
  Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso
  Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso
  Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_btrue__iso
  Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_bnot__iso
  Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_ble__iso
  Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_band__iso
  Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aid__iso
  Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_anum__iso
  Isomorphisms.true__iso
  Isomorphisms.nat__iso
  Isomorphisms.__0__iso
  Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_bexp1 := Imported.Original_LF__DOT__Imp_LF_Imp_bexp1.

Instance Original_LF__DOT__Imp_LF_Imp_bexp1_iso : rel_iso _ Original.LF_DOT_Imp.LF.Imp.bexp1 imported_Original_LF__DOT__Imp_LF_Imp_bexp1.
Proof. constructor. apply IsomorphismDefinitions.eq_refl. Qed.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.bexp1 := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_bexp1 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.bexp1 Original_LF__DOT__Imp_LF_Imp_bexp1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.bexp1 Imported.Original_LF__DOT__Imp_LF_Imp_bexp1 Original_LF__DOT__Imp_LF_Imp_bexp1_iso := {}.
