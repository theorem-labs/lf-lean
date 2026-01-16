From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* (* Typeclasses Opaque rel_iso. *) *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__U_z__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__double____bin__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_double__bin__zero : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Induction_LF_Induction_double__bin imported_Original_LF__DOT__Induction_LF_Induction_Z)
    imported_Original_LF__DOT__Induction_LF_Induction_Z := Imported.Original_LF__DOT__Induction_LF_Induction_double__bin__zero.

(* This is an axiom in the original (Admitted), so we can use the allowed axiom pattern *)
(* Both Original.LF_DOT_Induction.LF.Induction.double_bin_zero and the imported one are axioms *)
(* The isomorphism between axioms needs to be axiomatized *)
Instance Original_LF__DOT__Induction_LF_Induction_double__bin__zero_iso : rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Induction_LF_Induction_double__bin_iso Original_LF__DOT__Induction_LF_Induction_Z_iso) Original_LF__DOT__Induction_LF_Induction_Z_iso)
    Original.LF_DOT_Induction.LF.Induction.double_bin_zero imported_Original_LF__DOT__Induction_LF_Induction_double__bin__zero.
Admitted.

Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.double_bin_zero := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_double__bin__zero := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.double_bin_zero Original_LF__DOT__Induction_LF_Induction_double__bin__zero_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.double_bin_zero Imported.Original_LF__DOT__Induction_LF_Induction_double__bin__zero Original_LF__DOT__Induction_LF_Induction_double__bin__zero_iso := {}.