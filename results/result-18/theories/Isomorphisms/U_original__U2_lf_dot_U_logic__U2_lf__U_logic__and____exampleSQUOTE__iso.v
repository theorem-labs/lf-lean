From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_nat__mul__iso Isomorphisms.U_s__iso Isomorphisms.and__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_and__example' : imported_and
    (imported_Corelib_Init_Logic_eq (imported_Nat_add (imported_S (imported_S (imported_S imported_0))) (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))))
       (imported_S (imported_S (imported_S (iterate1 imported_S 4 imported_0)))))
    (imported_Corelib_Init_Logic_eq (imported_Nat_mul (imported_S (imported_S imported_0)) (imported_S (imported_S imported_0)))
       (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0))))) := Imported.Original_LF__DOT__Logic_LF_Logic_and__example'.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_and__example'_iso : rel_iso
    (relax_Iso_Ts_Ps
       (and_iso
          (Corelib_Init_Logic_eq_iso (Nat_add_iso (S_iso (S_iso (S_iso _0_iso))) (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1 0 imported_0 _0_iso)))))
             (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 4 0 imported_0 _0_iso)))))
          (Corelib_Init_Logic_eq_iso (Nat_mul_iso (S_iso (S_iso _0_iso)) (S_iso (S_iso _0_iso))) (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1 0 imported_0 _0_iso)))))))
    Original.LF_DOT_Logic.LF.Logic.and_example' imported_Original_LF__DOT__Logic_LF_Logic_and__example'.
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.and_example' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_and__example' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.and_example' Original_LF__DOT__Logic_LF_Logic_and__example'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.and_example' Imported.Original_LF__DOT__Logic_LF_Logic_and__example' Original_LF__DOT__Logic_LF_Logic_and__example'_iso := {}.