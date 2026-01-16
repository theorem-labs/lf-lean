From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso Isomorphisms.ex__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_dist__not__exists : forall (x : Type) (x0 : x -> SProp), (forall x1 : x, x0 x1) -> imported_ex (fun H : x => x0 H -> imported_False) -> imported_False := Imported.Original_LF__DOT__Logic_LF_Logic_dist__not__exists.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_dist__not__exists_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Prop) (x4 : x2 -> SProp) (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (x3 x5) (x4 x6)) (x5 : forall x : x1, x3 x)
    (x6 : forall x : x2, x4 x),
  (forall (x7 : x1) (x8 : x2) (hx1 : rel_iso hx x7 x8), rel_iso (hx0 x7 x8 hx1) (x5 x7) (x6 x8)) ->
  forall (x7 : exists x : x1, x3 x -> False) (x8 : imported_ex (fun H : x2 => x4 H -> imported_False)),
  rel_iso (relax_Iso_Ts_Ps (ex_iso (fun x : x1 => x3 x -> False) (fun H : x2 => x4 H -> imported_False) (fun (x9 : x1) (x10 : x2) (hx2 : rel_iso hx x9 x10) => IsoArrow (hx0 x9 x10 hx2) False_iso)))
    x7 x8 ->
  rel_iso (relax_Iso_Ts_Ps False_iso) (Original.LF_DOT_Logic.LF.Logic.dist_not_exists x1 x3 x5 x7) (imported_Original_LF__DOT__Logic_LF_Logic_dist__not__exists x4 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.dist_not_exists := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_dist__not__exists := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.dist_not_exists Original_LF__DOT__Logic_LF_Logic_dist__not__exists_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.dist_not_exists Imported.Original_LF__DOT__Logic_LF_Logic_dist__not__exists Original_LF__DOT__Logic_LF_Logic_dist__not__exists_iso := {}.