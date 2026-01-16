From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__Maps_LF_Maps_t__update__permute : forall (x : Type) (x0 : imported_String_string -> x) (x1 x2 : x) (x3 x4 : imported_String_string),
  (imported_Corelib_Init_Logic_eq x4 x3 -> imported_False) ->
  imported_Corelib_Init_Logic_eq
    (fun x16 : imported_String_string =>
     imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x5 : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x6 : imported_String_string => x0 x6) x4 x2 x5) x3 x1
       x16)
    (fun x16 : imported_String_string =>
     imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x5 : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x6 : imported_String_string => x0 x6) x3 x1 x5) x4 x2
       x16) := Imported.Original_LF__DOT__Maps_LF_Maps_t__update__permute.
Monomorphic Instance Original_LF__DOT__Maps_LF_Maps_t__update__permute_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Maps.LF.Maps.total_map x1) (x4 : imported_String_string -> x2)
    (hx0 : forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso hx (x3 x5) (x4 x6)) (x5 : x1) (x6 : x2) (hx1 : rel_iso hx x5 x6) 
    (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) (x11 : String.string) (x12 : imported_String_string)
    (hx4 : rel_iso String_string_iso x11 x12) (x13 : x11 <> x9) (x14 : imported_Corelib_Init_Logic_eq x12 x10 -> imported_False),
  (forall (x15 : x11 = x9) (x16 : imported_Corelib_Init_Logic_eq x12 x10), rel_iso (Corelib_Init_Logic_eq_iso hx4 hx3) x15 x16 -> rel_iso False_iso (x13 x15) (x14 x16)) ->
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (IsoFunND (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update x3 x11 x7) x9 x5)
          (fun x16 : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => x4 x0) x12 x8 x)
             x10 x6 x16)
          (fun (x15 : String.string) (x16 : imported_String_string) (hx6 : rel_iso String_string_iso x15 x16) =>
           unwrap_sprop
             (Original_LF__DOT__Maps_LF_Maps_t__update_iso hx (Original.LF_DOT_Maps.LF.Maps.t_update x3 x11 x7)
                (fun x : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => x4 x0) x12 x8 x)
                (fun (x17 : String.string) (x18 : imported_String_string) (hx7 : rel_iso String_string_iso x17 x18) =>
                 {|
                   unwrap_sprop :=
                     unwrap_sprop
                       (Original_LF__DOT__Maps_LF_Maps_t__update_iso hx x3 (fun x : imported_String_string => x4 x)
                          (fun (x19 : String.string) (x20 : imported_String_string) (hx8 : rel_iso String_string_iso x19 x20) => {| unwrap_sprop := hx0 x19 x20 hx8 |}) hx4 x7 x8
                          {| unwrap_sprop := hx2 |} hx7)
                 |})
                hx3 x5 x6 {| unwrap_sprop := hx1 |} hx6)))
       (IsoFunND (Original.LF_DOT_Maps.LF.Maps.t_update (Original.LF_DOT_Maps.LF.Maps.t_update x3 x9 x5) x11 x7)
          (fun x16 : imported_String_string =>
           imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => x4 x0) x10 x6 x)
             x12 x8 x16)
          (fun (x15 : String.string) (x16 : imported_String_string) (hx6 : rel_iso String_string_iso x15 x16) =>
           unwrap_sprop
             (Original_LF__DOT__Maps_LF_Maps_t__update_iso hx (Original.LF_DOT_Maps.LF.Maps.t_update x3 x9 x5)
                (fun x : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_t__update (fun x0 : imported_String_string => x4 x0) x10 x6 x)
                (fun (x17 : String.string) (x18 : imported_String_string) (hx7 : rel_iso String_string_iso x17 x18) =>
                 {|
                   unwrap_sprop :=
                     unwrap_sprop
                       (Original_LF__DOT__Maps_LF_Maps_t__update_iso hx x3 (fun x : imported_String_string => x4 x)
                          (fun (x19 : String.string) (x20 : imported_String_string) (hx8 : rel_iso String_string_iso x19 x20) => {| unwrap_sprop := hx0 x19 x20 hx8 |}) hx3 x5 x6
                          {| unwrap_sprop := hx1 |} hx7)
                 |})
                hx4 x7 x8 {| unwrap_sprop := hx2 |} hx6))))
    (Original.LF_DOT_Maps.LF.Maps.t_update_permute x1 x3 x5 x7 x9 x11 x13) (imported_Original_LF__DOT__Maps_LF_Maps_t__update__permute x4 x6 x8 x14).
Admitted.
Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.t_update_permute := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_t__update__permute := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.t_update_permute Original_LF__DOT__Maps_LF_Maps_t__update__permute_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.t_update_permute Imported.Original_LF__DOT__Maps_LF_Maps_t__update__permute Original_LF__DOT__Maps_LF_Maps_t__update__permute_iso := {}.