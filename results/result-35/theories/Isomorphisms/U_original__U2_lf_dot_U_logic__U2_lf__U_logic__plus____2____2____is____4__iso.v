From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_plus__2__2__is__4 : imported_Corelib_Init_Logic_eq (imported_Nat_add (imported_S (imported_S imported_0)) (imported_S (imported_S imported_0))) (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))) := Imported.Original_LF__DOT__Logic_LF_Logic_plus__2__2__is__4.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_plus__2__2__is__4_iso : rel_iso (Corelib_Init_Logic_eq_iso (Nat_add_iso (S_iso (S_iso _0_iso)) (S_iso (S_iso _0_iso))) (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1 0 imported_0 _0_iso)))))
    Original.LF_DOT_Logic.LF.Logic.plus_2_2_is_4 imported_Original_LF__DOT__Logic_LF_Logic_plus__2__2__is__4.
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.plus_2_2_is_4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_plus__2__2__is__4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.plus_2_2_is_4 Original_LF__DOT__Logic_LF_Logic_plus__2__2__is__4_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.plus_2_2_is_4 Imported.Original_LF__DOT__Logic_LF_Logic_plus__2__2__is__4 Original_LF__DOT__Logic_LF_Logic_plus__2__2__is__4_iso := {}.