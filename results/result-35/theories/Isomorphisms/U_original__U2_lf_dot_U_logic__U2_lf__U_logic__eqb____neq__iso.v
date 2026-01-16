From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_eqb__neq : forall x x0 : imported_nat,
  imported_iff (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb x x0) imported_Original_LF__DOT__Basics_LF_Basics_false)
    (imported_Corelib_Init_Logic_eq x x0 -> imported_False) := Imported.Original_LF__DOT__Logic_LF_Logic_eqb__neq.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_eqb__neq_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso
    (relax_Iso_Ts_Ps
       (iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_eqb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_false_iso) (IsoArrow (Corelib_Init_Logic_eq_iso hx hx0) False_iso)))
    (Original.LF_DOT_Logic.LF.Logic.eqb_neq x1 x3) (imported_Original_LF__DOT__Logic_LF_Logic_eqb__neq x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.eqb_neq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_eqb__neq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.eqb_neq Original_LF__DOT__Logic_LF_Logic_eqb__neq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.eqb_neq Imported.Original_LF__DOT__Logic_LF_Logic_eqb__neq Original_LF__DOT__Logic_LF_Logic_eqb__neq_iso := {}.