From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_grumble : Type -> Type := Imported.Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_grumble.
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_grumble_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_Poly.LF.Poly.MumbleGrumble.grumble x1) (imported_Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_grumble x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.MumbleGrumble.grumble := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_grumble := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.MumbleGrumble.grumble Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_grumble_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.MumbleGrumble.grumble Imported.Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_grumble Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_grumble_iso := {}.