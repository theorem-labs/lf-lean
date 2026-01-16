From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__double__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_double__incr : forall x : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Induction_LF_Induction_double (imported_S x)) (imported_S (imported_S (imported_Original_LF__DOT__Induction_LF_Induction_double x))) := Imported.Original_LF__DOT__Induction_LF_Induction_double__incr.

(* Both Original.LF_DOT_Induction.LF.Induction.double_incr and 
   Imported.Original_LF__DOT__Induction_LF_Induction_double__incr are axioms.
   The isomorphism between axioms can be established using proof irrelevance 
   since both are proofs of equivalent propositions (in SProp). *)
Instance Original_LF__DOT__Induction_LF_Induction_double__incr_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso
    {|
      to := Corelib_Init_Logic_eq_iso (Original_LF__DOT__Induction_LF_Induction_double_iso (S_iso hx)) (S_iso (S_iso (Original_LF__DOT__Induction_LF_Induction_double_iso hx)));
      from := from (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Induction_LF_Induction_double_iso (S_iso hx)) (S_iso (S_iso (Original_LF__DOT__Induction_LF_Induction_double_iso hx))));
      to_from :=
        fun
          x : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Induction_LF_Induction_double (imported_S x2))
                (imported_S (imported_S (imported_Original_LF__DOT__Induction_LF_Induction_double x2))) =>
        to_from (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Induction_LF_Induction_double_iso (S_iso hx)) (S_iso (S_iso (Original_LF__DOT__Induction_LF_Induction_double_iso hx)))) x;
      from_to :=
        fun x : Original.LF_DOT_Induction.LF.Induction.double (S x1) = S (S (Original.LF_DOT_Induction.LF.Induction.double x1)) =>
        seq_p_of_t (from_to (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Induction_LF_Induction_double_iso (S_iso hx)) (S_iso (S_iso (Original_LF__DOT__Induction_LF_Induction_double_iso hx)))) x)
    |} (Original.LF_DOT_Induction.LF.Induction.double_incr x1) (imported_Original_LF__DOT__Induction_LF_Induction_double__incr x2).
Proof.
  intros x1 x2 hx.
  (* rel_iso for an isomorphism between SProp types is trivial - the isomorphism 
     is defined by the 'to' function, and rel_iso just requires that 
     to (from x) = x, which is automatic for SProp since all proofs are equal *)
  constructor. simpl.
  (* The goal is of the form IsomorphismDefinitions.eq (to ...) (...) 
     Both sides are proofs of the same SProp proposition, so they're equal *)
  apply IsomorphismDefinitions.eq_refl.
Qed.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.double_incr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_double__incr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.double_incr Original_LF__DOT__Induction_LF_Induction_double__incr_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.double_incr Imported.Original_LF__DOT__Induction_LF_Induction_double__incr Original_LF__DOT__Induction_LF_Induction_double__incr_iso := {}.