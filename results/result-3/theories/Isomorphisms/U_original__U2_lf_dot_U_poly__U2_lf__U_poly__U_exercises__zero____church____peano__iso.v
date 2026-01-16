From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__zero__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero__church__peano : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero (fun x : imported_nat => imported_S x) imported_0) imported_0 := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_zero__church__peano.

(* The isomorphism is rel_iso of an Iso between Prop and SProp types.
   rel_iso (relax_Iso_Ts_Ps iso) x y means IsomorphismDefinitions.eq (to iso x) y
   Since both are equality proofs, we just need to show both sides are inhabited
   and use proof irrelevance via the isomorphism. *)
Instance Original_LF__DOT__Poly_LF_Poly_Exercises_zero__church__peano_iso : rel_iso
    (relax_Iso_Ts_Ps
       (Corelib_Init_Logic_eq_iso
          (Original_LF__DOT__Poly_LF_Poly_Exercises_zero_iso S (fun x : imported_nat => imported_S x) (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) => S_iso hx) _0_iso) _0_iso))
    Original.LF_DOT_Poly.LF.Poly.Exercises.zero_church_peano imported_Original_LF__DOT__Poly_LF_Poly_Exercises_zero__church__peano.
Proof.
  (* rel_iso for relax_Iso_Ts_Ps unfolds to: IsomorphismDefinitions.eq (to iso x) y *)
  simpl. simpl.
  (* We need to show that the 'to' of the isomorphism applied to the Original proof equals the Imported proof *)
  (* Both are proofs in SProp, so any two proofs are equal *)
  apply IsomorphismDefinitions.eq_refl.
Qed.

Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.zero_church_peano := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_zero__church__peano := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.zero_church_peano Original_LF__DOT__Poly_LF_Poly_Exercises_zero__church__peano_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.zero_church_peano Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_zero__church__peano Original_LF__DOT__Poly_LF_Poly_Exercises_zero__church__peano_iso := {}.