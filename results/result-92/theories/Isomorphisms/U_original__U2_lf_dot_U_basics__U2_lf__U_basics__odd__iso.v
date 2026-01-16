From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.nat__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__even__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__negb__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_odd : imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Basics_LF_Basics_odd.

Instance Original_LF__DOT__Basics_LF_Basics_odd_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Basics.LF.Basics.odd x1) (imported_Original_LF__DOT__Basics_LF_Basics_odd x2).
Proof.
  intros x1 x2 H.
  unfold Original.LF_DOT_Basics.LF.Basics.odd.
  unfold imported_Original_LF__DOT__Basics_LF_Basics_odd, Imported.Original_LF__DOT__Basics_LF_Basics_odd.
  apply Original_LF__DOT__Basics_LF_Basics_negb_iso.
  apply Original_LF__DOT__Basics_LF_Basics_even_iso.
  exact H.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.odd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_odd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.odd Original_LF__DOT__Basics_LF_Basics_odd_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.odd Imported.Original_LF__DOT__Basics_LF_Basics_odd Original_LF__DOT__Basics_LF_Basics_odd_iso := {}.