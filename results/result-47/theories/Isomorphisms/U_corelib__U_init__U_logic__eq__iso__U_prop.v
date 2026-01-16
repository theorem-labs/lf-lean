From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)

(* Don't export U_corelib__U_init__U_logic__eq__iso to avoid circular dependency *)

(* For equality over SProp, we use the imported version directly *)
Definition imported_Corelib_Init_Logic_eq_Prop : forall x : SProp, x -> x -> SProp := 
  @Imported.Corelib_Init_Logic_eq_Prop.

(* Universe polymorphic isomorphism for equality over Prop/SProp *)
(* This requires universe polymorphism between Type and SProp *)
(* Since both source (eq in Prop) and target (eq_Prop in SProp) are proof-irrelevant,
   we can build the iso using proof irrelevance *)
Definition Corelib_Init_Logic_eq_iso_Prop : forall (x1 : Type) (x2 : SProp) (hx : Iso x1 x2) (x3 : x1) (x4 : x2), @rel_iso x1 x2 hx x3 x4 -> forall (x5 : x1) (x6 : x2), @rel_iso x1 x2 hx x5 x6 ->
   Iso (@Corelib.Init.Logic.eq x1 x3 x5) (@Imported.Corelib_Init_Logic_eq_Prop x2 x4 x6).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  simpl.
  unshelve eapply Build_Iso.
  - (* to *)
    intro Heq.
    destruct Heq.
    exact (IsoEq.eq_srect (fun y => Imported.Corelib_Init_Logic_eq_Prop x2 y x6)
             (IsoEq.eq_srect (fun z => Imported.Corelib_Init_Logic_eq_Prop x2 (to hx x3) z)
                (Imported.Corelib_Init_Logic_eq_Prop_refl x2 (to hx x3))
                H56)
             H34).
  - (* from *)
    intro Heq.
    pose (Hfrom34 := from_to hx x3).
    pose (Hfrom56 := from_to hx x5).
    pose (from_x4_eq_from_x6 := Imported.Corelib_Init_Logic_eq_Prop_indl x2 x4 
            (fun y _ => IsomorphismDefinitions.eq (from hx x4) (from hx y))
            IsomorphismDefinitions.eq_refl x6 Heq).
    pose (step1 := IsoEq.f_equal (from hx) H34).
    pose (step2 := IsoEq.eq_trans step1 from_x4_eq_from_x6).
    pose (step3 := IsoEq.f_equal (from hx) (IsoEq.eq_sym H56)).
    pose (step4 := IsoEq.eq_trans step2 step3).
    pose (step5 := IsoEq.eq_trans (IsoEq.eq_sym Hfrom34) step4).
    pose (step6 := IsoEq.eq_trans step5 Hfrom56).
    exact (IsoEq.eq_of_seq step6).
  - (* to_from *)
    intro Heq.
    apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intro Heq.
    destruct Heq.
    apply sUIPt.
Defined.

#[global] Existing Instance Corelib_Init_Logic_eq_iso_Prop.
Instance: KnownConstant (@Corelib.Init.Logic.eq) := {}.
Instance: IsoStatementProofFor (@Corelib.Init.Logic.eq) Corelib_Init_Logic_eq_iso_Prop := {}.
Instance: IsoStatementProofBetween (@Corelib.Init.Logic.eq) imported_Corelib_Init_Logic_eq_Prop Corelib_Init_Logic_eq_iso_Prop := {}.
