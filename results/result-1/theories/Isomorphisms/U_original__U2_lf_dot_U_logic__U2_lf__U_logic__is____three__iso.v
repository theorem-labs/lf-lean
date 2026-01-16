From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_is__three : imported_nat -> SProp := Imported.Original_LF__DOT__Logic_LF_Logic_is__three.
From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_s__iso Isomorphisms.__0__iso.

Instance Original_LF__DOT__Logic_LF_Logic_is__three_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> Iso (Original.LF_DOT_Logic.LF.Logic.is_three x1) (imported_Original_LF__DOT__Logic_LF_Logic_is__three x2).
Proof.
  intros x1 x2 hx.
  unfold Original.LF_DOT_Logic.LF.Logic.is_three.
  unfold imported_Original_LF__DOT__Logic_LF_Logic_is__three.
  unfold Imported.Original_LF__DOT__Logic_LF_Logic_is__three.
  apply (Corelib_Init_Logic_eq_iso hx (S_iso (S_iso (S_iso _0_iso)))).
Defined.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.is_three := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_is__three := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.is_three Original_LF__DOT__Logic_LF_Logic_is__three_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.is_three Imported.Original_LF__DOT__Logic_LF_Logic_is__three Original_LF__DOT__Logic_LF_Logic_is__three_iso := {}.