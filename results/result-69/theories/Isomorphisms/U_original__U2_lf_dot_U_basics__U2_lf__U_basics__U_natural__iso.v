From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__modifier__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_Natural : imported_Original_LF__DOT__Basics_LF_Basics_modifier := Imported.Original_LF__DOT__Basics_LF_Basics_Natural.

Instance Original_LF__DOT__Basics_LF_Basics_Natural_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_modifier_iso Original.LF_DOT_Basics.LF.Basics.Natural imported_Original_LF__DOT__Basics_LF_Basics_Natural.
Proof.
  constructor. simpl. unfold imported_Original_LF__DOT__Basics_LF_Basics_Natural.
  simpl.
  unfold modifier_to.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.Natural := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_Natural := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.Natural Original_LF__DOT__Basics_LF_Basics_Natural_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.Natural Imported.Original_LF__DOT__Basics_LF_Basics_Natural Original_LF__DOT__Basics_LF_Basics_Natural_iso := {}.
