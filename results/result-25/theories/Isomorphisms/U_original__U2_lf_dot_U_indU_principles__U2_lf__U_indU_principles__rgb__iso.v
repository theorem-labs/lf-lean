From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb : Type := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb.

(* Define the forward mapping *)
Definition rgb_to_imported (x : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.rgb) : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb :=
  match x with
  | Original.LF_DOT_IndPrinciples.LF.IndPrinciples.red => Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_red
  | Original.LF_DOT_IndPrinciples.LF.IndPrinciples.green => Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_green
  | Original.LF_DOT_IndPrinciples.LF.IndPrinciples.blue => Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_blue
  end.

(* Define the backward mapping *)
Definition imported_to_rgb (x : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb) : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.rgb :=
  match x with
  | Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_red => Original.LF_DOT_IndPrinciples.LF.IndPrinciples.red
  | Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_green => Original.LF_DOT_IndPrinciples.LF.IndPrinciples.green
  | Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_blue => Original.LF_DOT_IndPrinciples.LF.IndPrinciples.blue
  end.

Monomorphic Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_iso : Iso Original.LF_DOT_IndPrinciples.LF.IndPrinciples.rgb imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb.
Proof.
  refine (Build_Iso rgb_to_imported imported_to_rgb _ _).
  - intro x. destruct x; apply IsomorphismDefinitions.eq_refl.
  - intro x. destruct x; apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.rgb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.rgb Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.rgb Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_iso := {}.