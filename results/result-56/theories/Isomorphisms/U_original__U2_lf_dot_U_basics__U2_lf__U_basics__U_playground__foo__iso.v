From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__rgb__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_Playground_foo : imported_Original_LF__DOT__Basics_LF_Basics_rgb := Imported.Original_LF__DOT__Basics_LF_Basics_Playground_foo.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_Playground_foo_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_rgb_iso Original.LF_DOT_Basics.LF.Basics.Playground.foo imported_Original_LF__DOT__Basics_LF_Basics_Playground_foo.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.Playground.foo := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_Playground_foo := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.Playground.foo Original_LF__DOT__Basics_LF_Basics_Playground_foo_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.Playground.foo Imported.Original_LF__DOT__Basics_LF_Basics_Playground_foo Original_LF__DOT__Basics_LF_Basics_Playground_foo_iso := {}.