From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__double____bin__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__incr__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_double__incr__bin : forall x : imported_Original_LF__DOT__Induction_LF_Induction_bin,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Induction_LF_Induction_double__bin (imported_Original_LF__DOT__Induction_LF_Induction_incr x))
    (imported_Original_LF__DOT__Induction_LF_Induction_incr (imported_Original_LF__DOT__Induction_LF_Induction_incr (imported_Original_LF__DOT__Induction_LF_Induction_double__bin x))) := Imported.Original_LF__DOT__Induction_LF_Induction_double__incr__bin.
Instance Original_LF__DOT__Induction_LF_Induction_double__incr__bin_iso : forall (x1 : Original.LF_DOT_Induction.LF.Induction.bin) (x2 : imported_Original_LF__DOT__Induction_LF_Induction_bin) (hx : rel_iso Original_LF__DOT__Induction_LF_Induction_bin_iso x1 x2),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Induction_LF_Induction_double__bin_iso (Original_LF__DOT__Induction_LF_Induction_incr_iso hx))
       (Original_LF__DOT__Induction_LF_Induction_incr_iso (Original_LF__DOT__Induction_LF_Induction_incr_iso (Original_LF__DOT__Induction_LF_Induction_double__bin_iso hx))))
    (Original.LF_DOT_Induction.LF.Induction.double_incr_bin x1) (imported_Original_LF__DOT__Induction_LF_Induction_double__incr__bin x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.double_incr_bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_double__incr__bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.double_incr_bin Original_LF__DOT__Induction_LF_Induction_double__incr__bin_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.double_incr_bin Imported.Original_LF__DOT__Induction_LF_Induction_double__incr__bin Original_LF__DOT__Induction_LF_Induction_double__incr__bin_iso := {}.