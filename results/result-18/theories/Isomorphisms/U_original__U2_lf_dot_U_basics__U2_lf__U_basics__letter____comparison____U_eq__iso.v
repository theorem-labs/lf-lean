From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter____comparison__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_letter__comparison__Eq : forall x : imported_Original_LF__DOT__Basics_LF_Basics_letter,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_letter__comparison x x) imported_Original_LF__DOT__Basics_LF_Basics_Eq := Imported.Original_LF__DOT__Basics_LF_Basics_letter__comparison__Eq.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_letter__comparison__Eq_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.letter) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_letter) (hx : rel_iso Original_LF__DOT__Basics_LF_Basics_letter_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_letter__comparison_iso hx hx) Original_LF__DOT__Basics_LF_Basics_Eq_iso)
    (Original.LF_DOT_Basics.LF.Basics.letter_comparison_Eq x1) (imported_Original_LF__DOT__Basics_LF_Basics_letter__comparison__Eq x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.letter_comparison_Eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_letter__comparison__Eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.letter_comparison_Eq Original_LF__DOT__Basics_LF_Basics_letter__comparison__Eq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.letter_comparison_Eq Imported.Original_LF__DOT__Basics_LF_Basics_letter__comparison__Eq Original_LF__DOT__Basics_LF_Basics_letter__comparison__Eq_iso := {}.