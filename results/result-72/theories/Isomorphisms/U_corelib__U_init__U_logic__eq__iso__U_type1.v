From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso.

(* Isomorphism for equality at Type 1 (used by Church numerals) *)
Definition imported_Corelib_Init_Logic_eq_Type1 : forall x : Type, x -> x -> SProp := @Imported.Corelib_Init_Logic_eq_Type1.

(* Helper: transport along IsomorphismDefinitions.eq to construct Imported.Corelib_Init_Logic_eq_Type1 *)
Definition imported_eq_Type1_transport {A : Type} {x y z : A} 
  (H1 : IsomorphismDefinitions.eq x y) (H2 : IsomorphismDefinitions.eq x z) 
  : Imported.Corelib_Init_Logic_eq_Type1 A y z :=
  IsoEq.eq_srect (fun w => Imported.Corelib_Init_Logic_eq_Type1 A w z) 
    (IsoEq.eq_srect (fun w => Imported.Corelib_Init_Logic_eq_Type1 A x w) 
      (Imported.Corelib_Init_Logic_eq_Type1_refl A x) H2) H1.

(* Helper to convert Imported eq_Type1 to IsomorphismDefinitions eq *)
Definition imported_eq_Type1_to_iso_eq {A : Type} {x y : A} 
  (H : Imported.Corelib_Init_Logic_eq_Type1 A x y) : IsomorphismDefinitions.eq x y.
Proof.
  destruct H.
  apply IsomorphismDefinitions.eq_refl.
Defined.

(* Build the isomorphism for Corelib_Init_Logic_eq at Type 1 *)
Instance Corelib_Init_Logic_eq_Type1_iso : forall (x1 x2 : Type) (hx : @rel_iso Type Type iso_Sort x1 x2)
   (x3 : x1) (x4 : x2) (_ : @rel_iso x1 x2 (iso_of_rel_iso_iso_sort hx) x3 x4)
   (x5 : x1) (x6 : x2) (_ : @rel_iso x1 x2 (iso_of_rel_iso_iso_sort hx) x5 x6),
   Iso (@Corelib.Init.Logic.eq x1 x3 x5) (@imported_Corelib_Init_Logic_eq_Type1 x2 x4 x6).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  set (hx' := iso_of_rel_iso_iso_sort hx).
  unshelve eapply Build_Iso.
  - (* to: eq in Prop -> eq in SProp *)
    intro Heq.
    destruct Heq.
    unfold imported_Corelib_Init_Logic_eq_Type1.
    exact (imported_eq_Type1_transport H34 H56).
  - (* from: eq in SProp -> eq in Prop *)
    intro Heq.
    pose proof (from_to hx' x3) as Hx3.
    pose proof (from_to hx' x5) as Hx5.
    pose proof (IsoEq.f_equal (from hx') H34) as Hf34.
    pose proof (IsoEq.f_equal (from hx') H56) as Hf56.
    pose proof (imported_eq_Type1_to_iso_eq Heq) as HfeqHeq.
    pose proof (IsoEq.f_equal (from hx') HfeqHeq) as HfromHeq.
    apply IsoEq.eq_of_seq.
    apply (IsoEq.eq_trans (IsoEq.eq_sym Hx3)).
    apply (IsoEq.eq_trans Hf34).
    apply (IsoEq.eq_trans HfromHeq).
    apply (IsoEq.eq_trans (IsoEq.eq_sym Hf56)).
    exact Hx5.
  - (* to_from *)
    intro Heq.
    apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intro Heq.
    destruct Heq.
    apply IsomorphismDefinitions.eq_refl.
Defined.
