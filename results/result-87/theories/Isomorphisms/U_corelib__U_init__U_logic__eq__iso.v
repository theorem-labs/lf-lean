From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_true__iso.
From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso__U_prop.

Definition imported_Corelib_Init_Logic_eq : forall x : Type, x -> x -> SProp := (@Imported.Corelib_Init_Logic_eq).

(* Helper: transport along IsomorphismDefinitions.eq to construct Imported.Corelib_Init_Logic_eq *)
Definition imported_eq_transport {A : Type} {x y z : A} 
  (H1 : IsomorphismDefinitions.eq x y) (H2 : IsomorphismDefinitions.eq x z) 
  : Imported.Corelib_Init_Logic_eq A y z :=
  IsoEq.eq_srect (fun w => Imported.Corelib_Init_Logic_eq A w z) 
    (IsoEq.eq_srect (fun w => Imported.Corelib_Init_Logic_eq A x w) 
      (Imported.Corelib_Init_Logic_eq_refl A x) H2) H1.

(* Helper to convert Imported eq to IsomorphismDefinitions eq *)
Definition imported_eq_to_iso_eq {A : Type} {x y : A} 
  (H : Imported.Corelib_Init_Logic_eq A x y) : IsomorphismDefinitions.eq x y :=
  Imported.Corelib_Init_Logic_eq_indl A x 
    (fun z _ => IsomorphismDefinitions.eq x z) 
    IsomorphismDefinitions.eq_refl y H.

Instance Corelib_Init_Logic_eq_iso : (forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (_ : @rel_iso x1 x2 hx x3 x4) (x5 : x1) (x6 : x2) (_ : @rel_iso x1 x2 hx x5 x6),
   Iso (@Corelib.Init.Logic.eq x1 x3 x5) (@imported_Corelib_Init_Logic_eq x2 x4 x6)).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  unshelve eapply Build_Iso.
  - (* to: eq in Prop -> eq in SProp *)
    intro Heq.
    destruct Heq.
    unfold imported_Corelib_Init_Logic_eq.
    exact (imported_eq_transport H34 H56).
  - (* from: eq in SProp -> eq in Prop *)
    intro Heq.
    pose proof (from_to hx x3) as Hx3.
    pose proof (from_to hx x5) as Hx5.
    pose proof (IsoEq.f_equal (from hx) H34) as Hf34.
    pose proof (IsoEq.f_equal (from hx) H56) as Hf56.
    pose proof (imported_eq_to_iso_eq Heq) as HfeqHeq.
    pose proof (IsoEq.f_equal (from hx) HfeqHeq) as HfromHeq.
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

Instance: KnownConstant (@Corelib.Init.Logic.eq) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Corelib_Init_Logic_eq) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Corelib.Init.Logic.eq) Corelib_Init_Logic_eq_iso := {}.
Instance: IsoStatementProofBetween (@Corelib.Init.Logic.eq) (@Imported.Corelib_Init_Logic_eq) Corelib_Init_Logic_eq_iso := {}.