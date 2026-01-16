From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_plus__1__neq__0 : forall x : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb (imported_Nat_add x (imported_S imported_0)) imported_0) imported_Original_LF__DOT__Basics_LF_Basics_false := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_plus__1__neq__0.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_plus__1__neq__0_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_eqb_iso (Nat_add_iso hx (S_iso _0_iso)) _0_iso) Original_LF__DOT__Basics_LF_Basics_false_iso)
    (Original.LF_DOT_AltAuto.LF.AltAuto.plus_1_neq_0 x1) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_plus__1__neq__0 x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.plus_1_neq_0 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_plus__1__neq__0 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.plus_1_neq_0 Original_LF__DOT__AltAuto_LF_AltAuto_plus__1__neq__0_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.plus_1_neq_0 Imported.Original_LF__DOT__AltAuto_LF_AltAuto_plus__1__neq__0 Original_LF__DOT__AltAuto_LF_AltAuto_plus__1__neq__0_iso := {}.