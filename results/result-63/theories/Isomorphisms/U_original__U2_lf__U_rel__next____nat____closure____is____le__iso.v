From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__clos____refl____trans__iso Isomorphisms.U_original__U2_lf__U_rel__next____nat__iso Isomorphisms.iff__iso Isomorphisms.le__iso.

Definition imported_Original_LF_Rel_next__nat__closure__is__le : forall x x0 : imported_nat, imported_iff (imported_le x x0) (imported_Original_LF_Rel_clos__refl__trans (fun H H0 : imported_nat => imported_Original_LF_Rel_next__nat H H0) x x0) := Imported.Original_LF_Rel_next__nat__closure__is__le.
Instance Original_LF_Rel_next__nat__closure__is__le_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso
    {|
      to :=
        iff_iso (le_iso hx hx0)
          (Original_LF_Rel_clos__refl__trans_iso Original.LF.Rel.next_nat (fun H H0 : imported_nat => imported_Original_LF_Rel_next__nat H H0)
             (fun (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6) (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) => Original_LF_Rel_next__nat_iso hx1 hx2) hx hx0);
      from :=
        from
          (iff_iso (le_iso hx hx0)
             (Original_LF_Rel_clos__refl__trans_iso Original.LF.Rel.next_nat (fun H H0 : imported_nat => imported_Original_LF_Rel_next__nat H H0)
                (fun (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6) (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) => Original_LF_Rel_next__nat_iso hx1 hx2) hx hx0));
      to_from :=
        fun x : imported_iff (imported_le x2 x4) (imported_Original_LF_Rel_clos__refl__trans (fun H H0 : imported_nat => imported_Original_LF_Rel_next__nat H H0) x2 x4) =>
        to_from
          (iff_iso (le_iso hx hx0)
             (Original_LF_Rel_clos__refl__trans_iso Original.LF.Rel.next_nat (fun H H0 : imported_nat => imported_Original_LF_Rel_next__nat H H0)
                (fun (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6) (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) => Original_LF_Rel_next__nat_iso hx1 hx2) hx hx0))
          x;
      from_to :=
        fun x : x1 <= x3 <-> Original.LF.Rel.clos_refl_trans Original.LF.Rel.next_nat x1 x3 =>
        seq_p_of_t
          (from_to
             (iff_iso (le_iso hx hx0)
                (Original_LF_Rel_clos__refl__trans_iso Original.LF.Rel.next_nat (fun H H0 : imported_nat => imported_Original_LF_Rel_next__nat H H0)
                   (fun (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6) (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) => Original_LF_Rel_next__nat_iso hx1 hx2) hx hx0))
             x)
    |} (Original.LF.Rel.next_nat_closure_is_le x1 x3) (imported_Original_LF_Rel_next__nat__closure__is__le x2 x4).
Admitted.
Instance: KnownConstant Original.LF.Rel.next_nat_closure_is_le := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_next__nat__closure__is__le := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.next_nat_closure_is_le Original_LF_Rel_next__nat__closure__is__le_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.next_nat_closure_is_le Imported.Original_LF_Rel_next__nat__closure__is__le Original_LF_Rel_next__nat__closure__is__le_iso := {}.