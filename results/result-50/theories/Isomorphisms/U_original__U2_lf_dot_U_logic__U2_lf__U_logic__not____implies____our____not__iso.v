From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_not__implies__our__not : forall x : SProp, (x -> imported_False) -> forall x1 : SProp, x -> x1 := Imported.Original_LF__DOT__Logic_LF_Logic_not__implies__our__not.

Instance Original_LF__DOT__Logic_LF_Logic_not__implies__our__not_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : ~ x1) (x4 : x2 -> imported_False),
  (forall (x5 : x1) (x6 : x2),
   rel_iso hx x5 x6 ->
   rel_iso {| to := False_iso; from := from False_iso; to_from := fun x : imported_False => to_from False_iso x; from_to := fun x : False => seq_p_of_t (from_to False_iso x) |} (x3 x5) (x4 x6)) ->
  forall (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : x1) (x8 : x2),
  rel_iso hx x7 x8 -> rel_iso hx1 (Original.LF_DOT_Logic.LF.Logic.not_implies_our_not x1 x3 x5 x7) (imported_Original_LF__DOT__Logic_LF_Logic_not__implies__our__not x4 x6 x8).
Proof.
  intros x1 x2 hx x3 x4 Hx3x4 x5 x6 hx1 x7 x8 Hx7x8.
  (* x7 : x1 and x3 : ~ x1 = x1 -> False, so x3 x7 : False *)
  (* Similarly x8 : x2 and x4 : x2 -> imported_False, so x4 x8 : imported_False *)
  (* Both functions return values by eliminating False, so the results are related *)
  destruct (x3 x7).
Qed.

Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.not_implies_our_not := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_not__implies__our__not := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.not_implies_our_not Original_LF__DOT__Logic_LF_Logic_not__implies__our__not_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.not_implies_our_not Imported.Original_LF__DOT__Logic_LF_Logic_not__implies__our__not Original_LF__DOT__Logic_LF_Logic_not__implies__our__not_iso := {}.