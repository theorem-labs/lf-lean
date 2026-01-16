From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)

Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time : Type := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time.

Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time_iso : Iso Original.LF_DOT_IndPrinciples.LF.IndPrinciples.time imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time.
Proof.
  apply Build_Iso with
    (to := fun x => match x with
                    | Original.LF_DOT_IndPrinciples.LF.IndPrinciples.day => Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time_day
                    | Original.LF_DOT_IndPrinciples.LF.IndPrinciples.night => Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time_night
                    end)
    (from := fun y => match y with
                      | Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time_day => Original.LF_DOT_IndPrinciples.LF.IndPrinciples.day
                      | Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time_night => Original.LF_DOT_IndPrinciples.LF.IndPrinciples.night
                      end).
  - (* to_from *)
    intros x. destruct x; apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intros x. destruct x; apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.time := {}.
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time := {}.
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.time Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.time Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time_iso := {}.
