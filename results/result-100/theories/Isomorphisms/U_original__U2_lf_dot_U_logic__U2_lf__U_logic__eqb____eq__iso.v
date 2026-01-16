From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_eqb__eq : forall x x0 : imported_nat,
  imported_iff (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb x x0) imported_Original_LF__DOT__Basics_LF_Basics_true) (imported_Corelib_Init_Logic_eq x x0) := Imported.Original_LF__DOT__Logic_LF_Logic_eqb__eq.
Instance Original_LF__DOT__Logic_LF_Logic_eqb__eq_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso
    {|
      to := iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_eqb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso) (Corelib_Init_Logic_eq_iso hx hx0);
      from := from (iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_eqb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso) (Corelib_Init_Logic_eq_iso hx hx0));
      to_from :=
        fun
          x : imported_iff (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb x2 x4) imported_Original_LF__DOT__Basics_LF_Basics_true)
                (imported_Corelib_Init_Logic_eq x2 x4) =>
        to_from (iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_eqb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso) (Corelib_Init_Logic_eq_iso hx hx0)) x;
      from_to :=
        fun x : Original.LF_DOT_Basics.LF.Basics.eqb x1 x3 = Original.LF_DOT_Basics.LF.Basics.true <-> x1 = x3 =>
        seq_p_of_t (from_to (iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_eqb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso) (Corelib_Init_Logic_eq_iso hx hx0)) x)
    |} (Original.LF_DOT_Logic.LF.Logic.eqb_eq x1 x3) (imported_Original_LF__DOT__Logic_LF_Logic_eqb__eq x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.eqb_eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_eqb__eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.eqb_eq Original_LF__DOT__Logic_LF_Logic_eqb__eq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.eqb_eq Imported.Original_LF__DOT__Logic_LF_Logic_eqb__eq Original_LF__DOT__Logic_LF_Logic_eqb__eq_iso := {}.