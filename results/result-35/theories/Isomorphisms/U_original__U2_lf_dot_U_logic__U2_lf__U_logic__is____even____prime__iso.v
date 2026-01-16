From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_is__even__prime : imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Logic_LF_Logic_is__even__prime.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_is__even__prime_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Logic.LF.Logic.is_even_prime x1) (imported_Original_LF__DOT__Logic_LF_Logic_is__even__prime x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.is_even_prime := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_is__even__prime := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.is_even_prime Original_LF__DOT__Logic_LF_Logic_is__even__prime_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.is_even_prime Imported.Original_LF__DOT__Logic_LF_Logic_is__even__prime Original_LF__DOT__Logic_LF_Logic_is__even__prime_iso := {}.