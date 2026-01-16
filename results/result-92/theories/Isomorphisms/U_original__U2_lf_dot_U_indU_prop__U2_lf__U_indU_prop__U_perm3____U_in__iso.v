From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
From Stdlib Require Import Logic.ProofIrrelevance.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_perm3U_reminder__U_perm3__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3__In : forall (x : Type) (x0 : x) (x1 x2 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 x1 x2 -> imported_Original_LF__DOT__Logic_LF_Logic_In x0 x1 -> imported_Original_LF__DOT__Logic_LF_Logic_In x0 x2 := Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__In.

(* Perm3_In is an Admitted axiom in Original, so we just prove the isomorphism between
   the two axiom statements. The key is that both are SProp (propositions about membership
   preservation under permutation), so we use proof irrelevance / SProp equality. *)

(* The issue is that x10 is SProp but we need to apply it to imported_Perm3_In. 
   We construct the RHS explicitly using x10. *)
   
Instance Original_LF__DOT__IndProp_LF_IndProp_Perm3__In_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (hx0 : rel_iso hx x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) (x7 : Original.LF_DOT_Poly.LF.Poly.list x1) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8) (x9 : Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.Perm3 x5 x7)
    (x10 : imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 x6 x8),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_iso hx1 hx2) x9 x10 ->
  forall (x11 : Original.LF_DOT_Logic.LF.Logic.In x3 x5) (x12 : imported_Original_LF__DOT__Logic_LF_Logic_In x4 x6),
  rel_iso (Original_LF__DOT__Logic_LF_Logic_In_iso hx0 hx1) x11 x12 ->
  rel_iso (Original_LF__DOT__Logic_LF_Logic_In_iso hx0 hx2) (Original.LF_DOT_IndProp.LF.IndProp.Perm3_In x1 x3 x5 x7 x9 x11) (Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__In x2 x4 x6 x8 x10 x12).
Proof.
  intros x1 x2 hx x3 x4 hx0 x5 x6 hx1 x7 x8 hx2 x9 x10 Hperm x11 x12 Hin.
  (* The result is an SProp (In predicate), so any two elements are equal in SProp. *)
  constructor.
  (* Both sides are SProp, so eq_refl works *)
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Perm3_In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Perm3_In Original_LF__DOT__IndProp_LF_IndProp_Perm3__In_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Perm3_In Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__In Original_LF__DOT__IndProp_LF_IndProp_Perm3__In_iso := {}.