From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reflect__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_eqbP : forall x x0 : imported_nat, imported_Original_LF__DOT__IndProp_LF_IndProp_reflect (imported_Corelib_Init_Logic_eq x x0) (imported_Original_LF__DOT__Basics_LF_Basics_eqb x x0) := Imported.Original_LF__DOT__IndProp_LF_IndProp_eqbP.
Instance Original_LF__DOT__IndProp_LF_IndProp_eqbP_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso (relax_Iso_Ts_Ps (Original_LF__DOT__IndProp_LF_IndProp_reflect_iso (Corelib_Init_Logic_eq_iso hx hx0) (Original_LF__DOT__Basics_LF_Basics_eqb_iso hx hx0)))
    (Original.LF_DOT_IndProp.LF.IndProp.eqbP x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_eqbP x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.eqbP := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_eqbP := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.eqbP Original_LF__DOT__IndProp_LF_IndProp_eqbP_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.eqbP Imported.Original_LF__DOT__IndProp_LF_IndProp_eqbP Original_LF__DOT__IndProp_LF_IndProp_eqbP_iso := {}.