From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__clos____refl____trans__iso Isomorphisms.U_original__U2_lf__U_rel__clos____refl____trans____1n__iso Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF_Rel_rtc__rsc__coincide : forall (x : Type) (x0 : x -> x -> SProp) (x1 x2 : x),
  imported_iff (imported_Original_LF_Rel_clos__refl__trans (fun H H0 : x => x0 H H0) x1 x2) (imported_Original_LF_Rel_clos__refl__trans__1n (fun H H0 : x => x0 H H0) x1 x2) := Imported.Original_LF_Rel_rtc__rsc__coincide.
Monomorphic Instance Original_LF_Rel_rtc__rsc__coincide_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : x2 -> x2 -> SProp)
    (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) (x5 : x1) (x6 : x2) (hx1 : rel_iso hx x5 x6) 
    (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8),
  rel_iso
    (relax_Iso_Ts_Ps
       (iff_iso
          (Original_LF_Rel_clos__refl__trans_iso x3 (fun H H0 : x2 => x4 H H0)
             (fun (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) (x11 : x1) (x12 : x2) (hx4 : rel_iso hx x11 x12) => hx0 x9 x10 hx3 x11 x12 hx4) hx1 hx2)
          (Original_LF_Rel_clos__refl__trans__1n_iso x3 (fun H H0 : x2 => x4 H H0)
             (fun (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) (x11 : x1) (x12 : x2) (hx4 : rel_iso hx x11 x12) => hx0 x9 x10 hx3 x11 x12 hx4) hx1 hx2)))
    (Original.LF.Rel.rtc_rsc_coincide x1 x3 x5 x7) (imported_Original_LF_Rel_rtc__rsc__coincide x4 x6 x8).
Admitted.
Instance: KnownConstant Original.LF.Rel.rtc_rsc_coincide := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_rtc__rsc__coincide := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.rtc_rsc_coincide Original_LF_Rel_rtc__rsc__coincide_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.rtc_rsc_coincide Imported.Original_LF_Rel_rtc__rsc__coincide Original_LF_Rel_rtc__rsc__coincide_iso := {}.