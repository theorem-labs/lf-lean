From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_disc__fn : imported_nat -> SProp := Imported.Original_LF__DOT__Logic_LF_Logic_disc__fn.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_disc__fn_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> Iso (Original.LF_DOT_Logic.LF.Logic.disc_fn x1) (imported_Original_LF__DOT__Logic_LF_Logic_disc__fn x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.disc_fn := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_disc__fn := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.disc_fn Original_LF__DOT__Logic_LF_Logic_disc__fn_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.disc_fn Imported.Original_LF__DOT__Logic_LF_Logic_disc__fn Original_LF__DOT__Logic_LF_Logic_disc__fn_iso := {}.