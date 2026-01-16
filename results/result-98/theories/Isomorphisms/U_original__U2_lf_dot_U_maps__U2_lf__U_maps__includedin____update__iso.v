From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__includedin__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__update__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_includedin__update : forall (x : Type) (x0 x1 : imported_String_string -> imported_option x) (x2 : imported_String_string) (x3 : x),
  (forall (x4 : imported_String_string) (x5 : x), imported_Corelib_Init_Logic_eq (x0 x4) (imported_Some x5) -> imported_Corelib_Init_Logic_eq (x1 x4) (imported_Some x5)) ->
  forall (x5 : imported_String_string) (x6 : x),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Maps_LF_Maps_update (fun x4 : imported_String_string => x0 x4) x2 x3 x5) (imported_Some x6) ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Maps_LF_Maps_update (fun x4 : imported_String_string => x1 x4) x2 x3 x5) (imported_Some x6) := Imported.Original_LF__DOT__Maps_LF_Maps_includedin__update.
Instance Original_LF__DOT__Maps_LF_Maps_includedin__update_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Maps.LF.Maps.partial_map x1) (x4 : imported_String_string -> imported_option x2)
    (hx0 : forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso (option_iso hx) (x3 x5) (x4 x6)) (x5 : Original.LF_DOT_Maps.LF.Maps.partial_map x1)
    (x6 : imported_String_string -> imported_option x2) (hx1 : forall (x7 : String.string) (x8 : imported_String_string), rel_iso String_string_iso x7 x8 -> rel_iso (option_iso hx) (x5 x7) (x6 x8))
    (x7 : String.string) (x8 : imported_String_string) (hx2 : rel_iso String_string_iso x7 x8) (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) (x11 : Original.LF_DOT_Maps.LF.Maps.includedin x3 x5)
    (x12 : forall (x : imported_String_string) (x0 : x2), imported_Corelib_Init_Logic_eq (x4 x) (imported_Some x0) -> imported_Corelib_Init_Logic_eq (x6 x) (imported_Some x0)),
  (forall (x13 : String.string) (x14 : imported_String_string) (hx4 : rel_iso String_string_iso x13 x14) (x15 : x1) (x16 : x2) (hx5 : rel_iso hx x15 x16) (x17 : x3 x13 = Some x15)
     (x18 : imported_Corelib_Init_Logic_eq (x4 x14) (imported_Some x16)),
   rel_iso (Corelib_Init_Logic_eq_iso (hx0 x13 x14 hx4) (Some_iso hx5)) x17 x18 -> rel_iso (Corelib_Init_Logic_eq_iso (hx1 x13 x14 hx4) (Some_iso hx5)) (x11 x13 x15 x17) (x12 x14 x16 x18)) ->
  forall (x13 : String.string) (x14 : imported_String_string) (hx5 : rel_iso String_string_iso x13 x14) (x15 : x1) (x16 : x2) (hx6 : rel_iso hx x15 x16)
    (x17 : Original.LF_DOT_Maps.LF.Maps.update x3 x7 x9 x13 = Some x15)
    (x18 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Maps_LF_Maps_update (fun x : imported_String_string => x4 x) x8 x10 x14) (imported_Some x16)),
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Maps_LF_Maps_update_iso x3 (fun x : imported_String_string => x4 x)
          (fun (x19 : String.string) (x20 : imported_String_string) (hx7 : rel_iso String_string_iso x19 x20) => hx0 x19 x20 hx7) hx2 hx3 hx5)
       (Some_iso hx6))
    x17 x18 ->
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Maps_LF_Maps_update_iso x5 (fun x : imported_String_string => x6 x)
          (fun (x19 : String.string) (x20 : imported_String_string) (hx8 : rel_iso String_string_iso x19 x20) => hx1 x19 x20 hx8) hx2 hx3 hx5)
       (Some_iso hx6))
    (Original.LF_DOT_Maps.LF.Maps.includedin_update x1 x3 x5 x7 x9 x11 x13 x15 x17) (imported_Original_LF__DOT__Maps_LF_Maps_includedin__update x4 x6 x12 x18).
Admitted.
Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.includedin_update := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_includedin__update := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.includedin_update Original_LF__DOT__Maps_LF_Maps_includedin__update_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.includedin_update Imported.Original_LF__DOT__Maps_LF_Maps_includedin__update Original_LF__DOT__Maps_LF_Maps_includedin__update_iso := {}.