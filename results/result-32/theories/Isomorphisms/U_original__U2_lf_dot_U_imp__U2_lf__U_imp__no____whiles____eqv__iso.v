From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
 (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__no____whiles__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__no____whilesU_r__iso Isomorphisms.iff__iso Isomorphisms.true__iso.

(* The imported_true for the imported bool type *)
Definition imported_true_bool : imported_bool := Imported.mybool_true.

Definition imported_Original_LF__DOT__Imp_LF_Imp_no__whiles__eqv : forall x : imported_Original_LF__DOT__Imp_LF_Imp_com,
  imported_iff (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Imp_LF_Imp_no__whiles x) imported_true_bool) (imported_Original_LF__DOT__Imp_LF_Imp_no__whilesR x) := Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles__eqv.

(* The main isomorphism for no_whiles_eqv *)
(* This is an axiom in Original.v (Admitted), so we just need to show the types are isomorphic *)
Instance Original_LF__DOT__Imp_LF_Imp_no__whiles__eqv_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_com) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x1 x2),
  rel_iso
    {|
      to := iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Imp_LF_Imp_no__whiles_iso hx) true_iso) (Original_LF__DOT__Imp_LF_Imp_no__whilesR_iso hx);
      from := from (iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Imp_LF_Imp_no__whiles_iso hx) true_iso) (Original_LF__DOT__Imp_LF_Imp_no__whilesR_iso hx));
      to_from :=
        fun x : imported_iff (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Imp_LF_Imp_no__whiles x2) imported_true) (imported_Original_LF__DOT__Imp_LF_Imp_no__whilesR x2) =>
        to_from (iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Imp_LF_Imp_no__whiles_iso hx) true_iso) (Original_LF__DOT__Imp_LF_Imp_no__whilesR_iso hx)) x;
      from_to :=
        fun x : Original.LF_DOT_Imp.LF.Imp.no_whiles x1 = true <-> Original.LF_DOT_Imp.LF.Imp.no_whilesR x1 =>
        seq_p_of_t (from_to (iff_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Imp_LF_Imp_no__whiles_iso hx) true_iso) (Original_LF__DOT__Imp_LF_Imp_no__whilesR_iso hx)) x)
    |} (Original.LF_DOT_Imp.LF.Imp.no_whiles_eqv x1) (imported_Original_LF__DOT__Imp_LF_Imp_no__whiles__eqv x2).
Proof.
  intros x1 x2 hx.
  (* Both no_whiles_eqv are axioms (Admitted in Original), so we just need to show the iff is isomorphic *)
  (* Since both sides are propositions in SProp, this is trivially true by proof irrelevance *)
  apply Build_rel_iso. simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.no_whiles_eqv := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles__eqv := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.no_whiles_eqv Original_LF__DOT__Imp_LF_Imp_no__whiles__eqv_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.no_whiles_eqv Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles__eqv Original_LF__DOT__Imp_LF_Imp_no__whiles__eqv_iso := {}.
