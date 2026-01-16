From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__update__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_update__shadow : forall (x : Type) (x0 : imported_String_string -> imported_option x) (x1 : imported_String_string) (x2 x3 : x),
  imported_Corelib_Init_Logic_eq
    (fun x12 : imported_String_string =>
     imported_Original_LF__DOT__Maps_LF_Maps_update (fun x4 : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_update (fun x5 : imported_String_string => x0 x5) x1 x2 x4) x1 x3 x12)
    (fun x12 : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_update (fun x4 : imported_String_string => x0 x4) x1 x3 x12) := Imported.Original_LF__DOT__Maps_LF_Maps_update__shadow.
Instance Original_LF__DOT__Maps_LF_Maps_update__shadow_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Maps.LF.Maps.partial_map x1) (x4 : imported_String_string -> imported_option x2)
    (hx0 : forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso (option_iso hx) (x3 x5) (x4 x6)) (x5 : String.string) (x6 : imported_String_string)
    (hx1 : rel_iso String_string_iso x5 x6) (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10),
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (IsoFunND (Original.LF_DOT_Maps.LF.Maps.update (Original.LF_DOT_Maps.LF.Maps.update x3 x5 x7) x5 x9)
          (fun x12 : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_update (fun x : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_update (fun x0 : imported_String_string => x4 x0) x6 x8 x) x6 x10
             x12)
          (fun (x11 : String.string) (x12 : imported_String_string) (hx4 : rel_iso String_string_iso x11 x12) =>
           Original_LF__DOT__Maps_LF_Maps_update_iso (Original.LF_DOT_Maps.LF.Maps.update x3 x5 x7)
             (fun x : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_update (fun x0 : imported_String_string => x4 x0) x6 x8 x)
             (fun (x13 : String.string) (x14 : imported_String_string) (hx5 : rel_iso String_string_iso x13 x14) =>
              Original_LF__DOT__Maps_LF_Maps_update_iso x3 (fun x : imported_String_string => x4 x)
                (fun (x15 : String.string) (x16 : imported_String_string) (hx6 : rel_iso String_string_iso x15 x16) => hx0 x15 x16 hx6) hx1 hx2 hx5)
             hx1 hx3 hx4))
       (IsoFunND (Original.LF_DOT_Maps.LF.Maps.update x3 x5 x9)
          (fun x12 : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_update (fun x : imported_String_string => x4 x) x6 x10 x12)
          (fun (x11 : String.string) (x12 : imported_String_string) (hx4 : rel_iso String_string_iso x11 x12) =>
           Original_LF__DOT__Maps_LF_Maps_update_iso x3 (fun x : imported_String_string => x4 x)
             (fun (x13 : String.string) (x14 : imported_String_string) (hx5 : rel_iso String_string_iso x13 x14) => hx0 x13 x14 hx5) hx1 hx3 hx4)))
    (Original.LF_DOT_Maps.LF.Maps.update_shadow x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Maps_LF_Maps_update__shadow x4 x6 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.update_shadow := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_update__shadow := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.update_shadow Original_LF__DOT__Maps_LF_Maps_update__shadow_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.update_shadow Imported.Original_LF__DOT__Maps_LF_Maps_update__shadow Original_LF__DOT__Maps_LF_Maps_update__shadow_iso := {}.