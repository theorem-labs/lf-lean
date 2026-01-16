From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__clos____refl____trans____1n__iso.

Definition imported_Original_LF_Rel_rsc__trans : forall (x : Type) (x0 : x -> x -> SProp) (x1 x2 x3 : x),
  imported_Original_LF_Rel_clos__refl__trans__1n (fun x4 x5 : x => x0 x4 x5) x1 x2 ->
  imported_Original_LF_Rel_clos__refl__trans__1n (fun x4 x5 : x => x0 x4 x5) x2 x3 -> imported_Original_LF_Rel_clos__refl__trans__1n (fun x4 x5 : x => x0 x4 x5) x1 x3 := Imported.Original_LF_Rel_rsc__trans.
Instance Original_LF_Rel_rsc__trans_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : x2 -> x2 -> SProp)
    (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) (x5 : x1) (x6 : x2) (hx1 : rel_iso hx x5 x6) 
    (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) (x11 : Original.LF.Rel.clos_refl_trans_1n x3 x5 x7)
    (x12 : imported_Original_LF_Rel_clos__refl__trans__1n (fun x x0 : x2 => x4 x x0) x6 x8),
  rel_iso
    (Original_LF_Rel_clos__refl__trans__1n_iso x3 (fun x x0 : x2 => x4 x x0)
       (fun (x13 : x1) (x14 : x2) (hx4 : rel_iso hx x13 x14) (x15 : x1) (x16 : x2) (hx5 : rel_iso hx x15 x16) => hx0 x13 x14 hx4 x15 x16 hx5) hx1 hx2)
    x11 x12 ->
  forall (x13 : Original.LF.Rel.clos_refl_trans_1n x3 x7 x9) (x14 : imported_Original_LF_Rel_clos__refl__trans__1n (fun x x0 : x2 => x4 x x0) x8 x10),
  rel_iso
    (Original_LF_Rel_clos__refl__trans__1n_iso x3 (fun x x0 : x2 => x4 x x0)
       (fun (x15 : x1) (x16 : x2) (hx5 : rel_iso hx x15 x16) (x17 : x1) (x18 : x2) (hx6 : rel_iso hx x17 x18) => hx0 x15 x16 hx5 x17 x18 hx6) hx2 hx3)
    x13 x14 ->
  rel_iso
    (Original_LF_Rel_clos__refl__trans__1n_iso x3 (fun x x0 : x2 => x4 x x0)
       (fun (x15 : x1) (x16 : x2) (hx6 : rel_iso hx x15 x16) (x17 : x1) (x18 : x2) (hx7 : rel_iso hx x17 x18) => hx0 x15 x16 hx6 x17 x18 hx7) hx1 hx3)
    (Original.LF.Rel.rsc_trans x1 x3 x5 x7 x9 x11 x13) (imported_Original_LF_Rel_rsc__trans x4 x12 x14).
Admitted.
Instance: KnownConstant Original.LF.Rel.rsc_trans := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_rsc__trans := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.rsc_trans Original_LF_Rel_rsc__trans_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.rsc_trans Imported.Original_LF_Rel_rsc__trans Original_LF_Rel_rsc__trans_iso := {}.