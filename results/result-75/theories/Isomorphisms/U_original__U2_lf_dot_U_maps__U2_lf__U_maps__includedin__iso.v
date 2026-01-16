From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_some__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__partial____map__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__Maps_LF_Maps_includedin : forall x : Type, (imported_String_string -> imported_option x) -> (imported_String_string -> imported_option x) -> SProp := fun (x : Type) (x0 x1 : imported_String_string -> imported_option x) =>
  forall (a' : imported_String_string) (a'0 : x), imported_Corelib_Init_Logic_eq (x0 a') (imported_Some a'0) -> imported_Corelib_Init_Logic_eq (x1 a') (imported_Some a'0).
Monomorphic Instance Original_LF__DOT__Maps_LF_Maps_includedin_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Maps.LF.Maps.partial_map x1) (x4 : imported_String_string -> imported_option x2),
  (forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso (option_iso hx) (x3 x5) (x4 x6)) ->
  forall (x5 : Original.LF_DOT_Maps.LF.Maps.partial_map x1) (x6 : imported_String_string -> imported_option x2),
  (forall (x7 : String.string) (x8 : imported_String_string), rel_iso String_string_iso x7 x8 -> rel_iso (option_iso hx) (x5 x7) (x6 x8)) ->
  Iso (Original.LF_DOT_Maps.LF.Maps.includedin x3 x5) (imported_Original_LF__DOT__Maps_LF_Maps_includedin x4 x6)
  := fun (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Maps.LF.Maps.partial_map x1) (x4 : imported_String_string -> imported_option x2)
    (hx0 : forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso (option_iso hx) (x3 x5) (x4 x6)) (x5 : Original.LF_DOT_Maps.LF.Maps.partial_map x1)
    (x6 : imported_String_string -> imported_option x2) (hx1 : forall (x7 : String.string) (x8 : imported_String_string), rel_iso String_string_iso x7 x8 -> rel_iso (option_iso hx) (x5 x7) (x6 x8)) =>
  IsoForall (fun a : String.string => forall v : x1, x3 a = Some v -> x5 a = Some v)
    (fun x8 : imported_String_string => forall a' : x2, imported_Corelib_Init_Logic_eq (x4 x8) (imported_Some a') -> imported_Corelib_Init_Logic_eq (x6 x8) (imported_Some a'))
    (fun (x7 : String.string) (x8 : imported_String_string) (hx2 : rel_iso String_string_iso x7 x8) =>
     IsoForall (fun a : x1 => x3 x7 = Some a -> x5 x7 = Some a)
       (fun x10 : x2 => imported_Corelib_Init_Logic_eq (x4 x8) (imported_Some x10) -> imported_Corelib_Init_Logic_eq (x6 x8) (imported_Some x10))
       (fun (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) =>
        IsoArrow (Corelib_Init_Logic_eq_iso (hx0 x7 x8 hx2) (Some_iso hx3)) (relax_Iso_Ts_Ps (Corelib_Init_Logic_eq_iso (hx1 x7 x8 hx2) (Some_iso hx3))))).

Instance: KnownConstant (@Original.LF_DOT_Maps.LF.Maps.includedin) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Maps_LF_Maps_includedin) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Maps.LF.Maps.includedin) Original_LF__DOT__Maps_LF_Maps_includedin_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Maps.LF.Maps.includedin) (@Imported.Original_LF__DOT__Maps_LF_Maps_includedin) Original_LF__DOT__Maps_LF_Maps_includedin_iso := {}.