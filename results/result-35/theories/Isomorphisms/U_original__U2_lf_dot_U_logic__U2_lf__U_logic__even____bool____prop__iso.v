From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__even__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_even__iso Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_even__bool__prop : forall x : imported_nat,
  imported_iff (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even x) imported_Original_LF__DOT__Basics_LF_Basics_true)
    (imported_Original_LF__DOT__Logic_LF_Logic_Even x) := Imported.Original_LF__DOT__Logic_LF_Logic_even__bool__prop.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_even__bool__prop_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso
    (relax_Iso_Ts_Ps (iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_even_iso hx) Original_LF__DOT__Basics_LF_Basics_true_iso) (Original_LF__DOT__Logic_LF_Logic_Even_iso hx)))
    (Original.LF_DOT_Logic.LF.Logic.even_bool_prop x1) (imported_Original_LF__DOT__Logic_LF_Logic_even__bool__prop x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.even_bool_prop := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_even__bool__prop := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.even_bool_prop Original_LF__DOT__Logic_LF_Logic_even__bool__prop_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.even_bool_prop Imported.Original_LF__DOT__Logic_LF_Logic_even__bool__prop Original_LF__DOT__Logic_LF_Logic_even__bool__prop_iso := {}.