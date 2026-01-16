From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_not__true__iff__false : forall x : imported_Original_LF__DOT__Basics_LF_Basics_bool,
  imported_iff (imported_Corelib_Init_Logic_eq x imported_Original_LF__DOT__Basics_LF_Basics_true -> imported_False)
    (imported_Corelib_Init_Logic_eq x imported_Original_LF__DOT__Basics_LF_Basics_false) := Imported.Original_LF__DOT__Logic_LF_Logic_not__true__iff__false.
Instance Original_LF__DOT__Logic_LF_Logic_not__true__iff__false_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bool) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x1 x2),
  rel_iso
    {|
      to := iff_iso (IsoArrow (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso) False_iso) (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_false_iso);
      from :=
        from (iff_iso (IsoArrow (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso) False_iso) (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_false_iso));
      to_from :=
        fun
          x : imported_iff (imported_Corelib_Init_Logic_eq x2 imported_Original_LF__DOT__Basics_LF_Basics_true -> imported_False)
                (imported_Corelib_Init_Logic_eq x2 imported_Original_LF__DOT__Basics_LF_Basics_false) =>
        to_from (iff_iso (IsoArrow (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso) False_iso) (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_false_iso)) x;
      from_to :=
        fun x : x1 <> Original.LF_DOT_Basics.LF.Basics.true <-> x1 = Original.LF_DOT_Basics.LF.Basics.false =>
        seq_p_of_t
          (from_to
             (iff_iso (IsoArrow (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso) False_iso) (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_false_iso)) x)
    |} (Original.LF_DOT_Logic.LF.Logic.not_true_iff_false x1) (imported_Original_LF__DOT__Logic_LF_Logic_not__true__iff__false x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.not_true_iff_false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_not__true__iff__false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.not_true_iff_false Original_LF__DOT__Logic_LF_Logic_not__true__iff__false_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.not_true_iff_false Imported.Original_LF__DOT__Logic_LF_Logic_not__true__iff__false Original_LF__DOT__Logic_LF_Logic_not__true__iff__false_iso := {}.