From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor : SProp -> SProp -> SProp := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso : forall (x1 : Prop) (x2 : SProp),
  Iso x1 x2 -> forall (x3 : Prop) (x4 : SProp), Iso x3 x4 -> Iso (Original.LF_DOT_AltAuto.LF.AltAuto.nor x1 x3) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.nor := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.nor Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.nor Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso := {}.