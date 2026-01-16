From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_negb : imported_Original_LF__DOT__Basics_LF_Basics_bool -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Basics_LF_Basics_negb.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_negb_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bool) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool),
  rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Basics.LF.Basics.negb x1) (imported_Original_LF__DOT__Basics_LF_Basics_negb x2).
Proof.
  intros x1 x2 H.
  unfold rel_iso in *.
  unfold imported_Original_LF__DOT__Basics_LF_Basics_negb.
  destruct x1; simpl.
  - (* x1 = true *)
    (* H : to(true) = x2, i.e., Imported.true = x2 *)
    (* Goal: to(negb true) = negb x2, i.e., to(false) = negb x2 *)
    (* to(false) = Imported.false *)
    (* Need: Imported.false = negb x2 *)
    simpl in H.
    pose proof (IsoEq.f_equal Imported.Original_LF__DOT__Basics_LF_Basics_negb H) as H'.
    simpl in H'.
    exact H'.
  - (* x1 = false *)
    simpl in H.
    pose proof (IsoEq.f_equal Imported.Original_LF__DOT__Basics_LF_Basics_negb H) as H'.
    simpl in H'.
    exact H'.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.negb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_negb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.negb Original_LF__DOT__Basics_LF_Basics_negb_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.negb Imported.Original_LF__DOT__Basics_LF_Basics_negb Original_LF__DOT__Basics_LF_Basics_negb_iso := {}.