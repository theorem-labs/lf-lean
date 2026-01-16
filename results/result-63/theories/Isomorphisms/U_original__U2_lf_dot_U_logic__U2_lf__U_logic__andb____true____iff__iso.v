From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__andb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.and__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_andb__true__iff : forall x x0 : imported_Original_LF__DOT__Basics_LF_Basics_bool,
  imported_iff (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_andb x x0) imported_Original_LF__DOT__Basics_LF_Basics_true)
    (imported_and (imported_Corelib_Init_Logic_eq x imported_Original_LF__DOT__Basics_LF_Basics_true) (imported_Corelib_Init_Logic_eq x0 imported_Original_LF__DOT__Basics_LF_Basics_true)) := Imported.Original_LF__DOT__Logic_LF_Logic_andb__true__iff.
Instance Original_LF__DOT__Logic_LF_Logic_andb__true__iff_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bool) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x1 x2)
    (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx0 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4),
  rel_iso
    {|
      to :=
        iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_andb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso)
          (and_iso (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso) (Corelib_Init_Logic_eq_iso hx0 Original_LF__DOT__Basics_LF_Basics_true_iso));
      from :=
        from
          (iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_andb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso)
             (and_iso (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso) (Corelib_Init_Logic_eq_iso hx0 Original_LF__DOT__Basics_LF_Basics_true_iso)));
      to_from :=
        fun
          x : imported_iff (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_andb x2 x4) imported_Original_LF__DOT__Basics_LF_Basics_true)
                (imported_and (imported_Corelib_Init_Logic_eq x2 imported_Original_LF__DOT__Basics_LF_Basics_true) (imported_Corelib_Init_Logic_eq x4 imported_Original_LF__DOT__Basics_LF_Basics_true)) =>
        to_from
          (iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_andb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso)
             (and_iso (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso) (Corelib_Init_Logic_eq_iso hx0 Original_LF__DOT__Basics_LF_Basics_true_iso)))
          x;
      from_to :=
        fun x : Original.LF_DOT_Basics.LF.Basics.andb x1 x3 = Original.LF_DOT_Basics.LF.Basics.true <-> x1 = Original.LF_DOT_Basics.LF.Basics.true /\ x3 = Original.LF_DOT_Basics.LF.Basics.true =>
        seq_p_of_t
          (from_to
             (iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_andb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso)
                (and_iso (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso) (Corelib_Init_Logic_eq_iso hx0 Original_LF__DOT__Basics_LF_Basics_true_iso)))
             x)
    |} (Original.LF_DOT_Logic.LF.Logic.andb_true_iff x1 x3) (imported_Original_LF__DOT__Logic_LF_Logic_andb__true__iff x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.andb_true_iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_andb__true__iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.andb_true_iff Original_LF__DOT__Logic_LF_Logic_andb__true__iff_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.andb_true_iff Imported.Original_LF__DOT__Logic_LF_Logic_andb__true__iff Original_LF__DOT__Logic_LF_Logic_andb__true__iff_iso := {}.