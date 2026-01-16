From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__Maps_LF_Maps_t__update__eq : forall (x : Type) (x0 : imported_String_string -> x) (x1 : imported_String_string) (x2 : x),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x3 : imported_String_string => x0 x3) x1 x2 x1) x2 := Imported.Original_LF__DOT__Maps_LF_Maps_t__update__eq.
Monomorphic Instance Original_LF__DOT__Maps_LF_Maps_t__update__eq_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Maps.LF.Maps.total_map x1) (x4 : imported_String_string -> x2)
    (hx0 : forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso hx (x3 x5) (x4 x6)) (x5 : String.string) (x6 : imported_String_string)
    (hx1 : rel_iso String_string_iso x5 x6) (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8),
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (unwrap_sprop
          (Original_LF__DOT__Maps_LF_Maps_t__update_iso hx x3 (fun x : imported_String_string => x4 x)
             (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) => {| unwrap_sprop := hx0 x9 x10 hx3 |}) hx1 x7 x8 {| unwrap_sprop := hx2 |} hx1))
       hx2)
    (Original.LF_DOT_Maps.LF.Maps.t_update_eq x1 x3 x5 x7) (imported_Original_LF__DOT__Maps_LF_Maps_t__update__eq x4 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.t_update_eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_t__update__eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.t_update_eq Original_LF__DOT__Maps_LF_Maps_t__update__eq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.t_update_eq Imported.Original_LF__DOT__Maps_LF_Maps_t__update__eq Original_LF__DOT__Maps_LF_Maps_t__update__eq_iso := {}.