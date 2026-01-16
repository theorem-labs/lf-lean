From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
#[local] Set Printing Coercions.

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__one__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one__church__peano : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one (fun x : imported_nat => imported_S x) imported_0) (imported_S imported_0) := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_one__church__peano.

(* one_church_peano is Admitted in Original.v - use axiom for isomorphism *)
Axiom Original_LF__DOT__Poly_LF_Poly_Exercises_one__church__peano_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Poly_LF_Poly_Exercises_one_iso S (fun x : imported_nat => imported_S x) (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) => S_iso hx) _0_iso) 
       (S_iso _0_iso))
    Original.LF_DOT_Poly.LF.Poly.Exercises.one_church_peano imported_Original_LF__DOT__Poly_LF_Poly_Exercises_one__church__peano.

Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.one_church_peano := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_one__church__peano := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.one_church_peano Original_LF__DOT__Poly_LF_Poly_Exercises_one__church__peano_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.one_church_peano Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_one__church__peano Original_LF__DOT__Poly_LF_Poly_Exercises_one__church__peano_iso := {}.
