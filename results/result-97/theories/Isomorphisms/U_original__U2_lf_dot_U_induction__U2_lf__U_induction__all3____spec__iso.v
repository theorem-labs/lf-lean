From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__andb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__negb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__orb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_all3__spec : forall x x0 : imported_Original_LF__DOT__Basics_LF_Basics_bool,
  imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Basics_LF_Basics_orb (imported_Original_LF__DOT__Basics_LF_Basics_andb x x0)
       (imported_Original_LF__DOT__Basics_LF_Basics_orb (imported_Original_LF__DOT__Basics_LF_Basics_negb x) (imported_Original_LF__DOT__Basics_LF_Basics_negb x0)))
    imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Induction_LF_Induction_all3__spec.
Instance Original_LF__DOT__Induction_LF_Induction_all3__spec_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bool) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x1 x2)
    (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx0 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4),
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Basics_LF_Basics_orb_iso (Original_LF__DOT__Basics_LF_Basics_andb_iso hx hx0)
          (Original_LF__DOT__Basics_LF_Basics_orb_iso (Original_LF__DOT__Basics_LF_Basics_negb_iso hx) (Original_LF__DOT__Basics_LF_Basics_negb_iso hx0)))
       Original_LF__DOT__Basics_LF_Basics_true_iso)
    (Original.LF_DOT_Induction.LF.Induction.all3_spec x1 x3) (imported_Original_LF__DOT__Induction_LF_Induction_all3__spec x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.all3_spec := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_all3__spec := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.all3_spec Original_LF__DOT__Induction_LF_Induction_all3__spec_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.all3_spec Imported.Original_LF__DOT__Induction_LF_Induction_all3__spec Original_LF__DOT__Induction_LF_Induction_all3__spec_iso := {}.