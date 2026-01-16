From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_mumble : Type := Imported.Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_mumble.
Instance Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_mumble_iso : Iso Original.LF_DOT_Poly.LF.Poly.MumbleGrumble.mumble imported_Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_mumble.
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.MumbleGrumble.mumble := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_mumble := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.MumbleGrumble.mumble Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_mumble_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.MumbleGrumble.mumble Imported.Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_mumble Original_LF__DOT__Poly_LF_Poly_MumbleGrumble_mumble_iso := {}.