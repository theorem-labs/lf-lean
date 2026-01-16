From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(*Typeclasses Opaque rel_iso.*) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_F : imported_Original_LF__DOT__Basics_LF_Basics_letter := Imported.Original_LF__DOT__Basics_LF_Basics_F.
Instance Original_LF__DOT__Basics_LF_Basics_F_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_letter_iso Original.LF_DOT_Basics.LF.Basics.F imported_Original_LF__DOT__Basics_LF_Basics_F.
Proof. constructor. simpl. apply IsomorphismDefinitions.eq_refl. Qed.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.F := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_F := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.F Original_LF__DOT__Basics_LF_Basics_F_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.F Imported.Original_LF__DOT__Basics_LF_Basics_F Original_LF__DOT__Basics_LF_Basics_F_iso := {}.