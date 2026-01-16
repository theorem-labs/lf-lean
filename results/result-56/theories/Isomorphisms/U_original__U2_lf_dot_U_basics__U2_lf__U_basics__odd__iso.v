From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_odd : imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Basics_LF_Basics_odd.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_odd_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Basics.LF.Basics.odd x1) (imported_Original_LF__DOT__Basics_LF_Basics_odd x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.odd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_odd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.odd Original_LF__DOT__Basics_LF_Basics_odd_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.odd Imported.Original_LF__DOT__Basics_LF_Basics_odd Original_LF__DOT__Basics_LF_Basics_odd_iso := {}.