From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_f__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_lt__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter____comparison__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__lower____letter__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_lower__letter__lowers : forall x : imported_Original_LF__DOT__Basics_LF_Basics_letter,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_letter__comparison imported_Original_LF__DOT__Basics_LF_Basics_F x) imported_Original_LF__DOT__Basics_LF_Basics_Lt ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_letter__comparison (imported_Original_LF__DOT__Basics_LF_Basics_lower__letter x) x)
    imported_Original_LF__DOT__Basics_LF_Basics_Lt := Imported.Original_LF__DOT__Basics_LF_Basics_lower__letter__lowers.

(* lower_letter_lowers is an axiom in the original, so the isomorphism between
   the original axiom and the imported axiom is allowable. *)
Instance Original_LF__DOT__Basics_LF_Basics_lower__letter__lowers_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.letter) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_letter) (hx : rel_iso Original_LF__DOT__Basics_LF_Basics_letter_iso x1 x2)
    (x3 : Original.LF_DOT_Basics.LF.Basics.letter_comparison Original.LF_DOT_Basics.LF.Basics.F x1 = Original.LF_DOT_Basics.LF.Basics.Lt)
    (x4 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_letter__comparison imported_Original_LF__DOT__Basics_LF_Basics_F x2)
            imported_Original_LF__DOT__Basics_LF_Basics_Lt),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_letter__comparison_iso Original_LF__DOT__Basics_LF_Basics_F_iso hx) Original_LF__DOT__Basics_LF_Basics_Lt_iso) x3
    x4 ->
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_letter__comparison_iso (Original_LF__DOT__Basics_LF_Basics_lower__letter_iso hx) hx) Original_LF__DOT__Basics_LF_Basics_Lt_iso)
    (Original.LF_DOT_Basics.LF.Basics.lower_letter_lowers x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_lower__letter__lowers x2 x4).
Proof.
  intros x1 x2 hx x3 x4 Hx34.
  (* The result types are both in SProp (after relaxation), so all proofs are equal *)
  constructor. simpl.
  apply IsomorphismDefinitions.eq_refl.
Qed.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.lower_letter_lowers := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_lower__letter__lowers := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.lower_letter_lowers Original_LF__DOT__Basics_LF_Basics_lower__letter__lowers_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.lower_letter_lowers Imported.Original_LF__DOT__Basics_LF_Basics_lower__letter__lowers Original_LF__DOT__Basics_LF_Basics_lower__letter__lowers_iso := {}.