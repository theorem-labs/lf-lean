From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__andb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_andb__false__r : forall x : imported_Original_LF__DOT__Basics_LF_Basics_bool,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_andb x imported_Original_LF__DOT__Basics_LF_Basics_false) imported_Original_LF__DOT__Basics_LF_Basics_false := Imported.Original_LF__DOT__Induction_LF_Induction_andb__false__r.
Instance Original_LF__DOT__Induction_LF_Induction_andb__false__r_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bool) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_andb_iso hx Original_LF__DOT__Basics_LF_Basics_false_iso) Original_LF__DOT__Basics_LF_Basics_false_iso)
    (Original.LF_DOT_Induction.LF.Induction.andb_false_r x1) (imported_Original_LF__DOT__Induction_LF_Induction_andb__false__r x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.andb_false_r := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_andb__false__r := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.andb_false_r Original_LF__DOT__Induction_LF_Induction_andb__false__r_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.andb_false_r Imported.Original_LF__DOT__Induction_LF_Induction_andb__false__r Original_LF__DOT__Induction_LF_Induction_andb__false__r_iso := {}.