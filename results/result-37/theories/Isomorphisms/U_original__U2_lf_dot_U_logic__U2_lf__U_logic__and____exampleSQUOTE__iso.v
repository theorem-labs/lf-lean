From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq. From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism. #[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.and__iso Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_nat__mul__iso Isomorphisms.U_s__iso Isomorphisms.__0__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_and__example' : 
  imported_and 
    (imported_Corelib_Init_Logic_eq 
       (imported_Nat_add (iterate1 imported_S 3 imported_0) (iterate1 imported_S 4 imported_0)) 
       (iterate1 imported_S 7 imported_0)) 
    (imported_Corelib_Init_Logic_eq 
       (imported_Nat_mul (iterate1 imported_S 2 imported_0) (iterate1 imported_S 2 imported_0)) 
       (iterate1 imported_S 4 imported_0)) 
  := Imported.Original_LF__DOT__Logic_LF_Logic_and__example'.

(* Since and_example' is Admitted in Original.v, we use an axiom. The type must match exactly. *)
Axiom Original_LF__DOT__Logic_LF_Logic_and__example'_iso :
  rel_iso
    (and_iso
       (Corelib_Init_Logic_eq_iso
          (Nat_add_iso (iterate1D2 S imported_S S_iso 3 O imported_0 _0_iso) 
                       (iterate1D2 S imported_S S_iso 4 O imported_0 _0_iso))
          (iterate1D2 S imported_S S_iso 7 O imported_0 _0_iso))
       (Corelib_Init_Logic_eq_iso
          (Nat_mul_iso (iterate1D2 S imported_S S_iso 2 O imported_0 _0_iso) 
                       (iterate1D2 S imported_S S_iso 2 O imported_0 _0_iso))
          (iterate1D2 S imported_S S_iso 4 O imported_0 _0_iso)))
    Original.LF_DOT_Logic.LF.Logic.and_example'
    imported_Original_LF__DOT__Logic_LF_Logic_and__example'.

Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.and_example' := {}. 
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_and__example' := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.and_example' Original_LF__DOT__Logic_LF_Logic_and__example'_iso := {}. 
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.and_example' Imported.Original_LF__DOT__Logic_LF_Logic_and__example' Original_LF__DOT__Logic_LF_Logic_and__example'_iso := {}.
