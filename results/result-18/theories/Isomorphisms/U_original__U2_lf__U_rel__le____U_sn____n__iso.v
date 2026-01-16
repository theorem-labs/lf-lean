From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso Isomorphisms.U_s__iso Isomorphisms.le__iso.

Monomorphic Definition imported_Original_LF_Rel_le__Sn__n : forall x : imported_nat, imported_le (imported_S x) x -> imported_False := Imported.Original_LF_Rel_le__Sn__n.
Monomorphic Instance Original_LF_Rel_le__Sn__n_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : S x1 <= x1) (x4 : imported_le (imported_S x2) x2),
  rel_iso (le_iso (S_iso hx) hx) x3 x4 -> rel_iso False_iso (Original.LF.Rel.le_Sn_n x1 x3) (imported_Original_LF_Rel_le__Sn__n x4).
Admitted.
Instance: KnownConstant Original.LF.Rel.le_Sn_n := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_le__Sn__n := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.le_Sn_n Original_LF_Rel_le__Sn__n_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.le_Sn_n Imported.Original_LF_Rel_le__Sn__n Original_LF_Rel_le__Sn__n_iso := {}.