From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bw__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_invert : imported_Original_LF__DOT__Basics_LF_Basics_bw -> imported_Original_LF__DOT__Basics_LF_Basics_bw := Imported.Original_LF__DOT__Basics_LF_Basics_invert.

(* Helper: show that invert commutes with the isomorphism *)
Lemma invert_commutes : forall x : Original.LF_DOT_Basics.LF.Basics.bw,
  bw_to_imported (Original.LF_DOT_Basics.LF.Basics.invert x) = 
  imported_Original_LF__DOT__Basics_LF_Basics_invert (bw_to_imported x).
Proof.
  intros []; reflexivity.
Defined.

Instance Original_LF__DOT__Basics_LF_Basics_invert_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bw) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bw),
  rel_iso Original_LF__DOT__Basics_LF_Basics_bw_iso x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_bw_iso (Original.LF_DOT_Basics.LF.Basics.invert x1) (imported_Original_LF__DOT__Basics_LF_Basics_invert x2).
Proof.
  intros x1 x2 Hrel.
  apply Build_rel_iso.
  destruct Hrel as [Hrel].
  simpl in *.
  (* Hrel : bw_to_imported x1 = x2 *)
  (* Goal : bw_to_imported (invert x1) = imported_invert x2 *)
  destruct x1; simpl.
  - (* x1 = bw_black *)
    (* Goal: bw_bw_white = imported_invert x2 *)
    (* Hrel: bw_bw_black = x2 *)
    destruct Hrel. apply IsomorphismDefinitions.eq_refl.
  - (* x1 = bw_white *)
    destruct Hrel. apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.invert := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_invert := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.invert Original_LF__DOT__Basics_LF_Basics_invert_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.invert Imported.Original_LF__DOT__Basics_LF_Basics_invert Original_LF__DOT__Basics_LF_Basics_invert_iso := {}.