From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original.
From IsomorphismChecker Require Imported.


Definition imported_Corelib_Init_Logic_eq_Prop : forall x : SProp, x -> x -> SProp := @Imported.Corelib_Init_Logic_eq_Prop.

(* Helper for transport in SProp *)
Definition transport_imported_eq_Prop {x2 : SProp} {a b c : x2} 
  (H1 : IsomorphismDefinitions.eq a b) (H2 : IsomorphismDefinitions.eq a c) 
  : Imported.Corelib_Init_Logic_eq_Prop x2 b c.
Proof.
  exact (IsoEq.eq_srect (fun y => Imported.Corelib_Init_Logic_eq_Prop x2 y c)
           (IsoEq.eq_srect (fun z => Imported.Corelib_Init_Logic_eq_Prop x2 a z)
              (Imported.Corelib_Init_Logic_eq_Prop_refl x2 a)
              H2)
           H1).
Defined.

Instance Corelib_Init_Logic_eq_iso_Prop : forall (x1 : Type) (x2 : SProp) (hx : Iso x1 x2) (x3 : x1) (x4 : x2), rel_iso hx x3 x4 -> forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (x3 = x5) (imported_Corelib_Init_Logic_eq_Prop x4 x6).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  destruct H34 as [H34]. destruct H56 as [H56].
  unshelve eapply Build_Iso.
  - (* to: eq in Prop -> imported eq in SProp *)
    intro Heq.
    destruct Heq.
    exact (transport_imported_eq_Prop H34 H56).
  - (* from: imported eq in SProp -> eq in Prop *)
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
  - intro Heq. apply IsomorphismDefinitions.eq_refl.
  - intro Heq. destruct Heq. apply sUIPt.
Defined.

Instance: KnownConstant (@Imported.Corelib_Init_Logic_eq_Prop) := {}.
Instance: IsoStatementProofBetween (@Corelib.Init.Logic.eq) (@Imported.Corelib_Init_Logic_eq_Prop) Corelib_Init_Logic_eq_iso_Prop := {}.
