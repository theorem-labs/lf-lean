From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__existsbSQUOTE__iso Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__existsb__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_existsb__existsb' : forall (x : Type) (x0 : x -> imported_Original_LF__DOT__Basics_LF_Basics_bool) (x1 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Tactics_LF_Tactics_existsb (fun x2 : x => x0 x2) x1) (imported_Original_LF__DOT__Tactics_LF_Tactics_existsb' (fun x2 : x => x0 x2) x1) := Imported.Original_LF__DOT__Tactics_LF_Tactics_existsb__existsb'.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_existsb__existsb'_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Original.LF_DOT_Basics.LF.Basics.bool) (x4 : x2 -> imported_Original_LF__DOT__Basics_LF_Basics_bool)
    (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x3 x5) (x4 x6)) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1)
    (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Tactics_LF_Tactics_existsb_iso x3 (fun x : x2 => x4 x) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx0 x7 x8 hx2) hx1)
       (Original_LF__DOT__Tactics_LF_Tactics_existsb'_iso x3 (fun x : x2 => x4 x) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx0 x7 x8 hx2) hx1))
    (Original.LF_DOT_Tactics.LF.Tactics.existsb_existsb' x1 x3 x5) (imported_Original_LF__DOT__Tactics_LF_Tactics_existsb__existsb' x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.existsb_existsb' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_existsb__existsb' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.existsb_existsb' Original_LF__DOT__Tactics_LF_Tactics_existsb__existsb'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.existsb_existsb' Imported.Original_LF__DOT__Tactics_LF_Tactics_existsb__existsb' Original_LF__DOT__Tactics_LF_Tactics_existsb__existsb'_iso := {}.