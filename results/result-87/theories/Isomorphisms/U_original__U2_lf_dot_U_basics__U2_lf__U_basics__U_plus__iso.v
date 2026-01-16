From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__modifier__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_Plus : imported_Original_LF__DOT__Basics_LF_Basics_modifier := Imported.Original_LF__DOT__Basics_LF_Basics_Plus.
Instance Original_LF__DOT__Basics_LF_Basics_Plus_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_modifier_iso Original.LF_DOT_Basics.LF.Basics.Plus imported_Original_LF__DOT__Basics_LF_Basics_Plus.
Proof.
  constructor. unfold imported_Original_LF__DOT__Basics_LF_Basics_Plus.
  simpl. apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.Plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_Plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.Plus Original_LF__DOT__Basics_LF_Basics_Plus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.Plus Imported.Original_LF__DOT__Basics_LF_Basics_Plus Original_LF__DOT__Basics_LF_Basics_Plus_iso := {}.