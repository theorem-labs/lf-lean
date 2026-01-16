From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__comparison__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_Gt : imported_Original_LF__DOT__Basics_LF_Basics_comparison := Imported.Original_LF__DOT__Basics_LF_Basics_Gt.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_Gt_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_comparison_iso Original.LF_DOT_Basics.LF.Basics.Gt imported_Original_LF__DOT__Basics_LF_Basics_Gt.
Proof.
  constructor. simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.Gt := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_Gt := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.Gt Original_LF__DOT__Basics_LF_Basics_Gt_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.Gt Imported.Original_LF__DOT__Basics_LF_Basics_Gt Original_LF__DOT__Basics_LF_Basics_Gt_iso := {}.