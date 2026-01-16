From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__optionU_e__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_SomeE : forall x : Type, x -> imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE x := (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_SomeE).
Instance Original_LF__DOT__ImpParser_LF_ImpParser_SomeE_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso hx) (Original.LF_DOT_ImpParser.LF.ImpParser.SomeE x3) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_SomeE x4).
Proof.
  intros x1 x2 hx x3 x4 Hrel.
  unfold Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso.
  constructor.
  simpl.
  unfold imported_Original_LF__DOT__ImpParser_LF_ImpParser_SomeE.
  (* Need to show: eq (SomeE (to hx x3)) (SomeE x4) *)
  (* Hrel says: eq (to hx x3) x4 *)
  destruct Hrel.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant (@Original.LF_DOT_ImpParser.LF.ImpParser.SomeE) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_SomeE) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_ImpParser.LF.ImpParser.SomeE) Original_LF__DOT__ImpParser_LF_ImpParser_SomeE_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_ImpParser.LF.ImpParser.SomeE) (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_SomeE) Original_LF__DOT__ImpParser_LF_ImpParser_SomeE_iso := {}.