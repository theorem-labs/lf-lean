From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.iff__iso Isomorphisms.or__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle : forall (x : SProp) (x0 : imported_Original_LF__DOT__Basics_LF_Basics_bool),
  imported_iff x (imported_Corelib_Init_Logic_eq x0 imported_Original_LF__DOT__Basics_LF_Basics_true) -> imported_or x (x -> imported_False) := Imported.Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool)
    (hx0 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4) (x5 : x1 <-> x3 = Original.LF_DOT_Basics.LF.Basics.true)
    (x6 : imported_iff x2 (imported_Corelib_Init_Logic_eq x4 imported_Original_LF__DOT__Basics_LF_Basics_true)),
  rel_iso (relax_Iso_Ts_Ps (iff_iso hx (Corelib_Init_Logic_eq_iso hx0 Original_LF__DOT__Basics_LF_Basics_true_iso))) x5 x6 ->
  rel_iso (relax_Iso_Ts_Ps (or_iso hx (IsoArrow hx False_iso))) (Original.LF_DOT_Logic.LF.Logic.restricted_excluded_middle x1 x3 x5)
    (imported_Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.restricted_excluded_middle := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.restricted_excluded_middle Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.restricted_excluded_middle Imported.Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle_iso := {}.