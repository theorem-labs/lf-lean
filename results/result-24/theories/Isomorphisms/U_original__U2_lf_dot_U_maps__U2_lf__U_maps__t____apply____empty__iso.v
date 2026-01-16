From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____empty__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__Maps_LF_Maps_t__apply__empty : forall (x : Type) (x0 : imported_String_string) (x1 : x), imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Maps_LF_Maps_t__empty x1 x0) x1 := Imported.Original_LF__DOT__Maps_LF_Maps_t__apply__empty.
Monomorphic Instance Original_LF__DOT__Maps_LF_Maps_t__apply__empty_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : String.string) (x4 : imported_String_string) (hx0 : rel_iso String_string_iso x3 x4) (x5 : x1) (x6 : x2) (hx1 : rel_iso hx x5 x6),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Maps_LF_Maps_t__empty_iso hx1 hx0) hx1) (Original.LF_DOT_Maps.LF.Maps.t_apply_empty x1 x3 x5)
    (imported_Original_LF__DOT__Maps_LF_Maps_t__apply__empty x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.t_apply_empty := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_t__apply__empty := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.t_apply_empty Original_LF__DOT__Maps_LF_Maps_t__apply__empty_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.t_apply_empty Imported.Original_LF__DOT__Maps_LF_Maps_t__apply__empty Original_LF__DOT__Maps_LF_Maps_t__apply__empty_iso := {}.