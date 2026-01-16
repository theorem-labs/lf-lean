From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__day__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_saturday : imported_Original_LF__DOT__Basics_LF_Basics_day := Imported.Original_LF__DOT__Basics_LF_Basics_saturday.
Instance Original_LF__DOT__Basics_LF_Basics_saturday_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_day_iso Original.LF_DOT_Basics.LF.Basics.saturday imported_Original_LF__DOT__Basics_LF_Basics_saturday.
Proof.
  constructor.
  unfold imported_Original_LF__DOT__Basics_LF_Basics_saturday.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.saturday := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_saturday := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.saturday Original_LF__DOT__Basics_LF_Basics_saturday_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.saturday Imported.Original_LF__DOT__Basics_LF_Basics_saturday Original_LF__DOT__Basics_LF_Basics_saturday_iso := {}.