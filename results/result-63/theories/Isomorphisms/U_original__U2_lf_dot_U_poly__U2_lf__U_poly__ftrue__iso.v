From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_ftrue : imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Poly_LF_Poly_ftrue.
Instance Original_LF__DOT__Poly_LF_Poly_ftrue_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Poly.LF.Poly.ftrue x1) (imported_Original_LF__DOT__Poly_LF_Poly_ftrue x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.ftrue := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_ftrue := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.ftrue Original_LF__DOT__Poly_LF_Poly_ftrue_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.ftrue Imported.Original_LF__DOT__Poly_LF_Poly_ftrue Original_LF__DOT__Poly_LF_Poly_ftrue_iso := {}.