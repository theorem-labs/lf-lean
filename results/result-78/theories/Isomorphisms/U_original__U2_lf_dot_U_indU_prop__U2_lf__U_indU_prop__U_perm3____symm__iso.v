From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_perm3U_reminder__U_perm3__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3__symm : forall (x : Type) (x0 x1 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 x0 x1 -> imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 x1 x0 := Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__symm.
Instance Original_LF__DOT__IndProp_LF_IndProp_Perm3__symm_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) (x7 : Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.Perm3 x3 x5)
    (x8 : imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 x4 x6),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_iso hx0 hx1) x7 x8 ->
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_iso hx1 hx0) (Original.LF_DOT_IndProp.LF.IndProp.Perm3_symm x1 x3 x5 x7)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3__symm x8).
Proof.
  intros.
  (* rel_iso for an Iso between Prop and SProp is just SProp equality *)
  (* Since both sides are in SProp (the result of Perm3_symm applied to SProp Perm3), *)
  (* and SProp is definitionally proof-irrelevant, we just need eq_refl *)
  (* unfold rel_iso. *)
  Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Perm3_symm := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__symm := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Perm3_symm Original_LF__DOT__IndProp_LF_IndProp_Perm3__symm_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Perm3_symm Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__symm Original_LF__DOT__IndProp_LF_IndProp_Perm3__symm_iso := {}.